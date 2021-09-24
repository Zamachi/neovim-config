-- lightbulb prikazivanje
vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]

local lsp_config = require("lspconfig")
local lsp_installer = require("nvim-lsp-installer")
local trouble_lsp = require("trouble")
local lsp_signature = require("lsp_signature")
local lsp_status = require("lsp-status")
local lsp_colors = require("lsp-colors")
--local nvim_projectconfig = require("nvim-projectconfig") -- possibly unnecessary

--promeni znake za LSP diagnostics u gutter-u(moze se izmestiti u eksterne fajlove)
vim.fn.sign_define(
  "LspDiagnosticsSignError",
  { texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError" }
)
vim.fn.sign_define(
  "LspDiagnosticsSignWarning",
  { texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning" }
)
vim.fn.sign_define(
  "LspDiagnosticsSignHint",
  { texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint" }
)
vim.fn.sign_define(
  "LspDiagnosticsSignInformation",
  { texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation" }
)


lsp_status.config({
    indicator_errors = ' ',
    indicator_warnings = ' ',
    indicator_info = ' ',
    indicator_hint = ' ',
    indicator_ok = '﫠',
})

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

lsp_config.jsonls.setup{
    cmd = {
        'C:\\Users\\Zamachi\\node_modules\\vscode-langservers-extracted\\bin\\vscode-json-language-server', --path to server executable in cmd
        '--stdio' -- launch args
    },
    commands = {
        Format = {
            function()
                vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
            end
        }
    },
    filetypes = {"json"}
}


lsp_config.pyright.setup{
}

local system_name
    
if vim.fn.has('mac') == 1 then
    system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
    system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
    system_name = "Windows"
else 
    system_name = "Unsupported"
end

--sumneko zahteva posebnu konfiguraciju na Windowsu(apparently)
--ovaj root path je mozda drugaciji na drugim platformama(Linux/Mac), proveriti?
local sumneko_root_path = vim.fn.stdpath('data')..'/lsp_servers/sumneko_lua/extension/server'
local sumneko_binary = sumneko_root_path .. "/bin/" .. system_name .. "/lua-language-server" 

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lsp_config.sumneko_lua.setup{
    cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" };
    settings = {
	Lua = {
	    runtime = {
		version="LuaJIT",
		path = runtime_path,
		},
	    diagnostics = {
		globals = {'vim'},
	    },
	    workspace = {
		library = vim.api.nvim_get_runtime_file("", true),
	    },
	    telemetry = { enable = false }
	}
    }
}

lsp_signature.setup({
    bind = true,
    floating_window = true,
    hint_enable = true,
    hint_prefix = "🐼 ",
    hint_scheme = "String",
    handler_opts = { border = "shadow" },
    zindex = 200,
    padding = ' ',
    shadow_blend = 36,
    shadow_guibg = "#999999",
    --fix_pos=false,
    --hi_parameter = "Search",
    --max_height = 12,
    --max_width=120,
    --trigger_on_newline=false,
    --log_path="path",
    --debug=false
})

trouble_lsp.setup({ -- trouble can also integrate with Telescope(put in plugin_setups)
	position = "bottom",
    icons=true,
    mode = "lsp_workspace_diagnostics",
    fold_open = "", -- icon used for open folds
    fold_closed = "", -- icon used for closed folds
       signs = {
        -- icons / text used for a diagnostic
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "﫠"
    },
    indent_lines=true, 
    use_lsp_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
})

lsp_colors.setup({
    Error = "#AA0000",
    Warning = "#e0af68",
    Information = "#00A0FF",
    Hint = "#00FF00"
})

-- Ovo bi trebalo automatski da ocita konfiguraciju projekta kada se promeni current working directory
vim.cmd[[
augroup NvimProjectConfig
 autocmd!
 autocmd DirChanged * lua require('nvim-projectconfig').load_project_config()
augroup end
]]


