return {
  "Pocco81/auto-save.nvim",
  config = function()
    require("auto-save").setup({
      execution_message = {
        message = "", -- Отключаем сообщение о сохранении
        cleaning_interval = 1000
      },
      trigger_events = {"InsertLeave", "TextChanged"}
    })
  end
}
