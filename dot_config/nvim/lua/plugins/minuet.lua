return {
    "milanglacier/minuet-ai.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require('minuet').setup {
            provider = 'openai_fim_compatible',
            n_completions = 1,
            context_window = 1024,
            provider_options = {
                openai_fim_compatible = {
                    api_key = 'TERM',
                    name = 'ollama',
                    end_point = 'http://localhost:11434/v1/completions',
                    model = 'qwen2.5-coder:7b',
                    optional = {
                        max_tokens = 64,
                        top_p = 0.9,
                    },
                },
            },
        }
    end
}
