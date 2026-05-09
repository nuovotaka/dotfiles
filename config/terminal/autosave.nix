{
  plugins.auto-save = {
    enable = true;
    autoLoad = true;
    #testsave
  };
  keymaps = [
    {
      key = "<C-s>";
      mode = [ "n" ];
      action = "<cmd>ASToggle<CR>"; # 自動保存機能の有効/無効を切り替え
    }
  ];
}
