---@type LazySpec
return {
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = { "rcarriga/nvim-dap-ui" },
    opts = {},
    config = function(_, opts)
      require("dap-go").setup(opts)
      -- Remove nvim-dap-go default configs (Debug, Debug Package, etc.)
      -- "Debug Contest" still appears via the built-in launch.json provider
      require("dap").configurations.go = {}
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    opts = {
      layouts = {
        {
          position = "bottom",
          size = 17,
          elements = {
            { id = "console", size = 1 },
          },
        },
        {
          position = "left",
          size = 40,
          elements = {
            { id = "scopes", size = 0.6 },
            { id = "stacks", size = 0.4 },
          },
        },
      },
    },
  },
}
