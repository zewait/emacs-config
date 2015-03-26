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

(add-hook 'java-mode-hook (lambda ()
							(eclim-mode t)
							(company-emacs-eclim-setup)
							(company-mode t)
							))

(provide 'setup-eclim)
;;; setup-eclim.el ends here
