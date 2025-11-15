;;; keybindings.el --- User keybindings -*- lexical-binding: t; -*-

(global-set-key (kbd "C-c c") 'comment-line)
(with-eval-after-load 'bind-key
  ;; If bind-key is available (via use-package), integrate it.
  )
(bind-key "k" (lambda () (interactive) (kill-buffer (current-buffer))) ctl-x-map)

;; 1) Define your aliases here: "name" -> "directory" (local or TRAMP).
(defvar my-project-alist
  '(("sid" . "/ssh:v-gpu1:/extra/sid"))
  "Alist mapping short aliases to directories (local or TRAMP).")

;; 2) Main command: C-c C-p prompts for an alias (or a literal path) and jumps there.
(defun my-project-open (use-find-file)
  "Prompt for an alias or path and open it.
With prefix arg USE-FIND-FILE (C-u), open with `find-file`; otherwise use Dired."
  (interactive "P")
  (let* ((aliases (mapcar #'car my-project-alist))
         (input   (completing-read
                   (if use-find-file "Alias or path (find-file): "
                     "Alias or path (Dired): ")
                   aliases nil nil nil nil
                   (car-safe aliases)))   ;; default to first alias if any
         (raw     (or (cdr (assoc input my-project-alist)) input))
         (path    (if (and (not (file-remote-p raw))
                           (string-prefix-p "~" raw))
                      (expand-file-name raw)
                    raw)))
    (if use-find-file
        (find-file path)
      (dired path))
    (message "Opened: %s" path)))

;; 3) Optional helper to add/edit aliases interactively.
(defun my-project-define-alias (name dir)
  "Add or update an alias NAME -> DIR in `my-project-alist`."
  (interactive
   (list (read-string "Alias name: ")
         (read-directory-name "Directory (local or TRAMP): ")))
  (setf (alist-get name my-project-alist nil nil #'string-equal) dir)
  (message "Set alias %s → %s" name dir))

;; 4) Bind the command to C-c C-p
(global-set-key (kbd "C-c C-p") #'my-project-open)


(provide 'keybindings)
