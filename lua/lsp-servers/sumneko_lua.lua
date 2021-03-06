--prvo proveriti koji je sistem u pitanju
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

--Koristiti putanju ispod ako je server instaliran preko :LspInstall
--local sumneko_root_path = vim.fn.stdpath('data')..'/lsp_servers/sumneko_lua/extension/server'

--koristiti putanju ispod ako je sumneko_lua server instaliran kao VScode ekstenzija
--[[local sumneko_root_path = 'C:/Users/Zamachi/.vscode/extensions/sumneko.lua-2.4.5/server']]
-- koristiti putanju ispod ako koristite Linux i buildujete from source sa ninja 
local sumneko_root_path = '/home/zamachi/Public/LuaLSP'
local sumneko_binary = sumneko_root_path .. "/bin/" .. system_name .. "/lua-language-server" 

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local coq = require"coq"

require('lspconfig').sumneko_lua.setup(
    coq.lsp_ensure_capabilities({
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
    )
)
