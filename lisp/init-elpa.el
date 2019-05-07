;; Initializes MELPA packages
;; More on emacs packages: https://www.gnu.org/software/emacs/manual/html_node/emacs/Packages.html

(require 'package)

(defun require-package (package)
  "Install given PACKAGE if it was not installed before."
  (if (package-installed-p package)
      t
    (progn
      (unless (assoc package package-archive-contents)
	(package-refresh-contents))
      (package-install package))))

(package-initialize)
(add-to-list 'package-archives
	     '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-refresh-contents)



(provide 'init-elpa)

