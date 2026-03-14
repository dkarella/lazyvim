return {
  {
    "mrcjkb/rustaceanvim",
    opts = {
      server = {
        settings = function(project_root)
          local ra = require("rustaceanvim.config.server")
          local default = ra.load_rust_analyzer_settings(project_root)

          local json_path = project_root .. "/rust-analyzer.json"
          local f = io.open(json_path, "r")
          if f then
            local content = f:read("*a")
            f:close()
            local ok, json = pcall(vim.fn.json_decode, content)
            if ok and json then
              return vim.tbl_deep_extend("force", default, { ["rust-analyzer"] = json })
            end
          end

          return default
        end,
      },
    },
  },
}
