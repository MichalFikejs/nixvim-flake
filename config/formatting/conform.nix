{
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
}