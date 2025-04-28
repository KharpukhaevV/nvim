return {
  "kevinhwang91/nvim-bqf",
  ft = "qf",  -- Ленивая загрузка только для quickfix-окон
  dependencies = {
    "nvim-treesitter/nvim-treesitter",  -- Опционально для подсветки синтаксиса
    "junegunn/fzf"                      -- Опционально для улучшенного поиска
  },
  config = function()
    require("bqf").setup({
      -- Базовые настройки (можно кастомизировать)
      auto_enable = true,
      preview = {
        win_height = 12,
        win_vheight = 12,
        delay_syntax = 80,
        border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" }
      },
      -- Дополнительные параметры:
      func_map = {
        open = "<CR>",
        split = "<C-s>",
        vsplit = "<C-v>",
        tabdrop = "<C-t>"
      },
      filter = {
        fzf = {
          action_for = { ["ctrl-s"] = "split" },
          extra_opts = { "--bind", "ctrl-o:toggle-all" }
        }
      }
    })
  end
}

