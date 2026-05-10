return {
    settings = { Lua = {} },
    on_init = function(client)
        local join = vim.fs.joinpath
        local path = client.workspace_folders[1].name
        local luarc_path = join(path, '.luarc.json')

        local fd = io.open(luarc_path, "r")
        if fd then
            local content = fd:read("*a")
            fd:close()

            local ok, parsed_json = pcall(vim.json.decode, content)

            if ok and type(parsed_json) == "table" then
                client.config.settings.Lua = vim.tbl_deep_extend(
                    'force',
                    client.config.settings.Lua or {},
                    parsed_json
                )

                client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
                return true
            else
                vim.notify("lua_ls: Syntax error in .luarc.json", vim.log.levels.WARN)
            end
        end

        local nvim_settings = {
            telemetry = { enable = false },
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = { 'vim' } },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                    vim.fn.stdpath('config'),
                },
            },
        }

        client.config.settings.Lua = vim.tbl_deep_extend(
            'force',
            client.config.settings.Lua or {},
            nvim_settings
        )

        client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
        return true
    end,
    filetypes = { "lua" },
}
