;;
;; comment-out-line.el
;;
;; toggle line comment for different modes
;;

;; help funcions

(defun toggle-single-char-indent (c)
  (back-to-indentation)
    (if (looking-at c) (delete-char 1) (insert c)))

(defun toggle-single-char-noindent (c)
  (back-to-indentation)
    (if (looking-at c)
	(delete-char 1)
      (progn
	(beginning-of-line)
	(insert c))))

;;
;; C, C++, JavaScript, Rust
;;
(defun cc-mode-comment-out-line ()
  "Comment in/out line using // comment marker."
  (interactive)
  (save-excursion
    (back-to-indentation)
    (if (looking-at "/")
	(delete-char 2)
      (insert "//"))))

(require 'cc-mode)
(define-key c-mode-map "\C-]" 'cc-mode-comment-out-line)
(define-key c++-mode-map "\C-]" 'cc-mode-comment-out-line)
(add-hook 'js2-mode-hook
	  '(lambda() (local-set-key "" 'cc-mode-comment-out-line)))
(add-hook 'rust-mode-hook
	  '(lambda() (local-set-key "" 'cc-mode-comment-out-line)))

;;
;; emacs-lisp
;;
(defun lisp-comment-out-line ()
  "Comment in/out line using ; comment char."
  (interactive)
  (save-excursion (toggle-single-char-indent ";")))

(add-hook 'emacs-lisp-mode-hook
	  '(lambda() (local-set-key "" 'lisp-comment-out-line)))

;;
;; Makefile, Sh
;;
(defun hash-noindent-comment-out-line ()
  "Comment in/out line using # (at beginning of line) comment char."
  (interactive)
  (save-excursion
    (toggle-single-char-noindent "#")))

(add-hook 'makefile-mode-hook
	  '(lambda() (local-set-key "" 'hash-noindent-comment-out-line)))
(add-hook 'sh-mode-hook
	  '(lambda() (local-set-key "" 'hash-noindent-comment-out-line)))


;;
;; Python
;;
(defun hash-indent-comment-out-line()
  "Comment in/out line using indented # comment char."
  (interactive)
  (save-excursion (toggle-single-char-indent "#")))

(add-hook 'python-mode-hook
	  '(lambda() (local-set-key "" 'hash-indent-comment-out-line)))


;;
;; PostScript (pss)
;;
(defun ps-mode-comment-out-line()
  "Comment in/out line using %"
  (interactive)
  (save-excursion (toggle-single-char-noindent "%")))

(add-hook 'ps-mode-hook
	  '(lambda() (local-set-key "" 'ps-mode-comment-out-line)))


;;
;; xml / sgml
;;
(defun xml-mode-comment-out-line ()
  "Comment in/out line using <!-- -->."
  (interactive)
  (save-excursion
    (back-to-indentation)
    (let* ((end (point-at-eol))
	   (st (search-forward "<!--" end t))
	   (et (search-forward "-->" end t)))
      (if (and st et)
	(progn
	  (goto-char st)
	  (delete-char -4)
	  (goto-char (- et 4))
	  (delete-char -3))
      (progn
	(beginning-of-line)
	(insert "<!--")
	(end-of-line)
	(insert "-->"))))))

(add-hook 'sgml-mode-hook
	  '(lambda() (local-set-key "" 'xml-mode-comment-out-line)))

(provide 'init-comment-out-line)
