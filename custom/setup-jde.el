(add-to-list 'load-path (format "%s/lisp" "~/.emacs.d/jdee-2.4.1" "Path to JDEE"))
(autoload 'jde-mode "jde" "JDE mode." t)
(setq auto-mode-alist (append '(("\\.java\\'" . jde-mode)) auto-mode-alist))


(provide 'setup-jde)
