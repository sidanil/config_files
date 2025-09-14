;;; project-tools.el --- Projectile and project helpers -*- lexical-binding: t; -*-

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :bind-keymap ("C-c p" . projectile-command-map))

(provide 'project-tools)
