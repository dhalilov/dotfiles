;;; lsp.el --- LSP settings -*- lexical-binding: t -*-

;;; Commentary:
;;; Code:

(autoload 'evil-define-key "evil" "Evil mode")

;; Enable LSP mode
(use-package lsp-mode
  :after (evil-leader evil)
  :hook ((tuareg-mode . lsp)
		 (scala-mode . lsp)
		 (lsp-mode . lsp-lens-mode))
  :custom (lsp-keymap-prefix "C-SPC")
  :commands lsp
  :custom
  ;; See https://emacs-lsp.github.io/lsp-mode/tutorials/how-to-turn-off/ for a visual explanation
  ;; Disable topline
  (lsp-headerline-breadcrumb-enable nil)
  :config
  ;; Rebind lsp-keymap-prefix only in normal state
  (with-eval-after-load 'evil
    (evil-define-key 'normal lsp-mode-map
	 "g D" 'lsp-find-declaration
	 (kbd "C-k") 'lsp-signature-mode)
	(evil-leader/set-key
	  ;; LSP commands inherited from my Neovim configuration
	  "r n" 'lsp-rename)))

;; Enable LSP UI
(use-package lsp-ui
  :after (evil lsp-mode)
  :commands lsp-ui-mode
  :config
  ((evil-define-key 'normal lsp-mode-map
	 "g d" 'lsp-ui-peek-find-definitions
	 "g r" 'lsp-ui-peek-find-references
	 "g I" 'lsp-ui-peek-find-implementations)

   ;; Commands prefixed by SPC
   (evil-leader/set-key
	 "w s" 'lsp-ui-peek-find-workspace-symbol)))

(provide 'lsp)

;;; lsp.el ends here
