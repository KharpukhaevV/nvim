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
}
