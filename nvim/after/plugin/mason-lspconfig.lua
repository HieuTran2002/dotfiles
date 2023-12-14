require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {"lua_ls", "pylsp", "clangd"}
})

require ('mason-nvim-dap').setup({
    handlers = {}, -- sets up dap in the predefined manner
})
