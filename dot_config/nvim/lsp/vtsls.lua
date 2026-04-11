return {
    cmd = { "vtsls", "--stdio" },
    settings = {
        vtsls = {
            autoUseWorkspaceTsdk = true,
        },
        typescript = {
            tsserver = {
                watchOptions = {
                    useFsEvents = true
                },
                experimental = {
                    enableProjectDiagnostics = true,
                },
                reportDiagnostics = false,
            },
            diagnostics = {
                workspaceAnalysis = false
            },
            format = {
                enable = false,
            }
        },
        javascript = {
            diagnostics = {
                workspaceAnalysis = false
            }
        }
    },
    root_dir = require("lspconfig.util").root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
}
