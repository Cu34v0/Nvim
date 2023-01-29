local configs = require("nvim-treesitter.configs")
configs.setup {
  ensure_installed = "all",
  sync_install = false,
  ignore_install = { "" }, -- Lista de los lenguajes a ignorar 
  highlight = {
    enable = true, -- false elimina la ejecución automática 
    disable = { "" }, -- Lista de los lenguajes que serán deshabilitados 
    additional_vim_regex_highlighting = true,

  },
  indent = { enable = true, disable = { "yaml" } },
}
