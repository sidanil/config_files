;;; init.el --- Emacs configuration -*- lexical-binding: t; -*-

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(when (file-exists-p custom-file)
  (load custom-file))

(require 'init-ui)
(require 'init-package)
;; (require 'init-straight)
(require 'init-deps)
(require 'init-tramp)
(require 'init-rust)
;; (require 'init-codeium)
(require 'init-keybinds)
(require 'init-tools)

(provide 'init)
;;; init.el ends here
