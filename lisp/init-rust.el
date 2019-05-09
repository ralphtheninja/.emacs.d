;; Rust mode
(require 'init-elpa)
(require-package 'company)
;; Need racer on the system before this https://github.com/racer-rust/racer#installation
;; racer = rust auto completer
;;(require-package 'racer)
(require-package 'rust-mode)
(require-package 'flycheck)
(require-package 'flycheck-rust)
(require-package 'cargo)

(require 'company)
;;(require 'racer)
(require 'rust-mode)
(require 'electric)
;;(require 'eldoc)
;;(require 'flycheck)
;;(require 'flycheck-rust)

(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
(add-hook 'rust-mode-hook  #'company-mode)
;;(add-hook 'rust-mode-hook  #'racer-mode)
(add-hook 'rust-mode-hook 'cargo-minor-mode)
;;(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
;; (add-hook 'rust-mode-hook
;;           '(lambda ()
;; 	     (setq racer-cmd (concat (getenv "HOME") "/src/rust/racer/target/release/racer"))
;; 	     (setq racer-rust-src-path (concat (getenv "HOME") "/src/rust/rust/src"))
;;              (local-set-key (kbd "TAB") #'company-indent-or-complete-common)
;;	     (electric-pair-mode 1)))
(setq rust-format-on-save t)

(provide 'init-rust)
