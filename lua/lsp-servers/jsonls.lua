-- konfiguracija za JSON language server(WINDOWS)
local coq = require"coq"
require('lspconfig').jsonls.setup(
    coq.lsp_ensure_capabilities({
    cmd = {
        --promeniti putanju u zavisnosti od sistema
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

})
)

