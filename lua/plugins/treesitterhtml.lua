
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "html" }, -- Убедитесь, что tree-sitter-html установлен
        highlight = {
          enable = true, -- Включить подсветку синтаксиса
        },
      })
    end,
  },
}
