return {
    settings = {
        basedpyright = {
            analysis = {
                autoSearchPaths = false,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
                typeCheckingMode = "standard",
                autoImportCompletions = true,
                extraPaths = { "." }
            }
        }
    },
    filetypes = { "python" }
}
