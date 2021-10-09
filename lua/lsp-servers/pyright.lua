-- potrebno je prethodno instalirati ga, i da bude dostupan na putanji
local coq = require"coq"
require('lspconfig').pyright.setup(
    coq.lsp_ensure_capabilities({})
)
