{
  plugins.trouble = {
    enable = true;
    useDiagnosticSigns = true; 
  };
  keymaps = [
    {
      action = "<cmd>TroubleToggle document_diagnostics<CR>";
      key = "<leader>xx";
      options = {
        desc = "Document Diagnostics (Trouble)";
      };
    }
    {
      action = "<cmd>TroubleToggle workspace_diagnostics<CR>";
      key = "<leader>xX";
      options = {
        desc = "Workspace Diagnostics (Trouble)";
      };
    }
    {
      action = "<cmd>TroubleToggle loclist<CR>";
      key = "<leader>xL";
      options = {
        desc = "Location List (Trouble)";
      };
    }
    {
      action = "<cmd>TroubleToggle quickfix<CR>";
      key = "<leader>xQ";
      options = {
        desc = "Quickfix List (Trouble)";
      };
    }
    {
      action = ''
        function()
          if require("trouble").is_open() then
            require("trouble").previous({ skip_groups = true, jump = true })
          else
            local ok, err = pcall(vim.cmd.cnext)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end
      '';
      lua = true;
      key = "[q";
      options = {
        desc = "Previous trouble/quickfix item";
      };
    }
    {
      action = ''
        function()
          if require("trouble").is_open() then
            require("trouble").next({ skip_groups = true, jump = true })
          else
            local ok, err = pcall(vim.cmd.cnext)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end
      '';
      lua = true;
      key = "]q";
      options = {
        desc = "Next trouble/quickfix item";
      };
    }
  ];
}
