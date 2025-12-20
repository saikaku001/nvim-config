local opts = { noremap = true, silent = true }

-- jk でインサートモードを抜ける
vim.keymap.set('i', '<leader>jk', '<ESC>', opts)

-- 検索ハイライトを消す (Leader + h)
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>', opts)

-- ファイル保存 (Leader + w)
vim.keymap.set('n', '<leader>w', ':w<CR>', opts)

-- ウィンドウ間の移動（Ctrl + H/J/K/L）
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- バッファの移動 (Shift + h/l)
vim.keymap.set('n', '<S-h>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<S-l>', ':bnext<CR>', opts)

-- バッファを閉じる (Leader + c)
vim.keymap.set('n', '<leader>c', ':bdelete<CR>', opts)

-- 全終了 (Leader + q)
vim.keymap.set('n', '<leader>q', ':qa<CR>', opts)

-- 選択範囲をインデント（< や >）する際、選択範囲を維持する
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- ビジュアルモードで行を移動 (J/K)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- クリップボード操作 (Leader + y/p)
-- システムクリップボードへのコピー
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', opts)
-- システムクリップボードからのペースト
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p', opts)

-- x で文字を削除したときにレジスタに入れない
vim.keymap.set('n', 'x', '"_x', opts)

-- ToggleTerm
-- ターミナルの開閉 (Ctrl + \)
vim.keymap.set({ 'n', 't' }, '<C-t>', '<cmd>ToggleTerm<CR>', opts)

-- ターミナルモードでの操作
-- Esc または jk でターミナルモードから抜ける
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
vim.keymap.set('t', '<leader>jk', [[<C-\><C-n>]], opts)

-- ターミナルウィンドウ間の移動
vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)

-- Telescope
-- ファイル検索 (Leader + ff)
vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files() end, opts)
-- 文字列検索 (Leader + fg)
vim.keymap.set('n', '<leader>fg', function() require('telescope.builtin').live_grep() end, opts)
-- バッファ検索 (Leader + fb)
vim.keymap.set('n', '<leader>fb', function() require('telescope.builtin').buffers() end, opts)
-- ヘルプ検索 (Leader + fh)
vim.keymap.set('n', '<leader>fh', function() require('telescope.builtin').help_tags() end, opts)

-- Oil
-- 親ディレクトリを開く (-)
vim.keymap.set('n', '<leader>e', '<CMD>Oil<CR>', opts)

-- Oil バッファ内でのキーマップ
vim.api.nvim_create_autocmd("FileType", {
    pattern = "oil",
    callback = function()
        local actions = require("oil.actions")
        local buf_opts = { buffer = true, silent = true }

        vim.keymap.set("n", "g?", actions.show_help.callback, buf_opts)
        vim.keymap.set("n", "<CR>", actions.select.callback, buf_opts)
        vim.keymap.set("n", "<C-v>", actions.select_vsplit.callback, buf_opts)
        vim.keymap.set("n", "<C-x>", actions.select_split.callback, buf_opts)
        vim.keymap.set("n", "<C-t>", actions.select_tab.callback, buf_opts)
        vim.keymap.set("n", "<C-p>", actions.preview.callback, buf_opts)
        vim.keymap.set("n", "<C-c>", actions.close.callback, buf_opts)
        vim.keymap.set("n", "R", actions.refresh.callback, buf_opts)
        vim.keymap.set("n", "-", actions.parent.callback, buf_opts)
        vim.keymap.set("n", "_", actions.open_cwd.callback, buf_opts)
        vim.keymap.set("n", "`", actions.cd.callback, buf_opts)
        vim.keymap.set("n", "~", actions.tcd.callback, buf_opts)
        vim.keymap.set("n", "gs", actions.change_sort.callback, buf_opts)
        vim.keymap.set("n", "gx", actions.open_external.callback, buf_opts)
        vim.keymap.set("n", "g.", actions.toggle_hidden.callback, buf_opts)
        vim.keymap.set("n", "g\\", actions.toggle_trash.callback, buf_opts)
    end,
})
