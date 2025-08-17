;;; diagnostics.el --- Diagnostic settings -*- lexical-binding: t -*-

;;; Commentary:
;;

;;; Code:

;; Enable Flycheck syntax checking
(use-package flycheck
  :ensure t
  :hook (after-init . global-flycheck-mode))

;; Put Flycheck diagnostics inline
(use-package flycheck-inline
  :hook (flycheck-mode))

(provide 'diagnostics)

;;; diagnostics.el ends here
