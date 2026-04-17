-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here
-- Установка табуляции в 4 пробела
vim.opt.tabstop = 4

-- Stream Go app output (from dlv's stdout pipe) into dap-ui console window
local function setup_go_output_streaming(session)
  if session.config.type ~= "go" then return end
  local log_file = vim.fn.stdpath("cache") .. "/dap-go-stdout.log"
  vim.defer_fn(function()
    if vim.fn.filereadable(log_file) ~= 1 then return end
    -- dap-ui console element registers itself as terminal_win_cmd
    local get_console_buf = require("dap").defaults.fallback.terminal_win_cmd
    if type(get_console_buf) ~= "function" then return end
    local buf = get_console_buf()
    if not buf or not vim.api.nvim_buf_is_valid(buf) then return end
    -- Only start a terminal if this buffer doesn't already have one running
    if vim.bo[buf].buftype == "terminal" then return end
    vim.api.nvim_buf_call(buf, function()
      vim.fn.termopen("tail -n +1 -f " .. vim.fn.shellescape(log_file))
    end)
  end, 800) -- wait for log file to be created by dlv
end

require("dap").listeners.after.event_initialized["go_stdout"] = setup_go_output_streaming       -- Отображение табуляции как 4 пробела
vim.opt.shiftwidth = 4    -- Автоматический отступ = 4 пробела
vim.opt.softtabstop = 4   -- Количество пробелов при нажатии Tab
-- Настройка навигации в режиме вставки
vim.api.nvim_set_keymap('i', '<M-h>', '<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '<M-l>', '<Right>', { noremap = true })
vim.api.nvim_set_keymap('i', '<M-j>', '<Down>', { noremap = true })
vim.api.nvim_set_keymap('i', '<M-k>', '<Up>', { noremap = true })
-- Перемещение по словам в режиме вставки
vim.api.nvim_set_keymap('i', '<C-M-h>', '<C-Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-M-l>', '<C-Right>', { noremap = true })

-- Удаление слова в режиме вставки
vim.api.nvim_set_keymap('i', '<C-H>', '<C-w>', { noremap = true })


vim.api.nvim_set_keymap("n", "<C-M-l>", ":lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })


-- Определение функции для отмены в режиме вставки
vim.api.nvim_exec([[
function! UndoInInsertMode()
    execute "normal! u"
    startinsert
endfunction
]], false)

-- Настройка комбинации клавиш для отмены в режиме вставки
vim.api.nvim_set_keymap('i', '<C-z>', '<C-o>:call UndoInInsertMode()<CR>', { noremap = true })

-- vim.api.nvim_set_keymap('i', '<C-e>', '<C-o>e', { noremap = true })  -- Переместить на конец слова
-- vim.api.nvim_set_keymap('i', '<C-b>', '<C-o>b', { noremap = true })
-- vim.opt.expandtab = true  -- Заменять табы на пробелы

-- Настройка sessionoptions для auto-session
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- ============================================
-- Автокоманды для Go разработки (из статьи)
-- ============================================

-- Автосортировка импортов при сохранении Go файлов - ОТКЛЮЧЕНО
-- vim.api.nvim_create_autocmd('BufWritePre', {
--   pattern = '*.go',
--   callback = function()
--     local params = vim.lsp.util.make_range_params(nil, vim.lsp.util._get_offset_encoding())
--     params.context = { only = {'source.organizeImports'} }
--     local result = vim.lsp.buf_request_sync(0, 'textDocument/codeAction', params, 3000)
--     for _, res in pairs(result or {}) do
--       for _, r in pairs(res.result or {}) do
--         if r.edit then
--           vim.lsp.util.apply_workspace_edit(r.edit, vim.lsp.util._get_offset_encoding())
--         else
--           vim.lsp.buf.execute_command(r.command)
--         end
--       end
--     end
--   end,
-- })

-- Форматирование Go файлов при сохранении - ОТКЛЮЧЕНО
-- vim.api.nvim_create_autocmd('BufWritePre', {
--   pattern = '*.go',
--   callback = function()
--     vim.lsp.buf.format({ timeout_ms = 3000 })
--   end
-- })

-- Удаление trailing whitespace при сохранении - ОТКЛЮЧЕНО
-- local TrimWhiteSpaceGrp = vim.api.nvim_create_augroup('TrimWhiteSpaceGrp', {})
-- vim.api.nvim_create_autocmd('BufWritePre', {
--   group = TrimWhiteSpaceGrp,
--   pattern = '*',
--   command = '%s/\\s\\+$//e',
-- })

-- Подсветка скопированного текста
local YankHighlightGrp = vim.api.nvim_create_augroup('YankHighlightGrp', {})
vim.api.nvim_create_autocmd('TextYankPost', {
  group = YankHighlightGrp,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 300,
    })
  end,
})

-- Отключить автокомментирование новой строки
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*',
  callback = function()
    vim.opt.formatoptions:remove('c')
    vim.opt.formatoptions:remove('r')
    vim.opt.formatoptions:remove('o')
  end
})

