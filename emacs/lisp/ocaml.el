;;; ocaml.el --- OCaml settings -*- lexical-binding: t -*-

;;; Commentary:
;;  Set-up code for OCaml tooling: tuareg, ocp-indent, ocamlformat, etc.
;;  Some of the setup code is inspired from `opam-user-setup`, but without littering
;;  the rest of my config.

;;; Code:

;; Improved error regexp for OCaml backtraces
(defun set-ocaml-error-regexp ()
  (set
   'compilation-error-regexp-alist
   (list '("[Ff]ile \\(\"\\(.*?\\)\", line \\(-?[0-9]+\\)\\(, characters \\(-?[0-9]+\\)-\\([0-9]+\\)\\)?\\)\\(:\n\\(\\(Warning .*?\\)\\|\\(Error\\)\\):\\)?"
    2 3 (5 . 6) (9 . 11) 1 (8 compilation-message-face)))))

;; Enable Tuareg mode
(use-package tuareg
  :bind (:map tuareg-mode-map
		 ("C-c C-f" . ocamlformat))
  :hook ((merlin-mode)
		 (set-ocaml-error-regexp)
		 (ocp-setup-indent)))

;; Major mode for editing Dune project files
(use-package dune
  :defer t)

;; Merlin is the mode for OCaml
(use-package merlin
  :hook ((tuareg-mode)
		 (company-mode))
  :custom (merlin-error-after-save nil))

;; Enable Flycheck for OCaml
(use-package flycheck-ocaml
  :hook (tuareg-mode . flycheck-ocaml-setup))

;; Opam switch inside Emacs
(use-package opam-switch-mode
  :hook (tuareg-mode))


(provide 'ocaml)

;;; ocaml.el ends here
