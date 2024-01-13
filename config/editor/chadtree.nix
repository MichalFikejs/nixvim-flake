{
  plugins.chadtree = {
    enable = true;
  };
  keymaps = [
   {
      action = "<cmd>CHADopen<CR>";
      key = "<leader>e";
      options = {
        desc = "Explorer CHADTree";
        silent = true;
      };
    } 
  ];
}
