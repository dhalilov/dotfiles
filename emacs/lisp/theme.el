;;; theme.el --- Emacs theme -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

;; Load Catppuccin's light theme
(use-package catppuccin-theme
  :custom
  (catppuccin-flavor 'latte)
  :config
  (load-theme 'catppuccin :no-confirm))

(provide 'theme)

;;; theme.el ends here
