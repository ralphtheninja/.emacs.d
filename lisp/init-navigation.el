(require 'init-elpa)
;; https://www.emacswiki.org/emacs/InteractivelyDoThings
(require 'ido)
(require 'recentf)
;; https://github.com/DarwinAwardWinner/ido-completing-read-plus
(require-package 'ido-ubiquitous)
;; https://github.com/nonsequitur/smex
(require-package 'smex)
;; https://github.com/bbatsov/projectile
(require-package 'projectile)

(setq recentf-save-file (concat user-emacs-directory ".recentf"))
;; https://www.emacswiki.org/emacs/RecentFiles
(recentf-mode 1)
(setq recentf-max-menu-items 40)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(ido-mode 1)
(ido-everywhere 1)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point nil)
(setq ido-auto-merge-work-directories-length -1)
(setq ido-use-virtual-buffers t)

(ido-ubiquitous-mode 1)

;; Shows a list of buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

(setq smex-save-file (concat user-emacs-directory ".smex-items"))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

(projectile-global-mode)

;; Enable move point from window to window using Shift and the arrow keys
(windmove-default-keybindings)

(provide 'init-navigation)

