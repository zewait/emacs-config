;;; package --- Summary
;;; Commentary:
;;; Code:
(require 'company)
(global-company-mode t)
;(define-key company-mode-map "\t" nil)
(define-key company-mode-map [(backtab)] 'company-complete-common)

(provide 'setup-company)
;;; setup-company.el ends here
