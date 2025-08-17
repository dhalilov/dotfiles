;;; ui.el --- UI settings -*- lexical-binding: t -*-

;; Copyright (C) 2025 Dario Halilovic

;;; Commentary:
;; This file sets up the Emacs UI to be as space-efficient as possible.
;; My general philosophy is that code should take up most of the space,
;; and extraneous information should be placed in the modeline, or in
;; other buffers.

;;; Code:

;; Hide default UI elements which take up space
(menu-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(tooltip-mode 0)

;; Hide the titlebar
(setq default-frame-alist '((undecorated . t)))

;; Disable the flashing bell when you reach end of file
(setq visible-bell nil)

;; Enable Nerd icons
(use-package nerd-icons)

;; Use a fancier modeline
(use-package doom-modeline
  :ensure t
  :after nerd-icons
  :hook after-init
  :config
  (display-time-mode)
  :custom
  ;; Hide Evil mode
  (doom-modeline-modal nil)
  ;; Smarter filename
  (doom-modeline-buffer-file-name-style 'relative-to-project)
  ;; Hide buffer encoding, since it's irrelevant
  (doom-modeline-buffer-encoding nil)
  ;; Show time
  (doom-modeline-time t)
  ;; Hide CPU load
  (display-time-default-load-average nil))

(provide 'ui)

;;; ui.el ends here
