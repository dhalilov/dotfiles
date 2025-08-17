;; Increase the memory threshold before a GC to 64 Mb
;; This helps with initial startup time
(setq gc-cons-threshold (* 64 1024 1024))
