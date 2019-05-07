;; Originally based on https://manenko.com/2016/08/03/setup-emacs-for-rust-development.html
;; More on loading scripts: https://www.emacswiki.org/emacs/LoadingLispFiles

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-elpa)
(require 'init-ui)
(require 'init-editing)
(require 'init-navigation)
(require 'init-misc)
(require 'init-company-mode)
(require 'init-rust)

(provide 'init)
