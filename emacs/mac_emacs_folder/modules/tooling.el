;;; tooling.el --- Completion, discovery, company, search -*- lexical-binding: t; -*-

(use-package ivy
  :diminish
  :bind (("C-s" . swiper))
  :config
  (ivy-mode 1))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode)

(use-package company
  :hook (prog-mode . company-mode))

(use-package flycheck
  :init (global-flycheck-mode))

(provide 'tooling)
