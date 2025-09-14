;;; init.el --- Emacs configuration entrypoint -*- lexical-binding: t; -*-

;; Keep customizations separate
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file) (load custom-file))

;; Add modules directory to load-path
(add-to-list 'load-path (expand-file-name "modules" user-emacs-directory))

;; Core package setup (archives, use-package bootstrap)
(require 'core-packages)

;; Base UI (appearance, theme, font, line numbers)
(require 'ui)

;; macOS-specific key modifiers (Command→Meta, Option free, Globe(Fn)→Control in macOS)
(require 'macos-keys)

;; Backups & autosave
(require 'backups)

;; TRAMP & PATH helpers for macOS Homebrew / tools
(require 'tramp-and-paths)

;; Editor tooling: completion, discovery, company, search
(require 'tooling)

;; Project tools
(require 'project-tools)

;; Git integration
(require 'git)

;; Org mode
(require 'org-config)

;; LSP + Rust + Cargo + Flycheck-Rust
(require 'lsp-rust)

;; Keybindings that depend on packages above
(require 'keybindings)

(provide 'init)
;;; init.el ends here
