;;; init-deps.el --- common packages -*- lexical-binding: t; -*-

(use-package ef-themes
  :config (load-theme 'ef-elea-dark t))

;; (use-package doom-themes
  ;; :config (load-theme 'doom-dracula t))

;; (use-package gruvbox-theme
;;   :config(load-theme 'gruvbox-dark-soft))

;; (use-package ivy
;;   :diminish
;;   :bind (("C-s" . swiper))
;;   :config (ivy-mode 1))

(use-package swiper :after ivy)

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode)

(use-package magit)

(use-package org
  :config (setq org-hide-emphasis-markers t))

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode +1)
  :bind-keymap ("C-c p" . projectile-command-map))

(use-package company
  :hook (prog-mode . company-mode)
  :diminish company-mode)

(use-package flycheck
  :init (global-flycheck-mode))

(use-package yasnippet
  :config (yas-global-mode 1))

(provide 'init-deps)
;;; init-deps.el ends here
