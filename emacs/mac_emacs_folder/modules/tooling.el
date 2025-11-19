;;; tooling.el --- Completion, discovery, company, search -*- lexical-binding: t; -*-

;; NOT USING ivy Recently. 

;; (use-package ivy
;;   :diminish
;;   :bind (("C-s" . swiper))
;;   :config
;;   (ivy-mode 1))

;; (use-package which-key
;;   :init (which-key-mode)
;;   :diminish which-key-mode)

;; (use-package company
;;   :hook (prog-mode . company-mode))

;; (use-package flycheck
;;   :init (global-flycheck-mode))


;; Show occurence count in  I-search 
(setq isearch-lazy-count t)
(setq lazy-count-prefix-format "%s/%s ")
(setq lazy-count-suffix-format " [%s/%s]")



(require 'subr-x)

(defun find-and-open--read-pattern ()
  "Prompt user for a file name pattern."
  (read-string "Find file (wildcards like *.rs allowed): "))

(defun find-and-open--find-matches (pattern root)
  "Find files matching PATTERN starting from ROOT."
  (let ((default-directory root))
    (split-string
     (shell-command-to-string
      (format "find . -type f -name \"%s\"" pattern))
     "\n" t)))

(defun find-and-open ()
  "Find and open file by pattern recursively."
  (interactive)
  (let* ((pattern (find-and-open--read-pattern))
         (root (or (project-root (project-current)) default-directory))
         (matches (find-and-open--find-matches pattern root)))
    (cond
     ((null matches)
      (message "No matches found for pattern: %s" pattern))
     ((= (length matches) 1)
      (find-file (expand-file-name (car matches) root)))
     (t
      (let ((choice (completing-read "Multiple matches, choose: " matches)))
        (find-file (expand-file-name choice root)))))))

;; Key binding
(global-set-key (kbd "C-c f") #'find-and-open)

(provide 'tooling)
