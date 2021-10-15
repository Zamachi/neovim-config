local lsp_config = require("lspconfig")
local lsp_installer = require("nvim-lsp-installer")
local trouble_lsp = require("trouble")
local lsp_signature = require("lsp_signature")
local lsp_colors = require("lsp-colors")
--local nvim_projectconfig = require("nvim-projectconfig") -- possibly unnecessary
local lsp_saga = require('lspsaga')


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

require('lsp-servers/pyright')
require('lsp-servers/sumneko_lua')
require('lsp-servers/jsonls')

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
    Error = "#CC0000",
    Warning = "#CCCC00",
    Information = "#00A0FF",
    Hint = "#00FF00"
})

lsp_saga.init_lsp_saga{
    use_saga_diagnostic_sign = false,
    code_action_prompt = {
        enable = false
    },
    code_action_keys = {
        quit = 'q',
        exec = '<CR>'
    },
    rename_action_keys = {
        quit = "q",
        exec = "<CR>"
    }
}

-- Ovo bi trebalo automatski da ocita konfiguraciju projekta kada se promeni current working directory
vim.cmd[[
augroup NvimProjectConfig
 autocmd!
 autocmd DirChanged * lua require('nvim-projectconfig').load_project_config()
augroup end
]]


