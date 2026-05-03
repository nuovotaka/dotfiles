-- lua/plugins/toggleterm.lua

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      -- 好きな設定を書いてOK
      direction = "float",
      float_opts = {
        border = "curved",
      },
    })

    local Terminal = require("toggleterm.terminal").Terminal

    local lazygit = Terminal:new({
      cmd = "lazygit",
      dir = "vim.loop.cwd()",  -- or "git_dir" / vim.loop.cwd() など
      direction = "float",
      float_opts = {
        border = "double",
      },
      on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(
          term.bufnr,
          "n",
          "q",
          "<cmd>close<CR>",
          { noremap = true, silent = true }
        )
      end,
      on_close = function(_)
      --  vim.cmd("startinsert!")
      end,
    })

    function _lazygit_toggle()
      lazygit:toggle()
    end

    vim.api.nvim_set_keymap(
      "n",
      "<leader>g",
      "<cmd>lua _lazygit_toggle()<CR>",
      { noremap = true, silent = true }
    )

    -- ここから「普段のターミナル」をフロートで出すキーマップ

    -- 普通のフロートターミナル（デフォルトシェル）
    vim.api.nvim_set_keymap(
      "n",
      "<leader>lt",
      "<cmd>ToggleTerm direction=float<CR>",
      { noremap = true, silent = true }
    )

    -- もし insert / terminal モードからも閉じたり再表示したいなら
    vim.api.nvim_set_keymap(
      "t",
      "<leader>lt",
      "<C-\\><C-n><cmd>ToggleTerm direction=float<CR>",
      { noremap = true, silent = true }
    )
  end,
}
