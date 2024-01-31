{
  extraConfigLuaPre = ''
    local Terminal  = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new({ 
      cmd = "lazygit",
      hidden = true,
      dir = "git_dir",
      direction = "float",
    })

    function _lazygit_toggle()
      lazygit:toggle()
    end
  '';
  plugins.toggleterm = {
    enable = true;
  };
  keymaps = [
    {
      action = "<cmd>ToggleTerm<CR>";
      key = "<leader>t";
      options.desc = "Terminal (root dir)";
    }
    {
      action = "<cmd>lua _lazygit_toggle()<CR>";
      key = "<leader>gg";
      options.desc = "LazyGit";
    }
    {
      action = "<C-\\><C-n>";
      key = "<C-t>";
      mode = "t";
      options = {
        desc = "Exit ToggleTerm";
        noremap = true;
        silent = true;
      };
    }
  ];
}
