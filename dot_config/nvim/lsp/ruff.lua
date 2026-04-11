return {
	enabled = false,
	on_attach = function(client, _)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false

		client.server_capabilities.hoverProvider = false
	end,
	settings = {
		args = {},
	},
	filetypes = { "python" },
}
