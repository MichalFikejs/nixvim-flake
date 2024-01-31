{
  plugins.nvim-cmp = {
    enable = true;
    snippet.expand = "luasnip";

    autoEnableSources = true; 
    mappingPresets = [ "insert" ];

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
        ];
      };
      "<Tab>" = {
        action = "cmp.mapping.select_next_item()";
        modes = [
          "i"
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
      {name = "cmdli";}
    ];

    experimental = {
      ghost_text = {
        hl_group = "CmpGhostText";
      };
    };

  };
}
