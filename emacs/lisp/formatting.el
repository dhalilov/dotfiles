;;; formatting.el --- Code formatting options -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(provide 'formatting)

;; Set tabs to take 4 characters
(setq-default tab-width 4)

;; Set maximum width to 80
(setq-default fill-column 80)

;; Enable electric indentation
(electric-indent-mode t)

;; Don't show trailing whitespace, unless we are in prog mode
;; This helps with terminal, Magit, etc.
(setq-default show-trailing-whitespace nil)
(add-hook 'prog-mode-hook (lambda () (setq-local show-trailing-whitespace t)))

(provide 'formatting)

;;; formatting.el ends here
