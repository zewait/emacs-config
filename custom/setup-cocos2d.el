;;; package --- summary
;;; Commentary:
;;; Code:
(require 'ggtags)

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


(defun cocos2dx-run-with-ios ()
  "Run cocos2dx with iOS platform."
  (interactive)
  (cocos2dx-run-with-platform "ios"))


(defun cocos2dx-run-with-mac ()
  	"Run cocos2dx with mac platform."
	(interactive)
	(cocos2dx-run-with-platform "mac"))

(provide 'setup-cocos2d)
;;; setup-cocos2d.el ends here
