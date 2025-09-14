;;; ui.el --- Appearance, theme, font, line numbers -*- lexical-binding: t; -*-

;; Disable GUI clutter
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(set-fringe-mode 10)
(setq visible-bell t)

;; Line numbers / highlight
(global-display-line-numbers-mode t)
(column-number-mode t)
(global-hl-line-mode t)

;; Default font size (1 unit = 1/10 pt). 160 ~= 16pt
(set-face-attribute 'default nil :height 160)

;; Theme
(use-package doom-themes
  :config
  (load-theme 'doom-one t))

(provide 'ui)
