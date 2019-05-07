(require 'init-elpa)
;; https://www.emacswiki.org/emacs/InteractivelyDoThings
(require 'ido)
(require 'recentf)
;; https://github.com/DarwinAwardWinner/ido-completing-read-plus
(require-package 'ido-completing-read+)
;; https://github.com/nonsequitur/smex
(require-package 'smex)
;; https://github.com/bbatsov/projectile
(require-package 'projectile)

(setq recentf-save-file (concat user-emacs-directory ".recentf"))
;; https://www.emacswiki.org/emacs/RecentFiles
(recentf-mode 1)
(setq recentf-max-menu-items 40)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; 'suspend-frame is usually bound ot C-z
(global-set-key "\C-c\C-z" 'suspend-frame)

(defun scroll-one-line-up (amount)
  "Scroll text of current window upward one line"
  (interactive "p")
  (scroll-up amount))

(defun scroll-one-line-down (amount)
  "Scroll text of current window downward one line"
  (interactive "p")
  (scroll-down amount))

;; Moving one line up and down
(global-set-key "\C-z" 'scroll-one-line-up)
(global-set-key "\ez" 'scroll-one-line-down)

;; Opposite of C-x o
(defun prev-window ()
  (interactive)
  (other-window -1))
(define-key global-map (kbd "C-x p") 'prev-window)

(ido-mode 1)
(ido-everywhere 1)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point nil)
(setq ido-auto-merge-work-directories-length -1)
(setq ido-use-virtual-buffers t)

(ido-ubiquitous-mode 1)

;; Shows a list of buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; awesome goto line that shows the line numbers to the left
;; http://whattheemacsd.com/key-bindings.el-01.html
(global-set-key [remap goto-line] 'goto-line-with-feedback)
(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (goto-line (read-number "Goto line: ")))
    (linum-mode -1)))
(global-set-key "\eg" 'goto-line)

(setq smex-save-file (concat user-emacs-directory ".smex-items"))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

(projectile-global-mode)

;; Enable move point from window to window using Shift and the arrow keys
(windmove-default-keybindings)

(provide 'init-navigation)

