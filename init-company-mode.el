(require 'init-elpa)
(require-package 'company)
;; http://company-mode.github.io/
(require 'company)

(setq company-tooltip-align-annotations t)
(add-hook 'prog-mode-hook 'company-mode)

(provide 'init-company-mode)
