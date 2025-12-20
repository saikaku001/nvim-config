return {
  "pwntester/octo.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  cmd = "Octo",
  keys = {
    { "<leader>op", "<cmd>Octo pr list<cr>", desc = "Octo PR List" },
    { "<leader>oc", "<cmd>Octo pr create<cr>", desc = "Octo PR Create" },
    { "<leader>os", "<cmd>Octo pr search<cr>", desc = "Octo PR Search" },
    { "<leader>oi", "<cmd>Octo issue list<cr>", desc = "Octo Issue List" },
  },
  config = function()
    require("octo").setup({
      suppress_missing_scope = {
        projects_v2 = true,
      },
    })
  end,
}
