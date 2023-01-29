local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "Cu34v0.lsp.mason"
require("Cu34v0.lsp.handlers").setup()
require "Cu34v0.lsp.null-ls"
