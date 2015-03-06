;; 'sudo npm -g install jshint' to support flycheck on js-mode
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)

(setq js2-highlight-level 4)

(provide 'setup-js)
