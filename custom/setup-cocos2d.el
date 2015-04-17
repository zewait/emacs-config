;;; package --- provide everything about cocos2d
;;; Commentary:
;;; Code:
(require 'ggtags)

(define-key c-mode-map (kbd "C-c m") 'cocos2dx-run-with-mac)
(define-key c++-mode-map (kbd "C-c m") 'cocos2dx-run-with-mac)

(defun cocos2dx-run-with-platform (platform)
  "Run cocos2dx width PLATFORM, exec shell `cocos run -h` to see PLATFORM."
  (interactive "sEnter platform name:")
	(if (get-buffer "*cocos2dx*")
		(kill-buffer "*cocos2dx*"))
	(with-output-to-temp-buffer "*cocos2dx*"
	  (async-shell-command (concat "cocos run -p "
								   platform
								   " -s "
							   (ggtags-project-root (ggtags-find-project)))
					   "*cocos2dx*"
					   "*Messages*")
		))

;;; has & to run background, so can't use
;(defun cocos2dx-run-with-ios ()
;  "Run cocos2dx with iOS platform."
;  (interactive)
;  (cocos2dx-run-with-platform "ios"))


(defun cocos2dx-run-with-mac ()
  	"Run cocos2dx with mac platform."
	(interactive)
	(cocos2dx-run-with-platform "mac"))

(provide 'setup-cocos2d)
;;; setup-cocos2d.el ends here
