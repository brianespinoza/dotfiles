return {
    "frankroeder/parrot.nvim",
    event = "BufReadPre",
    dependencies = { 'ibhagwan/fzf-lua', 'nvim-lua/plenary.nvim' },
    -- optionally include "folke/noice.nvim" or "rcarriga/nvim-notify" for beautiful notifications
    opts = {
        providers = {
            -- anthropic = {
            --     api_key = os.getenv "ANTHROPIC_API_KEY",
            -- },
            -- gemini = {
            --     api_key = os.getenv "GEMINI_API_KEY",
            -- },
            -- groq = {
            --     api_key = os.getenv "GROQ_API_KEY",
            -- },
            -- mistral = {
            --     api_key = os.getenv "MISTRAL_API_KEY",
            -- },
            -- pplx = {
            --     api_key = os.getenv "PERPLEXITY_API_KEY",
            -- },
            -- -- provide an empty list to make provider available (no API key required)
            -- ollama = {},
            openai = {
                api_key = ""
            }
            -- github = {
            --     api_key = os.getenv "GITHUB_TOKEN",
            -- },
            -- nvidia = {
            --     api_key = os.getenv "NVIDIA_API_KEY",
            -- },
            -- xai = {
            --     api_key = os.getenv "XAI_API_KEY",
            -- },
        },
    },
    keys = {
        { "<leader>pt", "<cmd>PrtChatToggle<cr>", desc = "Parrot: Toggle chat" },
        { "<leader>pn", "<cmd>PrtChatNew<cr>", desc = "Parrot: Chat new" },
        { "<leader>pa", "<cmd>PrtAsk<cr>", desc = "Parrot: Toggle ask" },
        { "<leader>pr", "<cmd>PrtChatResponde<cr>", desc = "Parrot: Chat response" },
        { "<leader>pp", ":'<,'>PrtChatPaste<cr>", mode = "v", desc = "Parrot: Chat paste" },
    }
}

-- | Command                   | Description                                   |
-- | ------------------------- | ----------------------------------------------|
-- | `PrtChatNew <target>`     | Open a new chat                               |
-- | `PrtChatToggle <target>`  | Toggle chat (open last chat or new one)       |
-- | `PrtChatPaste <target>`   | Paste visual selection into the latest chat   |
-- | `PrtInfo`                 | Print plugin config                           |
-- | `PrtContext <target>`     | Edits the local context file                  |
-- | `PrtChatFinder`           | Fuzzy search chat files using fzf             |
-- | `PrtChatDelete`           | Delete the current chat file                  |
-- | `PrtChatRespond`          | Trigger chat respond (in chat file)           |
-- | `PrtStop`                 | Interrupt ongoing respond                     |
-- | `PrtProvider <provider>`  | Switch the provider (empty arg triggers fzf)  |
-- | `PrtModel <model>`        | Switch the model (empty arg triggers fzf)     |
-- | `PrtStatus`               | Prints current provider and model selection   |
-- | `PrtThinking`             | Toggle or configure thinking mode for supported providers    |
-- |  __Interactive__          | |
-- | `PrtRewrite`              | Rewrites the visual selection based on a provided prompt |
-- | `PrtEdit`                 | Like `PrtRewrite` but you can change the last prompt |
-- | `PrtAppend`               | Append text to the visual selection based on a provided prompt    |
-- | `PrtPrepend`              | Prepend text to the visual selection based on a provided prompt   |
-- | `PrtNew`                  | Prompt the model to respond in a new window   |
-- | `PrtEnew`                 | Prompt the model to respond in a new buffer   |
-- | `PrtVnew`                 | Prompt the model to respond in a vsplit       |
-- | `PrtTabnew`               | Prompt the model to respond in a new tab      |
-- | `PrtRetry`                | Repeats the last rewrite/append/prepend       |
-- |  __Example Hooks__        | |
-- | `PrtImplement`            | Takes the visual selection as prompt to generate code |
-- | `PrtAsk`                  | Ask the model a question                      |
