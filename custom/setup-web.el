(require 'web-mode)

(setq web-mode-attr-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-html-offset 2)
(setq web-mode-css-offset 2)
(setq web-mode-script-offset 2)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-sql-indent-offset 2)
;(setq web-mode-content-types-alist
;			'(("jsx" . "\\.ios\\.js\\'")))
;(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.ios.js$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.htm[l]?$" . web-mode))
(defadvice web-mode-highlight-part (around tweak-jsx activate)
	(if (equal web-mode-content-type "jsx")
			(let ((web-mode-enable-part-face nil))
				ad-do-it)
		ad-do-it))


;g(setq web-mode-enable-current-column-highlight t)
(setq web-mode-ac-sources-alist
			'(("css" . (ac-source-css-property))
				("html" . (ac-source-words-in-buffer ac-source-abbrev))))

(defun my/web-mode-hook ()
  "Hooks for web mode."
    (setq tab-width 2)
	(require 'emmet-mode)
	(emmet-mode t))
(add-hook 'web-mode-hook 'my/web-mode-hook)
(add-hook 'emmet-mode-hook (lambda () (setq emmet-indent-after-insert nil)))
(add-hook 'web-mode-before-auto-complete-hooks '(lambda ()
																									(let ((web-mode-cur-language (web-mode-language-at-pos)))
																										(if (string= web-mode-cur-language "css")
																												(setq emmet-use-css-transform t)
																											(setq emmet-use-css-transform nil)))))


(provide 'setup-web)
