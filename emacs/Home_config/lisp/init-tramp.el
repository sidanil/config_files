;;; init-tramp.el --- TRAMP settings -*- lexical-binding: t; -*-

(require 'tramp)
(with-eval-after-load 'tramp
  (setq tramp-remote-shell "/bin/bash")
  (setq tramp-remote-shell-args '("-l" "-c"))
  (add-to-list 'tramp-remote-path 'tramp-own-remote-path)
  (add-to-list 'tramp-remote-path "~/.cargo/bin")
  (add-to-list 'tramp-remote-path "/usr/local/bin"))

(setq tramp-default-method "ssh")

(provide 'init-tramp)
;;; init-tramp.el ends here
