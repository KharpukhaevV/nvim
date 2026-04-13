-- Настройки шрифта (JetBrains Mono Nerd Font — как в GoLand)
return {
  "AstroNvim/astrocore",
  opts = {
    options = {
      opt = {
        -- Шрифт в GUI (для клиентов типа Neovide, gVim)
        guifont = "JetBrainsMono Nerd Font:h13",
        -- Межстрочный интервал (line height ~1.2 как в GoLand)
        linespace = 2,
      },
    },
  },
}
