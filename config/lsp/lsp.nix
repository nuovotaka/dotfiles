{
  pkgs,
  lib,
  ...
}:
{
  # ✅ extraPlugins の代わりに plugins.roslyn.package などを使用するか、
  # テンプレートが提供する extraQueuedPackages (もしあれば) を使いますが、
  # 最も確実なのは以下の「package = 」への直接指定です。

  plugins = {
    # roslyn.nvim プラグインの設定
    roslyn = {
      enable = true;
      # パッケージを直接プラグインに渡す（もしオプションがあれば）
      # 無い場合は extraPackages の代わりに後述の luaConfigPost でパスを通します
    };

    lsp-lines.enable = true;
    lsp-format.enable = true;
    helm.enable = true;

    lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        rust_analyzer.enable = true;
        omnisharp.enable = true;
        superhtml.enable = true;
        sqls.enable = true;
        nushell.enable = true;
        lua_ls.enable = true;
        nil_ls.enable = true;
        ts_ls.enable = true;
        marksman.enable = true;
        pyright.enable = true;
        gopls.enable = true;
        terraformls.enable = true;
        jsonls.enable = true;
        
        # ✅ パッケージをここで直接指定
        helm_ls = {
          enable = true;
          package = pkgs.helm-ls;
          extraOptions.settings.helm_ls.yamlls.path = "${pkgs.yaml-language-server}/bin/yaml-language-server";
        };

        yamlls = {
          enable = true;
          package = pkgs.yaml-language-server;
        };
      };

      keymaps.diagnostic = {
        "<leader>cd" = { action = "open_float"; desc = "Line Diagnostics"; };
        "[d" = { action = "goto_next"; desc = "Next Diagnostic"; };
        "]d" = { action = "goto_prev"; desc = "Previous Diagnostic"; };
      };
    };
  };

  extraConfigLua = ''
    local _border = "rounded"

    -- Roslyn-ls のバイナリへのパスを Lua 側で認識させるための設定
    -- (必要に応じて追加)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, { border = _border }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, { border = _border }
    )

    vim.diagnostic.config{
      float = { border = _border }
    }
  '';
}
