;;; package --- summary
;;; Commentary:
;;; code:
(setq org-todo-keywords
	  '((sequence "TODO(t)" "DOING(i!)" "HANGUP(h!)" "|" "DONE(d!)" "CANCEL(c!)")))
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ditaa . t)))

(provide 'setup-org)

;;; setup-org ends here
