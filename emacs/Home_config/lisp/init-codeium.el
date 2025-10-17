;;; init-codeium.el --- Codeium integration -*- lexical-binding: t; -*-

(use-package codeium
  :straight (:type git :host github :repo "Exafunction/codeium.el")
  :init (add-to-list 'completion-at-point-functions #'codeium-completion-at-point)
  :config (setq codeium/metadata `((name . "emacs") (version . "0.1"))))

(add-hook 'prog-mode-hook
          (lambda ()
            (add-to-list 'completion-at-point-functions #'codeium-completion-at-point)))

(provide 'init-codeium)
;;; init-codeium.el ends here
