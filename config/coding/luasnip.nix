{
  plugins.luasnip = {
    enable = true;
    extraConfig = {
      history = true;
      delete_check_events = "TextChanged";
      fromVscode = [
        {
          lazyLoad = true;
        }
      ];
    };
  };
  # plugins.friendly-snippets.enable = true;
}
