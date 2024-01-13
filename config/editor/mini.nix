{
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
}