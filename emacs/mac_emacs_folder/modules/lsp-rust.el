;;; lsp-rust.el --- Rust + LSP setup -*- lexical-binding: t; -*-

(use-package rust-mode
  :mode "\\.rs\\'"
  :hook ((rust-mode . lsp)
         (rust-mode . cargo-minor-mode))
  :config
  (setq rust-format-on-save t))

(use-package lsp-mode
  :commands lsp
  :custom
  (lsp-enable-snippet t)
  (lsp-rust-server 'rust-analyzer)
  (lsp-eldoc-render-all t)
  (lsp-idle-delay 0.6)
  (lsp-rust-analyzer-cargo-watch-command "clippy")
  :hook ((lsp-mode . lsp-enable-which-key-integration)))

(use-package lsp-ui
  :commands lsp-ui-mode)

(use-package cargo
  :hook (rust-mode . cargo-minor-mode))

(use-package flycheck-rust
  :after (flycheck rust-mode)
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(provide 'lsp-rust)
