local module = {}

local function tab_title(tab_info)
  local title = tab_info.tab_title
  if title and #title > 0 then
    return title
  end
  return tab_info.active_pane.title
end

function module.set_tab_theme(tab, _, _, _, hover, _)
  local edge_background = '#0B0022'
  local background = '#242424'
  local foreground = '#878787'

  if tab.is_active then
    background = '#3A3A3A'
    foreground = '#FFFFFF'
  elseif hover then
    background = '#3F3F3F'
    foreground = '#FFFFFF'
  end

  local edge_foreground = background

  local title = tab_title(tab)

  return {
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title },
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
  }
end

return module
