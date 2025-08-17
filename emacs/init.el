;;; init.el --- Personal Emacs configuration -*- lexical-binding: t -*-

;;; Commentary:
;; This file is the startup file for my Emacs configuration.
;; It sets up MELPA and loads all packages and settings.

;;; Code:

;; Disable the startup message
(setq inhibit-startup-screen t)

(defun display-startup-time ()
  "Displays Emacs startup time and number of GC run."
  (message "Emacs loaded in %s with %d garbage collections."
           (emacs-init-time "%.2f seconds")
           gcs-done))

(add-hook 'emacs-startup-hook #'display-startup-time)

;; Add MELPA to the list of package registries
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Load packages
(package-initialize)

;; Refresh package list asynchronously
(package-refresh-contents t)

;; Put Customize instructions in a separate file to avoid littering this file
(setq custom-file "~/.config/emacs/custom.el")
(load custom-file 'noerror 'nomessage)

;; Always ensure that packages are installed
(require 'use-package-ensure)
(setq use-package-always-ensure t)

(defmacro load-settings (file)
  "Load local settings file named FILE."
  `(use-package ,file
	 :load-path "~/.config/emacs/lisp"))

(load-settings ui)
(load-settings theme)
(load-settings face)
(load-settings windows)

(load-settings formatting)
(load-settings vim)

(load-settings completions)
(load-settings lsp)
(load-settings diagnostics)

(load-settings rocq)

(provide 'init)

;;; init.el ends here
