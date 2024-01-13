{
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
}