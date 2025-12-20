return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
    },
    config = function()
        require('telescope').setup({
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown {}
                }
            },
            defaults = {
                -- ここにTelescopeのデフォルト設定を追加できます
                -- 例: file_ignore_patterns = { "node_modules" }
            }
        })
        require("telescope").load_extension("ui-select")
    end
}
