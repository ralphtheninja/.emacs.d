(setq-default js2-global-externs '("global" "module" "process" "require" "jQuery" "$" "_"
                                   "buster" "sinon" "assert" "refute" "setTimeout"
                                   "clearTimeout" "setInterval" "clearInterval"
                                   "location" "__dirname" "__filename" "console"
                                   "JSON" "Buffer" "Image" "FileReader"))
(setq-default js2-basic-offset 2)
(setq-default js2-strict-missing-semi-warning nil)
(setq-default js2-strict-inconsistent-return-warning nil)
(setq-default js2-idle-timer-delay 0.1)

;; Don't redefine M-j for me please, js2-mode
(define-key js2-mode-map (kbd "M-j") nil)

(provide 'setup-js2-mode)
