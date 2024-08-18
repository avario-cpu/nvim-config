return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim", -- Add this line
    },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({
              -- Additional options can go here if needed
            }),
          },
        },
      })
      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("notify")
    end,
  },
}
