;;; core-packages.el --- Package archives and bootstrap -*- lexical-binding: t; -*-
(require 'package)

(setq package-archives
      '(("GNU ELPA" . "https://elpa.gnu.org/packages/")
        ("MELPA"    . "https://melpa.org/packages/")
        ("ORG"      . "https://orgmode.org/elpa/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(provide 'core-packages)
