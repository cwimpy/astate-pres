--- astate-authors.lua
--- Quarto Lua filter for the AState Beamer theme.
--- Converts structured YAML metadata into LaTeX theme commands:
---   author → \authorblock{Name}{Affiliations}
---   conference → \conference{Name}
---   footer → \setAStateFooter{text}
---   logo → \setAStateLogo{file}

--- Escape special LaTeX characters in a string
local function latex_escape(s)
  s = s:gsub("&", "\\&")
  s = s:gsub("%%", "\\%%")
  s = s:gsub("#", "\\#")
  return s
end

--- Extract affiliations from various Quarto metadata structures
local function get_affiliations(author)
  local affil_lines = {}

  -- Try direct affiliations on the author
  if author.affiliations then
    for _, aff in ipairs(author.affiliations) do
      local aff_name
      if type(aff) == "table" and aff.name then
        aff_name = pandoc.utils.stringify(aff.name)
      elseif type(aff) == "table" and aff.text then
        aff_name = pandoc.utils.stringify(aff.text)
      else
        aff_name = pandoc.utils.stringify(aff)
      end
      if aff_name and aff_name ~= "" then
        table.insert(affil_lines, latex_escape(aff_name))
      end
    end
  end

  -- Try author.affiliation (singular) used by some Quarto versions
  if #affil_lines == 0 and author.affiliation then
    for _, aff in ipairs(author.affiliation) do
      local aff_name = pandoc.utils.stringify(aff.name or aff)
      if aff_name and aff_name ~= "" then
        table.insert(affil_lines, latex_escape(aff_name))
      end
    end
  end

  return affil_lines
end

function Meta(meta)
  local header = meta['header-includes'] or pandoc.List()

  -- Process authors into \authorblock commands
  -- Quarto normalizes authors into 'by-author' with full affiliation details
  local authors = meta['by-author'] or meta.author
  if authors then
    local blocks = {}
    local short_names = {}

    for _, author in ipairs(authors) do
      local name
      if type(author) == "table" and author.name then
        if type(author.name) == "table" and author.name.literal then
          name = pandoc.utils.stringify(author.name.literal)
        else
          name = pandoc.utils.stringify(author.name)
        end
      else
        name = pandoc.utils.stringify(author)
      end
      name = latex_escape(name)

      -- Extract last name for the short author list
      local last = name:match("(%S+)$") or name
      table.insert(short_names, last)

      -- Build affiliation lines
      local affil_lines = get_affiliations(author)

      -- Optional ORCID iD — renders a clickable icon next to the name
      local orcid = ""
      if author.orcid then
        orcid = pandoc.utils.stringify(author.orcid)
      end

      local affil_str = table.concat(affil_lines, "\\\\\n    ")
      table.insert(blocks, string.format(
        "\\authorblock[%s]{%s}{%%\n    %s%%\n  }", orcid, name, affil_str))
    end

    -- Build short author string (used only if the YAML `footer:` isn't set;
    -- our theme's \setAStateFooter usually overrides this anyway).
    local short
    if #short_names <= 2 then
      short = table.concat(short_names, " \\& ")
    else
      short = short_names[1] .. " et al."
    end

    local full = table.concat(blocks, "\\\\[0.3em]\n  ")

    -- Quarto's template emits its own \author{<first-author name>} from
    -- by-author, which would overwrite anything we set earlier.  We
    -- re-declare \author via \AtBeginDocument so our \authorblock calls
    -- are the ones the title page renders.
    local author_override = string.format(
      "\\AtBeginDocument{\\author[%s]{%%\n  %s%%\n}}", short, full)
    table.insert(header, pandoc.RawBlock('latex', author_override))
  end

  -- Date — preserve user's string format, prevent Quarto ISO reformatting
  if meta.date then
    local date_str = pandoc.utils.stringify(meta.date)
    local y, m, d = date_str:match("^(%d%d%d%d)-(%d%d)-(%d%d)$")
    if y then
      local months = {"January","February","March","April","May","June",
                      "July","August","September","October","November","December"}
      date_str = months[tonumber(m)] .. " " .. tonumber(d) .. ", " .. y
      meta.date = pandoc.Inlines(pandoc.Str(date_str))
    end
  end

  -- Conference name
  if meta.conference then
    local conf = latex_escape(pandoc.utils.stringify(meta.conference))
    table.insert(header, pandoc.RawBlock('latex',
      string.format("\\conference{%s}", conf)))
  end

  -- Footer text
  if meta.footer then
    local footer = latex_escape(pandoc.utils.stringify(meta.footer))
    table.insert(header, pandoc.RawBlock('latex',
      string.format("\\setAStateFooter{%s}", footer)))
    meta.footer = nil
  end

  -- Logo — handle via our theme command, clear so Quarto doesn't duplicate
  if meta.logo then
    local logo = pandoc.utils.stringify(meta.logo)
    table.insert(header, pandoc.RawBlock('latex',
      string.format("\\setAStateLogo{%s}", logo)))
    meta.logo = nil
  end

  meta['header-includes'] = header
  return meta
end
