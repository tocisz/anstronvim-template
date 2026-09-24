local jdtls = require("jdtls")
local home = os.getenv("HOME")

-- Unique workspace dir per project (jdtls stores index/cache here)
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = home .. "/.local/share/jdtls-workspace/" .. project_name

local config = {
  cmd = {
    home .. "/.local/share/jdtls/bin/jdtls",
    "-data", workspace_dir,
  },

  root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "pom.xml", "build.gradle" }),

  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "JavaSE-17",
            path = home .. "/.sdkman/candidates/java/current",
          },
        },
      },
    },
  },

  init_options = {
    bundles = {},
  },
}

jdtls.start_or_attach(config)
