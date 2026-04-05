return {
    cmd = { "rust-analyzer" },
    settings = {
        ["rust-analyzer"] = {
            diagnostics = { disabled = { "unlinked-file" } },
        },
    },
}
