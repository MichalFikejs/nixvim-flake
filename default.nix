{
  pkgs,
  ...
}:
{
  programs.nixvim = {
    enable = true;

    extraPackages = with pkgs; [gcc ripgrep fd stylua gopls gotools gofumpt shfmt terraform];
    
    options = {
      # autowrite = true;
      clipboard = "unnamedplus";
      completeopt = ["menu" "menuone" "noselect"];
      confirm = true;
      cursorline = true;
      expandtab = true;

      formatoptions = "jcroqlnt"; #-- tcqj
      grepformat = "%f:%l:%c:%m";
      grepprg = "rg --vimgrep";

      ignorecase = true; # -- Ignore case
      inccommand = "nosplit"; # -- preview incremental substitute
      laststatus = 3; # -- global statusline
      list = true; # -- Show some invisible characters (tabs...
      mouse = "a"; # -- Enable mouse mode
      pumblend = 10; # -- Popup blend
      pumheight = 10; # -- Maximum number of entries in a popup
      scrolloff = 4; # -- Lines of context
      sessionoptions = [ "buffers" "curdir" "tabpages" "winsize" "help" "globals" "skiprtp" "folds" ];
      shiftround = true; # -- Round indent
      shiftwidth = 2; # -- Size of an indent
      # opt.shortmess:append({ W = true, I = true, c = true, C = true })
      showmode = false; # -- Dont show mode since we have a statusline
      sidescrolloff = 8; # -- Columns of context
      signcolumn = "yes"; # -- Always show the signcolumn, otherwise it would shift the text each time
      smartcase = true; # -- Don't ignore case with capitals
      smartindent = true; # -- Insert indents automatically
      spelllang = [ "en" ];
      splitbelow = true; # -- Put new windows below current
      splitkeep = "screen";
      splitright = true; # -- Put new windows right of current
      tabstop = 2; # -- Number of spaces tabs count for
      termguicolors = true; # -- True color support
      timeoutlen = 300;
      undofile = true;
      undolevels = 10000;
      updatetime = 200; # -- Save swap file and trigger CursorHold
      virtualedit = "block"; # -- Allow cursor to move where there is no text in visual block mode
      wildmode = "longest:full,full"; # -- Command-line completion mode
      winminwidth = 5; # -- Minimum window width
      wrap = false; # -- Disable line wrap

      fillchars = {
        foldopen = "";
        foldclose = "";
        # fold = "⸱";
        fold = " ";
        foldsep = " ";
        diff = "╱";
        eob = " ";
      };

      number = true;
      relativenumber = true;
    };

    globals = {
      mapleader = " ";
      markdown_recommended_style = 0;
    };

    # Colorscheme
    colorschemes = {
      tokyonight = {
        enable = true;
        style = "night";
      }; 
    };

    # Bufferline
    plugins.bufferline = {
      enable = true;
      diagnostics = "nvim_lsp";
      offsets = [
        {
          filetype = "CHADTree";
          highlight = "Directory";
          text = "File Explorer";
          text_align = "center";
        }
      ];
    };

    # Chadtree
    plugins.chadtree = {
      enable = true;
    };

    # CMP
    plugins.nvim-cmp = {
      enable = true;
      snippet.expand = "luasnip";

      autoEnableSources = true; 
      mappingPresets = [ "insert" "cmdline" ];

      mapping = {
        "<C-Space>" = "cmp.mapping.complete()";
        "<C-d>" = "cmp.mapping.scroll_docs(-4)";
        "<C-e>" = "cmp.mapping.close()";
        "<C-f>" = "cmp.mapping.scroll_docs(4)";
        "<CR>" = "cmp.mapping.confirm({ select = true })";
        "<S-Tab>" = {
          action = "cmp.mapping.select_prev_item()";
          modes = [
            "i"
            "s"
          ];
        };
        "<Tab>" = {
          action = "cmp.mapping.select_next_item()";
          modes = [
            "i"
            "s"
          ];
        };
      };

      sources = [
        {
          name = "nvim_lsp";
          priority = 1;
        }
        {
          name = "nvim_lua";
          priority = 2;
        }
        {
          name = "luasnip";
          priority = 3;
        }
        {
          name = "buffer";
          priority = 4;
        }
        {name = "path";}
        {name = "emoji";}
      ];

      experimental = {
        ghost_text = {
          hl_group = "CmpGhostText";
        };
      };

    };

    # Colorizer
    plugins.nvim-colorizer = {
      enable = true;
    };

    # Comment
    plugins.comment-nvim.enable = true;

    # Conform
    plugins.conform-nvim = {
      enable = true;
      extraOptions = {
        format = {
          timeout_ms = 3000;
          async = false; # -- not recommended to change
          quiet = false; # -- not recommended to change
        };
      };
      formattersByFt = {
        lua = [ "stylua" ];
        h = [ "shfmt" ];
        go = [ "goimports" "gofumpt" ];
        terraform = [ "terraform_fmt" ];
        tf = [ "terraform_fmt" ];
        terraform-vars = [ "terraform_fmt" ];
      };
      formatters = {
        injected = {
          options = {
            ignore_errors = true;
          };
        };
      };
    };

    # Dashboard 
    plugins.dashboard.enable = true;

    # GitSign
    plugins.gitsigns = {
      enable = true;
    };

    # Harpoon
    plugins.harpoon = {
      enable = true;
      enableTelescope = true;
    };

    # Illuminate
    plugins.illuminate = {
      enable = true;
      delay = 200;
      largeFileCutoff = 2000;
    };

    plugins.indent-blankline = {
      enable = true;
      indent = {
        char = "|";
        tabChar = "|";
      };
      scope.enabled = true;
    };

    plugins.lsp-format.enable = true;

    plugins.lsp = {
      enable = true;
      servers = {
        bashls.enable = true;
        gopls.enable = true;
        html.enable = true;
        jsonls.enable = true;
        lua-ls.enable = true;
        nixd.enable = true;
        yamlls.enable = true;
      };
    };

    plugins.lspkind = {
      enable = true;
      cmp.enable = true;
    };

    plugins.lspsaga = {
      enable = true;
      lightbulb = {
        enable = true;
        virtualText = false;
      };
      symbolInWinbar.enable = false;
      ui.border = "rounded";
    };
    keymaps = [
      # LSPSaga
      {
        mode = "n";
        key = "<leader>la";
        options.desc = "Lsp Code Actions";
        action = "<cmd>Lspsaga code_action<CR>";
      }
      {
        mode = "n";
        key = "<leader>lf";
        options.desc = "Lsp Find";
        action = "<cmd>Lspsaga finder<CR>";
      }
      {
        mode = "n";
        key = "<leader>lh";
        options.desc = "Lsp Hover";
        action = "<cmd>Lspsaga hover_doc<CR>";
      }
      {
        mode = "n";
        key = "<leader>lr";
        options.desc = "Lsp Rename";
        action = "<cmd>Lspsaga rename<CR>";
      }
      {
        mode = "n";
        key = "<leader>lp";
        options.desc = "Lsp Show Definition";
        action = "<cmd>Lspsaga peek_definition<CR>";
      }
      {
        mode = "n";
        key = "<leader>ld";
        options.desc = "Lsp Goto Definition";
        action = "<cmd>Lspsaga goto_definition<CR>";
      }
      # CHAD
      {
        action = "<cmd>CHADopen<CR>";
        key = "<leader>e";
        options = {
          desc = "Explorer CHADTree";
          silent = true;
        };
      }
    ];

    plugins.lualine = {
      enable = true;
      theme = "tokyonight";
      globalstatus = true;
      disabledFiletypes.statusline = ["dashboard" "alpha" "starter"];

      sections = {
        lualine_a = ["mode"];
        lualine_b = ["branch"];
        lualine_c = [
          {
            name = "filetype";
            extraConfig = {
              icon_only = true;
              separator = "";
              padding = {
                left = 1;
                right = 0;
              };
            };
          }
          {
            name = "filename";
            extraConfig = {
              file_status = true;
              path = 1;
            };
          }
          "diagnostics" 
        ];
        lualine_y = [
          {
            name = "progress";
            extraConfig = {
              separator = " ";
              padding = {
                left = 1;
                right = 0;
              };
            };
          }
          {
            name = "location";
            extraConfig = {
              padding = {
                left = 0;
                right = 1;
              };
            };
          }
        ];
        lualine_z = [''" " .. os.date('%R')''];
      };
    };

    plugins.luasnip = {
      enable = true;
      extraConfig = {
        history = true;
        delete_check_events = "TextChanged";
      };
    };

    plugins.mini = {
      enable = true;
      modules = {
        pairs = { };
        indentscope = {
          symbol = "│";
          options = { try_as_border = true; };
        };
        comment = {
          custom_commentstring = ''
            function()
              return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
            end
          '';
        };
        surround = { 
          mappings = {
            add = "gsa"; # -- Add surrounding in Normal and Visual modes
            delete = "gsd"; # -- Delete surrounding
            find = "gsf"; # -- Find surrounding (to the right)
            find_left = "gsF"; # -- Find surrounding (to the left)
            highlight = "gsh"; # -- Highlight surrounding
            replace = "gsr"; # -- Replace surrounding
            update_n_lines = "gsn"; # -- Update `n_lines`
          };
        };
        ai = { 
          n_lines = 500;
          custom_textobjects = {
            o = ''ai.gen_spec.treesitter({
              a = { "@block.outer", "@conditional.outer", "@loop.outer" },
              i = { "@block.inner", "@conditional.inner", "@loop.inner" },
            }, {})'';
            f = ''ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {})'';
            c = ''ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {})'';
            t = ''{ "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }'';
          };
        };
      };
    };

    plugins.nix.enable = true;
    plugins.nix-develop.enable = true;

    plugins.noice = {
      enable = true;
      lsp.override = {
        "vim.lsp.util.convert_input_to_markdown_lines" = true;
        "vim.lsp.util.stylize_markdown" = true;
        "cmp.entry.get_documentation" = true;
      };
      routes = [
        {
          filter = {
            event = "msg_show";
            any = [
              { find = "%d+L, %d+B"; }
              { find = "; after #%d+"; }
              { find = "; before #%d+"; }
            ];
          };
          view = "mini";
        }
      ];
      presets = {
        bottom_search = true;
        command_palette = true;
        long_message_to_split = true;
        inc_rename = true;
      };
    };

    plugins.notify = {
      enable = true;
      timeout = 3000;
      backgroundColour = "#000000";
      maxHeight = { __raw = "math.floor(vim.o.lines * 0.75)"; };
      maxWidth =  { __raw = "math.floor(vim.o.columns * 0.75)"; };
      onOpen = ''
        function(win)
          vim.api.nvim_win_set_config(win, { zindex = 100 })
        end
      '';
    };

    plugins.persistence = {
      enable = true;
    };

    plugins.telescope = {
      enable = true;
      extensions.fzf-native.enable = true;
    };

    plugins.todo-comments.enable = true;

    plugins.treesitter = {
      enable = true;
      indent = true;
      ensureInstalled = [
        "bash"
        "c"
        "css"
        "csv"
        "diff"
        "dockerfile"
        "dot"
        "git_config"
        "git_rebase"
        "gitattributes"
        "gitcommit"
        "gitignore"
        "go"
        "gomod"
        "gosum"
        "html"
        "javascript"
        "jsdoc"
        "json"
        "jsonc"
        "lua"
        "luadoc"
        "luap"
        "markdown"
        "markdown_inline"
        "nix"
        "python"
        "ssh_config"
        "query"
        "regex"
        "terraform"
        "toml"
        "tsx"
        "typescript"
        "vim"
        "vimdoc"
        "yaml"
      ];
      incrementalSelection = {
        enable = true;
        keymaps = {
          initSelection = "gnn";
          nodeIncremental = "grn";
          scopeIncremental = "grc";
          nodeDecremental = "grm";
        };
      };
      nixvimInjections = true;
    };

    plugins.trouble = {
      enable = true;
      useDiagnosticSigns = true;
    };

    plugins.which-key = {
      enable = true;
    };

  };
}
