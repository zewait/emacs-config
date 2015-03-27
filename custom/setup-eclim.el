;;; Package --- summary
;;; Code:
;;; Commentary:
(require 'eclim)
(require 'eclimd)
(require 'company)
(require 'company-emacs-eclim)

(custom-set-variables
 '(eclim-eclipse-dirs (concat (getenv "ECLIPSE_HOME") "/eclipse"))
 '(eclim-executeable (concat (getenv "ECLIPSE_HOME") "/eclim")))

(defun eclim-hook()
  (eclim-mode t)
  (setq help-at-pt-display-when-idle t)
  (setq help-at-pt-timer-delay 0.1)
  (help-at-pt-set-timer)
  (company-emacs-eclim-setup))

(add-hook 'java-mode-hook 'eclim-hook)

(provide 'setup-eclim)
;;; setup-eclim.el ends here
