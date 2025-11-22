return	{
	  "neovim/nvim-lspconfig", -- REQUIRED: for native Neovim LSP integration
	  lazy = false, -- REQUIRED: tell lazy.nvim to start this plugin at startup

	  opts = {
	      servers = {
	        -- Ensure mason installs the server
	        clangd = {
	          keys = {
	            { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
	          },
	          root_dir = function(fname)
	            return require("lspconfig.util").root_pattern(
	              "Makefile",
	              "configure.ac",
	              "configure.in",
	              "config.h.in",
	              "meson.build",
	              "meson_options.txt",
	              "build.ninja"
	            )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
	              fname
	            ) or require("lspconfig.util").find_git_ancestor(fname)
	          end,
	          capabilities = {
	            offsetEncoding = { "utf-16" },
	          },
	          cmd = {
	            "clangd",
	            "--background-index",
	            "--clang-tidy",
	            "--header-insertion=iwyu",
	            "--completion-style=detailed",
	            "--function-arg-placeholders",
	            "--fallback-style=llvm",
	          },
	          init_options = {
	            usePlaceholders = true,
	            completeUnimported = true,
	            clangdFileStatus = true,
	          },
	        },
	      },
	      setup = {
	        clangd = function(_, opts)
	          local clangd_ext_opts = LazyVim.opts("clangd_extensions.nvim")
	          require("clangd_extensions").setup(vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = opts }))
	          return false
	        end,
	      },
	    },
	    
	  dependencies = {
	  	 { 'saghen/blink.cmp' },
			    
	  },
	  init = function()
	    vim.g.coq_settings = {
	        auto_start = true, -- if you want to start COQ at startup
	        -- Your COQ settings here
	    }
	  end,
        
    opts = { ensure_installed = { "codelldb" } },
	  -- example using `opts` for defining servers
	  opts = {
	    servers = {
	      lua_ls = {}
	    }
	  },
	  config = function(_, opts)
	    local lspconfig = require('lspconfig')
	    for server, config in pairs(opts.servers) do
	      -- passing config.capabilities to blink.cmp merges with the capabilities in your
	      -- `opts[server].capabilities, if you've defined it
	      config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
	      lspconfig[server].setup(config)
	    end
	  end,

	  
	  config = function()
	  	require'lspconfig'.clangd.setup{}
	    -- Your LSP settings here
	    local capabilities = require('blink.cmp').get_lsp_capabilities()
	    local lspconfig = require('lspconfig')
	    lspconfig['lua_ls'].setup({ capabilities = capabilities })
	  end,
	}


