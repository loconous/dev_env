return {
  {
    "nvim-lualine/lualine.nvim",
    lazy = false, 
    dependencies = {
      { 
        "nvim-tree/nvim-web-devicons", 
      },
    },
    config = function()
      require("lualine").setup {
        options = {
          theme = "solarized_light",
          icons_enabled = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff" },
          lualine_c = {
            {
              "filename",
              path = 1, -- show relative path
              symbols = {
                modified = "●",
                readonly = "",
                unnamed = "[No Name]",
              },
            },
          },
          lualine_x = { "filetype", "encoding" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      }
    end,
  },
}
