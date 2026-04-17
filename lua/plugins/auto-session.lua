return {
  "rmagatti/auto-session",
  lazy = false,
  
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    -- Автосохранение и восстановление
    auto_save = true,
    auto_restore = true,
    auto_create = true,
    
    -- Не сохранять сессии для этих директорий
    suppressed_dirs = { "~/", "~/Downloads", "/tmp" },
    
    -- Закрывать dashboard перед сохранением
    bypass_save_filetypes = { "alpha", "dashboard", "snacks_dashboard" },
    
    -- Показывать уведомление при восстановлении
    show_auto_restore_notif = true,
    
    -- Session picker (автоматически определит Telescope если установлен)
    session_lens = {
      load_on_setup = true,
      mappings = {
        delete_session = { "i", "<C-d>" },
        alternate_session = { "i", "<C-s>" },
      },
    },
  },
  
  keys = {
    { "<leader>Ss", "<cmd>AutoSession search<CR>", desc = "Search sessions" },
    { "<leader>Sd", "<cmd>AutoSession delete<CR>", desc = "Delete session" },
    { "<leader>Sr", "<cmd>AutoSession restore<CR>", desc = "Restore session" },
    { "<leader>SS", "<cmd>AutoSession save<CR>", desc = "Save session" },
  },
}
