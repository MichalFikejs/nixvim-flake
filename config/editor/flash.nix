{
  plugins.flash.enable = true;
  keymaps = [
    {
      mode = ["n" "x" "o"];
      action = ''function() require("flash").jump() end'';
      lua = true; 
      key = "s";
      options = {
        desc = "Flash";
      };
    }
    {
      mode = ["n" "o" "x"];
      action = ''function() require("flash").treesitter() end'';
      lua = true; 
      key = "S";
      options = {
        desc = "Flash Treesitter";
      };
    }
    {
      mode = ["o"];
      action = ''function() require("flash").remote() end'';
      lua = true; 
      key = "r";
      options = {
        desc = "Remote Flash";
      };
    }
    {
      mode = ["o" "x"];
      action = ''function() require("flash").treesitter_search() end'';
      lua = true; 
      key = "R";
      options = {
        desc = "Treesitter Search";
      };
    }
    {
      mode = ["c"];
      action = ''function() require("flash").toggle() end'';
      lua = true; 
      key = "<c-s>";
      options = {
        desc = "Toggle Flash Search";
      };
    } 
  ];
}
