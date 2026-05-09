{ pkgs, ... }:
{
  keymaps = [
    # --- デフォルト・基本操作 ---
    {
      key = "<leader>p";
      mode = [ "n" ];
      action = "<cmd>YankyRingHistory<CR>"; # ヤンク（コピー）履歴を表示
    }
    {
      key = "<leader>qq";
      mode = [ "n" ];
      action = "<cmd>qa<CR>"; # 全てのバッファを閉じてNeovimを終了
    }
  ];
}
