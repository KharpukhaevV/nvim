-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here
-- Установка табуляции в 4 пробела
vim.opt.tabstop = 4       -- Отображение табуляции как 4 пробела
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
