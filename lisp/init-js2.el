(require 'init-elpa)

(require-package 'js2-mode)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.gyp$" . js2-mode))

(eval-after-load 'js2-mode '(require 'setup-js2-mode))

(provide 'init-js2)
;;; init-js2.el ends here
