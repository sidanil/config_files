;;; keybindings.el --- User keybindings -*- lexical-binding: t; -*-

(global-set-key (kbd "C-c c") 'comment-line)
(with-eval-after-load 'bind-key
  ;; If bind-key is available (via use-package), integrate it.
  )
(bind-key "k" (lambda () (interactive) (kill-buffer (current-buffer))) ctl-x-map)

(provide 'keybindings)
