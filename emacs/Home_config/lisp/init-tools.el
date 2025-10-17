;;; init-tools.el --- custom tools -*- lexical-binding: t; -*-

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(when (locate-library "find-and-open" nil t)
  (require 'find-and-open))

(setq-default mode-line-buffer-identification
              '(:eval (or (buffer-file-name) (buffer-name))))

(provide 'init-tools)
;;; init-tools.el ends here
