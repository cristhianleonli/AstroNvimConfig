local themevariant = function()
  local hour = tonumber(os.date("%H"))
  if (hour >= 7 and hour <= 16) then
    return "dawn"
  else
    return "moon"
  end
end

return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "User AstroFile",
    cmd = { "TodoQuickFix" },
    keys = {
      { "<leader>T", "<cmd>TodoTelescope<cr>", desc = "Open TODOs in Telescope" },
    }
  },
  {
    "rose-pine/neovim",
    lazy = false,
    priority = false,
    config = function()
      require("rose-pine").setup({
        variant = themevariant(),
        styles = {
          italic = false,
        }
      })
    end
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
  {
    "rebelot/heirline.nvim",
    enabled = false,
  },
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    config = function()
      require("nvim-tree").setup({
        filters = {
          dotfiles = true,
        },
        view = {
          adaptive_size = true,
        },
      })
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    config = function()
      require("lualine").setup({
        options = {
          theme = "everforest",
        }
      })
    end,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
}
