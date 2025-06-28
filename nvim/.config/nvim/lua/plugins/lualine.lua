return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      -- Add buffers to the lualine sections
      -- opts.sections.lualine_b = { "buffers" }
      return opts
    end,
  },
}
