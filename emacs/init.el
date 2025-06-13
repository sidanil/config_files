;;; init.el --- Emacs configuration -*- lexical-binding: t; -*-

;; Disable GUI clutter
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(set-fringe-mode 10)
(setq visible-bell t)

;; Line Numbers and Highlighting
(global-display-line-numbers-mode t)
(column-number-mode t)
(global-hl-line-mode t)

;; Backup & Auto-save to ~/.emacs.d
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))
(setq auto-save-file-name-transforms `((".*" "~/.emacs.d/auto-save-list/" t)))

;; Package Management Setup
(require 'package)
(setq package-archives
      '(("GNU ELPA" . "https://elpa.gnu.org/packages/")
        ("MELPA" . "https://melpa.org/packages/")
        ("ORG" . "https://orgmode.org/elpa/")))
(package-initialize)

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; Theme
(use-package doom-themes
  :config
  (load-theme 'doom-one t))

;; Ivy & Swiper for completion and search
(use-package ivy
  :diminish
  :bind (("C-s" . swiper))
  :config
  (ivy-mode 1))

;; Which-Key for keybinding discovery
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode)

;; Magit for Git integration
(use-package magit)

;; Org-mode settings
(use-package org
  :config
  (setq org-hide-emphasis-markers t))

;; Projectile for project management
(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :bind-keymap ("C-c p" . projectile-command-map))

;; Company for auto-completion
(use-package company
  :hook (prog-mode . company-mode))

;; Flycheck for syntax checking
(use-package flycheck
  :init (global-flycheck-mode))

;; Yasnippet for snippet expansion (required by LSP)
(use-package yasnippet
  :config
  (yas-global-mode 1))

;; Enable TRAMP for remote editing with login shell
(require 'tramp)
(with-eval-after-load 'tramp
  (setq tramp-remote-shell "/bin/bash")
  (setq tramp-remote-shell-args '("-l" "-c"))  ;; Force login shell
  (add-to-list 'tramp-remote-path 'tramp-own-remote-path)
  (add-to-list 'tramp-remote-path "~/.cargo/bin")
  (add-to-list 'tramp-remote-path "/usr/local/bin"))

(setq tramp-default-method "ssh")

;; Rust + LSP Setup
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

;; Optional: Rust-specific Flycheck tweaks
(use-package flycheck-rust
  :after (flycheck rust-mode)
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

;; Keybindings
(global-set-key (kbd "C-c c") 'comment-line)
(bind-key "k" (lambda () (interactive) (kill-buffer (current-buffer))) ctl-x-map)

;; Load UI customizations saved by Emacs Customize system
;; (setq custom-file "~/.emacs.d/custom.el")
;; (when (file-exists-p custom-file)
;;   (load custom-file))

(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(flycheck-rust cargo lsp-ui lsp-mode yasnippet which-key swiper rust-mode projectile markdown-mode magit impatient-mode flycheck doom-themes company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
