{
  plugins.telescope = {
    enable = true;
    extensions.fzf-native.enable = true;
  };
  keymaps = [
    {
      action = "<cmd>Telescope buffers sort_mru=true sort_lastused=true<CR>";
      key = "<leader>,";
      options.desc = "Switch Buffer";
    }
    {
      action = "<cmd>Telescope live_grep<CR>";
      key = "<leader>/";
      options.desc = "Grep (root dir)";
    }
    {
      action = "<cmd>Telescope find_files<CR>";
      key = "<leader><space>";
      options.desc = "Find Files (root dir)";
    }
    # find
    {
      action = "<cmd>Telescope buffers sort_mru=true sort_lastused=true<CR>";
      key = "<leader>fb";
      options.desc = "Buffers";
    }
    {
      action = "<cmd>Telescope oldfiles<CR>";
      key = "<leader>fr";
      options.desc = "Recent";
    }
    # git
    {
      action = "<cmd>Telescope git_commits<CR>";
      key = "<leader>gc";
      options.desc = "Commits";
    }
    {
      action = "<cmd>Telescope git_status<CR>";
      key = "<leader>gs";
      options.desc = "Status";
    }
    # search
    {
      action = "<cmd>Telescope registers<CR>";
      key = ''<leader>s"'';
      options.desc = "Registers";
    }
    {
      action = "<cmd>Telescope autocommands<CR>";
      key = "<leader>sa";
      options.desc = "Auto Commands";
    }
    {
      action = "<cmd>Telescope current_buffer_fuzzy_find<CR>";
      key = "<leader>sb";
      options.desc = "Buffer";
    }
    {
      action = "<cmd>Telescope command_history<CR>";
      key = "<leader>sc";
      options.desc = "Command History";
    }
    {
      action = "<cmd>Telescope commands<CR>";
      key = "<leader>sC";
      options.desc = "Commands";
    }
    {
      action = "<cmd>Telescope diagnostics bufnr=0<CR>";
      key = "<leader>sd";
      options.desc = "Document diagnostics";
    }
    {
      action = "<cmd>Telescope diagnostics<CR>";
      key = "<leader>sD";
      options.desc = "Workspace diagnostics";
    }
    {
      action = "<cmd>Telescope live_grep<CR>";
      key = "<leader>sg";
      options.desc = "Grep (root dir)";
    }
    {
      action = "<cmd>Telescope help_tags<CR>";
      key = "<leader>sh";
      options.desc = "Help Pages";
    }
    {
      action = "<cmd>Telescope highlights<CR>";
      key = "<leader>sH";
      options.desc = "Search Highlight Groups";
    }
    {
      action = "<cmd>Telescope keymaps<CR>";
      key = "<leader>sk";
      options.desc = "Key Maps";
    }
    {
      action = "<cmd>Telescope man_pages<CR>";
      key = "<leader>sM";
      options.desc = "Man Pages";
    }
    {
      action = "<cmd>Telescope marks<CR>";
      key = "<leader>sm";
      options.desc = "Jump to Mark";
    }
    {
      action = "<cmd>Telescope vim_options<CR>";
      key = "<leader>so";
      options.desc = "Options";
    }
    {
      action = "<cmd>Telescope resume<CR>";
      key = "<leader>sR";
      options.desc = "Resume";
    }
 
  ];
}
