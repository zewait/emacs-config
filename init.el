;;; package --- init
;;; Commentary:
;;; Code:
;;==========
;; constant
;;==========
(defvar semantic-tags-location-ring (make-ring 20))
(defalias 'yes-or-no-p 'y-or-n-p)

(setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))

;(setq debug-on-error t)
(setq-default indent-tabs-mode nil)
(set-language-environment "UTF-8")
(defvaralias 'evil-shift-width 'tab-width)

;;===============
;; global key set
;;===============
;(global-set-key (kbd "TAB") 'tab-to-tab-stop)
(global-set-key (kbd "RET") 'newline-and-indent)

;;==============
;; global method
;;==============


;;=============
;; code style
;;=============

(add-to-list 'load-path "~/.emacs.d/custom")
;; this is intended for manually installed libraries
(let ((base "~/.emacs.d/site-lisp"))
	(add-to-list 'load-path base)
	(dolist (f (directory-files base))
		(let ((name (concat base "/" f)))
			(when (and (file-directory-p name)
								 (not (equal f ".."))
								 (not (equal f ".")))
				(add-to-list 'load-path name)))))

; start package.el with emacs
(require 'package)
; add MELPA to repository list
;("marmalade" . "https://marmalade-repo.org/packages/")
;("gnu" . "http://elpa.gnu.org/packages/")
(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")))
;; Install a hook running post-init.el *after* initialization took place
;(add-hook 'after-init-hook (lambda () (load "post-init.el")))

; initialize package.el
(package-initialize)

;; install packages
(defconst PACKAGES-INIT
  '(company
	nyan-mode
	color-theme
	auto-complete
	tern-auto-complete
	ac-c-headers
	ggtags
	ecb
	iedit
	undo-tree
	evil
	yasnippet
	js2-mode
	ac-js2
	web-beautify
	markdown-mode
	markdown-mode+
	tern
	ac-etags
	company-tern
	emacs-eclim
	company-jedi
	jsx-mode
	weibo
	web-mode
	emmet-mode
	anything
	indent-guide
	emms))


(defun install-packages ()
  "Install all required packages."
  (interactive)
  (unless package-archive-contents
	(package-refresh-contents))
  (dolist (package PACKAGES-INIT)
	(unless (package-installed-p package)
	  (package-install package))))
(install-packages)
	

(tool-bar-mode -1)
(electric-pair-mode t)
(global-hl-line-mode t)
;; flycheck
;(add-hook 'after-init-hook 'global-flycheck-mode)
;(add-hook 'after-init-hook 'global-company-mode)


(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(require 'color-theme)
(color-theme-initialize)
(color-theme-tty-dark)

(require 'setup-linum)
;; trun on undo-tree mode
(require 'undo-tree)
(global-undo-tree-mode)
;; evil mode
(require 'setup-evil)
(require 'setup-org)

;; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)


;; nyan
;(require 'nyan-mode)
;(nyan-mode)
;(setq nyan-bar-length 10)


; Fix iedit bug in Mac
(define-key global-map (kbd "C-c ;") 'iedit-mode)


; start auto-complete with emacs
(require 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;(setq-default ac-sources '(ac-source-yasnippet ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
(ac-config-default)
;(ac-set-trigger-key "TAB")
;(ac-set-trigger-key "<tab>")

(add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
(add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
(add-hook 'auto-complete-mode 'ac-common-setup)
(add-to-list 'ac-modes 'objc-mode)

;(require 'setup-company)


(require 'setup-python)

(require 'setup-ggtags)

;;=======
;; cedet
;;=======
;(require 'setup-cedet)
;(semantic-mode 1)
;(mapcar 'semantic-add-system-include SYSTEM-C-HEADERS)
;(add-hook 'c-mode-hook (lambda ()
;						 (add-to-list 'ac-sources 'ac-source-c-headers)
;						 (add-to-list 'ac-sources 'ac-source-c-header-symbols t)))
;(add-hook 'c++-mode-hook (lambda ()
;						 (add-to-list 'ac-sources 'ac-source-c-headers)
;						 (add-to-list 'ac-sources 'ac-source-c-header-symbols t)))
; let's define a function which adds semantic as a suggestion backend to auto complete
; and hook this function to c-mode-common-hook
;(defun my:add-semantic-to-autocomplete()
  ;(add-to-list 'ac-sources 'ac-source-semantic)
;)
;(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)

;; ecb
(require 'ecb)
;(require 'ecb-autoloads)


;; livedown
; must npm install -g livedown
(require 'livedown)


;; eclim
(require 'setup-eclim)


;; indent-guide
(indent-guide-global-mode)

(require 'setup-media)


;; weibo
(require 'weibo)
(setq weibo-consumer-key "3439580880")
(setq weibo-consumer-secret "c1cc2443c3e7dd1a0dca7a8e941eb161")

;; c/c++
(require 'setup-cpp)

;; iOS
;(require 'setup-ios)

(require 'setup-web)
;; setup javascript
(require 'setup-js)

;;; my function
(require 'setup-cocos2d)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(eclim-eclipse-dirs (concat (getenv "ECLIPSE_HOME") "/eclipse"))
 '(eclim-executeable (concat (getenv "ECLIPSE_HOME") "/eclim"))
 '(livedown:autostart nil)
 '(livedown:open t)
 '(livedown:port 1337)
 '(tab-width 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init)
;;; init.el ends here
