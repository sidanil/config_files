;;; backups.el --- Backups & autosave -*- lexical-binding: t; -*-
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))
(setq auto-save-file-name-transforms `((".*" "~/.emacs.d/auto-save-list/" t)))
(provide 'backups)
