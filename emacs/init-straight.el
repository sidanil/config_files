;;; init-straight.el --- bootstrap straight.el with helpful diagnostics -*- lexical-binding: t; -*-

;; Require minimum Emacs version
(when (version< emacs-version "25.1")
  (error "straight.el requires Emacs 25.1 or higher, you have %s" emacs-version))

;; Helper to report and error
(defun my/straight-error (fmt &rest args)
  (let ((msg (apply #'format fmt args)))
    (message "[straight-bootstrap] %s" msg)
    (error "%s" msg)))

;; Ensure git is available
(unless (executable-find "git")
  (my/straight-error "Git executable not found in Emacs exec-path. Check (executable-find \"git\") and your PATH."))

(defvar bootstrap-file
  (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory)
  "Path to locally-cloned straight.el bootstrap file.")

;; If the bootstrap file exists (e.g. you manually cloned), load it directly.
(when (file-exists-p bootstrap-file)
  (load bootstrap-file nil 'nomessage)
  (message "[straight-bootstrap] loaded local bootstrap at %s" bootstrap-file)
  (provide 'init-straight)
  ;; integrate with use-package below
  (straight-use-package 'use-package)
  (setq straight-use-package-by-default t)
  ;; done
  (cl-return-from load-file-name))

;; Otherwise attempt the standard bootstrap (download & install)
(defvar bootstrap-version 6)
(let ((bootstrap-url "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el")
      (temp-buffer (generate-new-buffer " *straight-bootstrap*")))
  (unwind-protect
      (progn
        (message "[straight-bootstrap] Attempting network bootstrap from %s" bootstrap-url)
        (if (not (condition-case nil
                     (with-current-buffer
                         (url-retrieve-synchronously bootstrap-url 'silent 'inhibit-cookies)
                       (goto-char (point-max))
                       (eval-print-last-sexp)
                       t)
                   (error nil)))
            (my/straight-error "Network bootstrap failed. Check network, TLS, or try manual clone (see README).")
          ;; If we get here, the downloaded code executed successfully
          (let ((bf (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory)))
            (if (file-exists-p bf)
                (progn
                  (load bf nil 'nomessage)
                  (message "[straight-bootstrap] bootstrap succeeded and loaded %s" bf)
                  (straight-use-package 'use-package)
                  (setq straight-use-package-by-default t))
              (my/straight-error "Bootstrap completed but %s is missing." bf)))))
    (when (buffer-name temp-buffer) (kill-buffer temp-buffer))))

(provide 'init-straight)
;;; init-straight.el ends here
