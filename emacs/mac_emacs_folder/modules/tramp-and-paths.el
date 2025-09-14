;;; tramp-and-paths.el --- TRAMP and PATH helpers -*- lexical-binding: t; -*-

(require 'tramp)
(with-eval-after-load 'tramp
  (setq tramp-remote-shell "/bin/bash")
  (setq tramp-remote-shell-args '("-l" "-c"))  ;; Force login shell
  (add-to-list 'tramp-remote-path 'tramp-own-remote-path)
  (add-to-list 'tramp-remote-path "~/.cargo/bin")
  (add-to-list 'tramp-remote-path "/usr/local/bin"))

(setq tramp-default-method "ssh")

;; Make Homebrew & /usr/local tools visible to Emacs GUI on macOS
(let ((paths '("/opt/homebrew/bin" "/opt/homebrew/sbin" "/usr/local/bin" "/usr/local/sbin")))
  (setenv "PATH" (concat (mapconcat 'identity paths ":") ":" (getenv "PATH")))
  (dolist (p paths) (add-to-list 'exec-path p)))

(provide 'tramp-and-paths)
