;;; vim.el --- Vim emulation -*- lexical-binding: t -*-

;;; Commentary:
;; This file includes custom keybindings and UI changes inherited from my NeoVim
;; experience.

;;; Code:

;; Enable space as the leader key
(use-package evil-leader
  :custom (evil-want-keybinding nil "Required by evil-collection.el")
  :config (evil-leader/set-leader "SPC"))

;; Enable evil mode
(use-package evil
  :ensure t
  :after evil-leader
  :custom
  (display-line-numbers-type 'relative "Enable relative line numbers")
  (evil-want-C-u-scroll t "Bind C-u to scroll up")
  :config
  ;; Unbind C-p
  (define-key evil-normal-state-map (kbd "C-p") nil)
  (evil-mode t))

;; Display line numbers only in prog modes
(add-hook 'prog-mode-hook (lambda () (display-line-numbers-mode t)))

;; Add Vim keybindings to other places not supported by evil
(use-package evil-collection
  :after (evil-leader evil)
  :custom
  (evil-collection-setup-minibuffer t "Allow Vim keybindings in minibuffer")
  :config
  (evil-collection-init))

(provide 'vim)

;;; vim.el ends here
