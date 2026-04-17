-- Плагин с утилитами для Go разработки
return {
  "olexsmir/gopher.nvim",
  ft = "go",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  build = function()
    vim.cmd([[silent! GoInstallDeps]])
  end,
  opts = {},
  keys = {
    -- Go struct tags (<leader>m = Modify/Markup)
    { "<leader>mj", "<cmd>GoTagAdd json<cr>", desc = "Add json struct tags" },
    { "<leader>my", "<cmd>GoTagAdd yaml<cr>", desc = "Add yaml struct tags" },
    { "<leader>md", "<cmd>GoTagRm<cr>", desc = "Remove all struct tags" },
    
    -- Go code generation (<leader>m = Make/Generate)
    -- iferr отключен, так как утилита недоступна
    -- { "<leader>me", "<cmd>GoIfErr<cr>", desc = "Generate if err != nil" },
    { "<leader>ms", "<cmd>GoFillStruct<cr>", desc = "Fill struct with default values" },
    { "<leader>mi", "<cmd>GoImpl<cr>", desc = "Implement interface" },
    
    -- Go tests (<leader>m = Make tests)
    { "<leader>mt", "<cmd>GoTestAdd<cr>", desc = "Add test for current function" },
    { "<leader>ma", "<cmd>GoTestsAll<cr>", desc = "Add tests for all functions" },
  },
}
