return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      width = 35, -- Ширина панели (по умолчанию 30)
      -- auto_expand_width = true, -- Автоматически расширять при длинных именах файлов
    },
    sources = { "filesystem", "git_status" },
    source_selector = {
      sources = {
        { source = "filesystem" },
        { source = "git_status" },
      },
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        if vim.fn.argc() == 0 then
          vim.defer_fn(function()
            vim.cmd("Neotree show")
          end, 150)
        end
      end,
    })
  end,
  keys = {
    -- Переопределяем <leader>o для фокуса на neo-tree без смены вкладки
    {
      "<leader>o",
      function()
        if vim.bo.filetype == "neo-tree" then
          -- Если уже в neo-tree, вернуться к предыдущему окну
          vim.cmd("wincmd p")
        else
          -- Найти окно neo-tree и переключиться на него
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            local buf = vim.api.nvim_win_get_buf(win)
            if vim.bo[buf].filetype == "neo-tree" then
              vim.api.nvim_set_current_win(win)
              return
            end
          end
          -- Если neo-tree не открыт, открыть его
          vim.cmd("Neotree show")
        end
      end,
      desc = "Toggle Neo-tree focus",
    },
  },
}
