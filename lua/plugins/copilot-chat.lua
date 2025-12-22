return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "main",
        dependencies = {
            { "github/copilot.vim" },    -- or zbirenbaum/copilot.lua
            { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
        },
        opts = {
            debug = true, -- Enable debugging
            -- See Configuration section for rest
        },
        keys = {
            {
                "<leader>cc",
                ":CopilotChatToggle<CR>",
                mode = { "n", "v" },
                desc = "Toggle Copilot Chat",
            },
            {
                "<leader>ce",
                ":CopilotChatExplain<CR>",
                mode = { "n", "v" },
                desc = "Copilot Chat Explain",
            },
            {
                "<leader>ct",
                ":CopilotChatTests<CR>",
                mode = { "n", "v" },
                desc = "Copilot Chat Tests",
            },
            {
                "<leader>cf",
                ":CopilotChatFix<CR>",
                mode = { "n", "v" },
                desc = "Copilot Chat Fix",
            },
            {
                "<leader>co",
                ":CopilotChatOptimize<CR>",
                mode = { "n", "v" },
                desc = "Copilot Chat Optimize",
            },
        },
    },
}