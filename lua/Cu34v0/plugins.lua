local fn = vim.fn

-- Instalar packer automáticamente
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Instalando packer cerrar y reabrir Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Comando automático que recarga neovim cada vez que guarda el archivo plugins.lua
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use una llamada protegida para que no cometamos errores en el primer uso
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return("Ha ocurrido un error en al archivo plugins.lua")
end

-- Haga que packer use una ventana emergente
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Instala tus plugins aquí
return packer.startup(function(use)
  -- Mis plugins 
  use "wbthomason/packer.nvim" -- Instalación de packer
  use "nvim-lua/popup.nvim" -- Una implementación de la Popup API de vim en Neovim
  use "nvim-lua/plenary.nvim" -- Funciones útiles de lua usadas en muchos complementos


  use 'ethanholz/nvim-lastplace' -- Continuar en el último punto de edición donde nos quedamos

  use {
  'nvim-tree/nvim-tree.lua',     -- Árbol de archivos y directorios
  requires = {
    'nvim-tree/nvim-web-devicons', -- Opcional para iconos 
  },
  tag = 'nightly'
}

  use 'folke/tokyonight.nvim' -- Tema tokyonight

  use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
}

 -- Plugins de cmp
  use "hrsh7th/nvim-cmp" -- El plugin de completado
  use "hrsh7th/cmp-buffer" -- Completado de buffer 
  use "hrsh7th/cmp-path" -- Completion de path
  use "hrsh7th/cmp-cmdline" -- Completado de cmdline 
  use "saadparwaiz1/cmp_luasnip" -- Completado de snippets
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- snippets
  use "L3MON4D3/LuaSnip" -- motor de snippets 
  use "rafamadriz/friendly-snippets" --  un montón de snippets para usar

  use "ap/vim-buftabline" -- Organiza los buffers abiertos en formas de pestañas

  -- LSP
  use "neovim/nvim-lspconfig" -- Habilita LSP
  use "williamboman/mason.nvim" -- instalador de servidor de idioma fácil de usar
  use "williamboman/mason-lspconfig.nvim" -- instalador de servidor de idioma fácil de usar
  use 'jose-elias-alvarez/null-ls.nvim' -- Diagnósticos LSP y acciones de código

-- Telescope
  use "nvim-telescope/telescope.nvim"   -- Buscador de archivos
  use 'nvim-telescope/telescope-media-files.nvim'

  use 'norcalli/nvim-colorizer.lua'   -- Resaltado de colores

-- Treesitter
  use "nvim-treesitter/nvim-treesitter" -- Colores en la sintaxis

  -- LuaLine
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }


  use 'lewis6991/impatient.nvim' -- Optimiza el inicio de nvim

  use 'terrortylor/nvim-comment' -- Comentarios en varios lenguajes

  -- Configure automáticamente su configuración después de clonar packer.nvim
  -- Pon esto al final después de todos los complementos.
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
