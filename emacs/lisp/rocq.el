;;; rocq.el --- Rocq prover settings -*- lexical-binding: t -*-

;;; Commentary:
;;; Code:

;; ProofGeneral is the proof interface
(use-package proof-general
  :custom (proof-three-window-mode-policy 'hybrid))

;; Company-coq is a Coq layer atop ProofGeneral that provides
;; utilities for manipulating Coq scripts.
(use-package company-coq
  :hook coq-mode)

;; Add symbols to prettify list (must be put after company-coq)
(add-hook 'coq-mode-hook
		  (lambda ()
			(setq-local prettify-symbols-alist
						'(;; Proof symbols
						  (":=" . ?≜) ("Proof." . ?∵) ("Qed." . ?■)
						  ("Defined." . ?□) ("Time" . ?⏱)
						  ;; Greek symbols
						  ("Alpha" . ?Α) ("Beta" . ?Β) ("Gamma" . ?Γ)
						  ("Delta" . ?Δ) ("Epsilon" . ?Ε) ("Zeta" . ?Ζ)
						  ("Eta" . ?Η) ("Theta" . ?Θ) ("Iota" . ?Ι)
						  ("Kappa" . ?Κ) ("Lambda" . ?Λ) ("Mu" . ?Μ)
						  ("Nu" . ?Ν) ("Xi" . ?Ξ) ("Omicron" . ?Ο)
						  ("Pi" . ?Π) ("Rho" . ?Ρ) ("Sigma" . ?Σ)
						  ("Tau" . ?Τ) ("Upsilon" . ?Υ) ("Phi" . ?Φ)
						  ("Chi" . ?Χ) ("Psi" . ?Ψ) ("Omega" . ?Ω)
						  ("alpha" . ?α) ("beta" . ?β) ("gamma" . ?γ)
						  ("delta" . ?δ) ("epsilon" . ?ε) ("zeta" . ?ζ)
						  ("eta" . ?η) ("theta" . ?θ) ("iota" . ?ι)
						  ("kappa" . ?κ) ("lambda" . ?λ) ("mu" . ?μ)
						  ("nu" . ?ν) ("xi" . ?ξ) ("omicron" . ?ο)
						  ("pi" . ?π) ("rho" . ?ρ) ("sigma" . ?σ)
						  ("tau" . ?τ) ("upsilon" . ?υ) ("phi" . ?φ)
						  ("chi" . ?χ) ("psi" . ?ψ) ("omega" . ?ω)))))


;; Alectryon is a visualization tool for Coq scripts.
(use-package alectryon
  :hook coq-mode)

;; Presenter mode
(use-package presenter-mode
  :vc (:url "https://github.com/cpitclaudel/presenter-mode.git"))

(provide 'rocq)

;;; rocq.el ends here
