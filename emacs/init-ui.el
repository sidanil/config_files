;;; init-ui.el --- UI and general defaults -*- lexical-binding: t; -*-

(setq inhibit-startup-message t)
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(set-fringe-mode 10)
(setq visible-bell t)

(global-display-line-numbers-mode 1)
(column-number-mode 1)
(global-hl-line-mode 1)

(setq backup-directory-alist `(("." . ,(expand-file-name "backups" user-emacs-directory))))
(setq auto-save-file-name-transforms `((".*" ,(expand-file-name "auto-save-list/" user-emacs-directory) t)))

(provide 'init-ui)
;;; init-ui.el ends here
