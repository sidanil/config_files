;;; init-keybinds.el --- keybindings -*- lexical-binding: t; -*-

(global-set-key (kbd "C-c c") 'comment-line)
(use-package bind-key)
(bind-key "k" (lambda () (interactive) (kill-buffer (current-buffer))) ctl-x-map)

(add-hook 'dired-mode-hook
  (lambda ()
    (keymap-set dired-mode-map "K" #'dired-kill-subdir)))


(provide 'init-keybinds)
;;; init-keybinds.el ends here
