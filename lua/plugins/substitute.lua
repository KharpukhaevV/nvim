return {
  "gbprod/substitute.nvim",
  event = "VeryLazy",
  config = function()
    require("substitute").setup({
      highlight_substituted_text = {
        enabled = true,
        timer = 500,
      },
    })

    -- Substitute operator
    vim.keymap.set("n", "s", require('substitute').operator, { noremap = true, desc = "Substitute" })
    vim.keymap.set("n", "ss", require('substitute').line, { noremap = true, desc = "Substitute line" })
    vim.keymap.set("n", "S", require('substitute').eol, { noremap = true, desc = "Substitute to EOL" })
    vim.keymap.set("x", "s", require('substitute').visual, { noremap = true, desc = "Substitute visual" })

    -- Exchange operator
    vim.keymap.set("n", "sx", require('substitute.exchange').operator, { noremap = true, desc = "Exchange" })
    vim.keymap.set("n", "sxx", require('substitute.exchange').line, { noremap = true, desc = "Exchange line" })
    vim.keymap.set("x", "X", require('substitute.exchange').visual, { noremap = true, desc = "Exchange visual" })
    vim.keymap.set("n", "sxc", require('substitute.exchange').cancel, { noremap = true, desc = "Cancel exchange" })

    -- Range substitute
    vim.keymap.set("n", "<leader>s", require('substitute.range').operator, { noremap = true, desc = "Substitute range" })
    vim.keymap.set("x", "<leader>s", require('substitute.range').visual, { noremap = true, desc = "Substitute range" })
    vim.keymap.set("n", "<leader>ss", require('substitute.range').word, { noremap = true, desc = "Substitute word range" })
  end,
}
