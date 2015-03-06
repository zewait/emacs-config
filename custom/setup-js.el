;;; package --- javascript mode setup
;;; Commentary:
;;; Code:
;; `sudo npm -g install jshint` to support flycheck on js-mode
;; `sudo npm -g install tern` to support a stand-alone code-analysis engine for js
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)

(setq js2-highlight-level 4)

;; Tern
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
  '(progn
	 (require 'tern-auto-complete)
	 (tern-ac-setup)))
(add-to-list 'company-backends 'company-tern)
;; if you don't like circles after object's own properties consider less annoying marker for that purpose
;(setq company-tern-property-marker "")
;; you can trim too long function signatures to the frame width
(setq company-tern-meta-as-single-line t)
;; when you modify .tern-project file but Tern does not auto reload,
;; you need to manually kill Tern server
(defun delete-tern-process ()
  (interactive)
  (delete-process "Tern"))

(provide 'setup-js)
;;; setup-js.el ends here
