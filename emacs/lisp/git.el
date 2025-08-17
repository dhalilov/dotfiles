;;
;; Git settings
;;
(provide 'git)

;; Enable Magit
(use-package magit
  :bind (("C-x g" . magit-status)
         ("C-x C-g" . magit-status))
  :custom
  ;; Magit post-installation fix
  (package-install-upgrade-built-in t))

;; Forge extends Magit with GitHub/GitLab detection
(use-package forge
  :after magit)

;; Set GitHub auth source
(setq auth-sources '("~/.authinfo"))
