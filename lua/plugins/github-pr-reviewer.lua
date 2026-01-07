return {
  "otavioschwanck/github-pr-reviewer.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("github-pr-reviewer").setup()
  end,
}