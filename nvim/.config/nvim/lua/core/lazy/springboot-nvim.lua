return {
  "elmcgill/springboot-nvim",
  ft = "java", -- loads only for Java files
  dependencies = {
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-jdtls"
  },
  opts = {}, -- default config (or provide yours)
  keys = {
    {
      "<leader>Jr",
      function() require("springboot-nvim").boot_run() end,
      desc = "[SpringBoot] Run project"
    },
    {
      "<leader>Jc",
      function() require("springboot-nvim").generate_class() end,
      desc = "[SpringBoot] Generate class"
    },
    {
      "<leader>Ji",
      function() require("springboot-nvim").generate_interface() end,
      desc = "[SpringBoot] Generate interface"
    },
    {
      "<leader>Je",
      function() require("springboot-nvim").generate_enum() end,
      desc = "[SpringBoot] Generate enum"
    },
  }
}
