local colorscheme = "tokyonight-night"

-- Variantes del tema tokyonight
--colorscheme tokyonight
--
-- There are also colorschemes for the different styles
--colorscheme tokyonight-night
--colorscheme tokyonight-storm
--colorscheme tokyonight-day
--colorscheme tokyonight-moon

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return("Tema no encontrado") 
end
