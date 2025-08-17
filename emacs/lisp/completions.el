;;; completions.el --- Mini-buffer and text completion -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

;; Remove help message in completions buffer
(setq completion-show-help nil)

;; Enable consult
(use-package consult)

;; Enable vertico incremental completion
(use-package vertico
  :after consult
  :config (vertico-mode t))

;; Filter commands in `M-x' that do not work in the current mode.
(setq read-extended-command-predicate #'command-completion-default-include-p)

;; Ignore case in completions
(setq read-file-name-completion-ignore-case t
      read-buffer-completion-ignore-case t
      completion-ignore-case t)

;; Enable fuzzy finding
(use-package hotfuzz
  :ensure t
  :custom (completion-styles '(hotfuzz)))

(provide 'completions)

;;; completions.el ends here
