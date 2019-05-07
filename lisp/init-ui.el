;; Sets up the UI

(require 'init-elpa)

;;; Code:
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(set-face-attribute 'default nil :height 140)
(setq-default line-spacing 0.4)

(setq
      x-select-enable-clipboard t
      x-select-enable-primary t
      save-interprogram-paste-before-kill t
      apropos-do-all t
      mouse-yank-at-point t)

(blink-cursor-mode 0)
(setq-default cursor-type 'bar)
(set-cursor-color "#cccccc")
(setq ring-bell-function 'ignore)

;; Split the current buffer into four evenly wide vertical buffers
(defun split-windows-into-four-vertical ()
  (interactive)
  (delete-other-windows)
  (command-execute 'split-window-right)
  (command-execute 'split-window-right)
  (command-execute 'split-window-right)
  (command-execute 'balance-windows)
)
(global-set-key (kbd "C-x 6") 'split-windows-into-four-vertical)

;; Split the current buffer into three evenly wide vertical buffers
(defun split-windows-into-three-vertical ()
  (interactive)
  (delete-other-windows)
  (command-execute 'split-window-right)
  (command-execute 'split-window-right)
  (command-execute 'balance-windows)
)
(global-set-key (kbd "C-x 4") 'split-windows-into-three-vertical)

;; line and column mode
(setq line-number-mode t)
(setq column-number-mode t)

;; Highlight trailing whitespace! Toggle with F9
(require 'highlight-chars)
(global-set-key (kbd "<f9>") 'hc-toggle-highlight-trailing-whitespace)
(hc-toggle-highlight-trailing-whitespace)

(require-package 'markdown-mode)
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(provide 'init-ui)
;;; init-ui.el ends here

