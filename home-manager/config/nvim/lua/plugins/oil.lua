return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    -- Open oil in the current file's directory
    { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
  },
  config = function()
    require("oil").setup({
      -- Optional: Set to false to prevent oil from taking over directory buffers
      default_file_explorer = true,
    })
  end,
}
