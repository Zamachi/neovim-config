-- lightbulb prikazivanje
vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]


local lsp_config = require("lspconfig")
local lsp_installer = require("nvim-lsp-installer")
local trouble_lsp = require("trouble")

--lsp_installer.on_server_ready(function(server)
--	    local opts = {}

	        -- (optional) Customize the options passed to the server
		--     -- if server.name == "tsserver" then
		--         --     opts.root_dir = function() ... end
		--             -- end
		--
		--                 -- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
--	server:setup(opts)
--	vim.cmd [[ do User LspAttachBuffers ]]
--end)

lsp_config.pyright.setup{
	
}

trouble_lsp.setup({ -- trouble can also integrate with Telescope(put in plugin_setups)
	position = "bottom"
})
