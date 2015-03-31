;;; package --- javascript mode setup
;;; Commentary:
;;; Code:
;; `sudo npm -g install jshint` to support flycheck on js-mode
;; `sudo npm -g install jsxhint` to support flycheck on jsx-mode
;; `sudo npm -g install tern` to support a stand-alone code-analysis engine for js
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)

;; tab-width
(setq js-indent-level 4)
(setq js2-highlight-level 4)

;; Tern
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(add-hook 'jsx-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
  '(progn
	 (require 'tern-auto-complete)
	 (tern-ac-setup)))
(with-eval-after-load 'company
				 (add-to-list 'company-backends 'company-tern))

;; if you don't like circles after object's own properties consider less annoying marker for that purpose
;(setq company-tern-property-marker "")
;; you can trim too long function signatures to the frame width
;(setq company-tern-meta-as-single-line t)
;(setq company-tooltip-align-annotations t)
;; when you modify .tern-project file but Tern does not auto reload,
;; you need to manually kill Tern server
(defun delete-tern-process ()
  (interactive)
  (delete-process "Tern"))

;;; jsx
; tab-width
;(setq jsx-indent-level 2)
;(add-to-list 'auto-mode-alist '("\\.jsx$" . jsx-mode))
;(require 'flycheck)
;(flycheck-define-checker jsxhint-checker
;  "A JSX syntax and style style checker based on JSXHint."
;
;  :command ("jsxhint" source)
;  :error-patterns
;  ((error line-start (1+ nonl) ": line" line ", col " column ", " (message) line-end))
;  :modes (jsx-mode))
;(add-hook 'jsx-mode-hook (lambda ()
;						   (flycheck-select-checker 'jsxhint-checker)
;						   (flycheck-mode)))
;(setq jsx-indent-level 4)

(provide 'setup-js)
;;; setup-js.el ends here
