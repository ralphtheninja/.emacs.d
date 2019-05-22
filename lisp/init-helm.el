(require 'init-elpa)
;;(require-package 'company)
(require-package 'helm)
(require-package 'helm-ag)

(global-set-key "\C-cs" 'helm-ag)

(provide 'init-helm)
