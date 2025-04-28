return {
  {
    "ojroques/vim-oscyank",
    keys = {
      { "<leader>c", mode = "v", "<Plug>OSCYankVisual", desc = "Copy via OSC52" }
    },
    config = function()
      vim.g.oscyank_term = 'tmux'  -- если используете tmux
    end
  }
}

