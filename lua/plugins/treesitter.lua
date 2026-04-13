-- Treesitter конфигурация с подсветкой Go и других языков

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "go",
      "gomod",
      "gosum",
      "gowork",
      "lua",
      "vim",
      "html",
      "json",
      "yaml",
      "toml",
      "markdown",
      "markdown_inline",
      "css",
      "javascript",
      "typescript",
      "tsx",
      "regex",
      "bash",
      "dockerfile",
      "gitignore",
      "query",
      "vimdoc",
    },
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  },
}
