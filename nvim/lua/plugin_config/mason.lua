local mason_present, mason = pcall(require, 'mason')
if not mason_present then
  return
end
local mason_lsp_present, mason_lsp = pcall(require, 'mason-lspconfig')
if not mason_lsp_present then
  return
end

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

mason_lsp.setup()
