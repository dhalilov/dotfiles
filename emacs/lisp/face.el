;;; face.el --- Font face settings -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:

(provide 'face)

;; Set font to Iosevka
;;   The font was customized on https://typeof.net/Iosevka/customizer to obtain
;;   a slanted <=, smoother ligatures by removing notches, as well as adding
;;   extra ligatures for Rocq.
(set-frame-font "IosevkaCustom Extended 15")

;; Enable ligatures
(use-package ligature
  :ensure t
  :config
  ;; Set all Iosevka ligatures in programming modes
  (ligature-set-ligatures 'prog-mode '("-<<" "-<" "-<-" "<--" "<---" "<<-" "<-" "->" "->>" "-->" "--->" "->-" ">-" ">>-"
                                       "=<<" "=<" "=<=" "<==" "<===" "<<=" "<=" "=>" "=>>" "==>" "===>" "=>=" ">=" ">>="
                                       "<->" "<-->" "<--->" "<---->" "<=>" "<==>" "<===>" "<====>" "::" ":::" "__"
                                       "<~~" "~~>" "==" "<>" "==="
                                       "<:" ":=" "*=" "*+" "<*" "<*>" "*>" "<|" "<|>" "|>" "<." "<.>" ".>" "+*" "=*" "=:" ":>"
                                       "(*" "*)" "++" "+++" "\\/" "/\\" "|-" "-|"))
  ;; Enables ligatures in all buffers.
  (global-ligature-mode t))

;; Highlight current line
(global-hl-line-mode t)

;; Provide colors in compilation mode
(use-package ansi-color
  :hook (compilation-filter . ansi-color-compilation-filter))

(provide 'face)

;;; face.el ends here
