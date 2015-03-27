;;; package --- summary
;;; Commentary:
;;; Code:
(require 'company)
(require 'company-jedi)
(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))
(add-hook 'python-mode-hook 'my/python-mode-hook)


(provide 'setup-python)
;;; setup-python.el ends here
