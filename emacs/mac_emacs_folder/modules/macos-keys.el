;;; macos-keys.el --- macOS modifier keys -*- lexical-binding: t; -*-

;; In macOS System Settings → Keyboard → Keyboard Shortcuts → Modifier Keys…
;;   - Set "Globe (Fn) Key" → Control  (OS-level; Emacs cannot change this)
;; We map Command to Meta inside Emacs and keep Option free for accents.
(when (eq system-type 'darwin)
  ;; Command (⌘) as Meta
  (when (boundp 'ns-command-modifier)
    (setq ns-command-modifier 'meta))
  (when (boundp 'mac-command-modifier)
    (setq mac-command-modifier 'meta))

  ;; Control stays Control (your Globe key will send Control via macOS)
  (when (boundp 'ns-control-modifier)
    (setq ns-control-modifier 'control))
  (when (boundp 'mac-control-modifier)
    (setq mac-control-modifier 'control))

  ;; Keep Option for special characters
  (when (boundp 'ns-option-modifier)
    (setq ns-option-modifier 'none))
  (when (boundp 'mac-option-modifier)
    (setq mac-option-modifier 'none))

  ;; Optional extras (uncomment to use):
  ;; (setq ns-right-command-modifier 'super)
  ;; (setq mac-right-command-modifier 'super)
  ;; (setq ns-function-modifier 'hyper) ;; only if Fn is *not* mapped to Control
  ;; (setq mac-function-modifier 'hyper)
)

(provide 'macos-keys)
