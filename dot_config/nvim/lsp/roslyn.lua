return {
    cmd = {
        "roslyn",
        "--languageserver",
        "--stdio",
    },

    filetypes = { "cs" },

    root_dir = function(fname)
        return require("lspconfig.util").root_pattern(
            "*.sln",
            "*.csproj",
            "Assets",
            "Packages"
        )(fname)
    end,

    settings = {
        ["csharp|completion"] = {
            dotnet_show_completion_items_from_unimported_namespaces = true,
            dotnet_show_name_completion_suggestions = true,
        },

        ["csharp|formatting"] = {
            dotnet_organize_imports_on_format = true,
        },
    },
}
