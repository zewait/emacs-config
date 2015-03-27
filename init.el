;;; package --- init
;;; Commentary:
;;; Code:
;;==========
;; constant
;;==========
; gcc -xc++ -E -v -
(defconst SYSTEM-C-HEADERS '("/APPLICATIONS/Xcode.app/Contents/Developer/Toolchain\
s/XcodeDefault.xctoolchain/usr/include/c++/v1" "/usr/local/include" "Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/6.0/include" "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include" "/usr/include" "/System/Library/Frameworks" "/Library/Frameworks"))
(defvar semantic-tags-location-ring (make-ring 20))
(defalias 'yes-or-no-p 'y-or-n-p)

(setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))

(set-language-environment "UTF-8")
;;==============
;; global method
;;==============


;;=============
;; code style
;;=============
(require 'cc-mode)
(setq c-default-style "linux"
      c-basic-offset 4
	  tab-width 4)
(setq-default tab-width 4 indent-tabs-mode t)
;; automatic indentation
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
;; which will delete all characters until next non-whitespace when you delete whitespace
(add-hook 'c-mode-common-hook'(lambda () (c-toggle-hungry-state 1)))

(add-to-list 'load-path "~/.emacs.d/custom")
;; this is intended for manually installed libraries
(add-to-list 'load-path "~/.emacs.d/site-lisp")

; start package.el with emacs
(require 'package)
; add MELPA to repository list
(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
				 ("gnu" . "http://elpa.gnu.org/packages/")
				 ("marmalade" . "https://marmalade-repo.org/packages/")))
;; Install a hook running post-init.el *after* initialization took place
;(add-hook 'after-init-hook (lambda () (load "post-init.el")))

; initialize package.el
(package-initialize)

;; install packages
(defconst PACKAGES-INIT
  '(autopair
	company
	nyan-mode
	color-theme
	ac-c-headers
	auto-complete
	auto-complete-c-headers
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
	flycheck
	tern
	tern-auto-complete
	ac-etags
	company-tern
	emacs-eclim))

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
;; flycheck
(add-hook 'after-init-hook 'global-flycheck-mode)
;(add-hook 'after-init-hook 'global-company-mode)


(require 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(require 'color-theme)
(color-theme-initialize)
(color-theme-tty-dark)

(require 'setup-linum)
;; trun on autopair mode
(require 'autopair)
(autopair-global-mode)
;; trun on undo-tree mode
(require 'undo-tree)
(global-undo-tree-mode)
;; evil mode
(require 'setup-evil)
(require 'setup-org)

; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)


;; nyan
(require 'nyan-mode)
(nyan-mode)
(setq nyan-bar-length 10)


; Fix iedit bug in Mac
(define-key global-map (kbd "C-c ;") 'iedit-mode)



; start auto-complete with emacs
;(require 'auto-complete)
;(require 'auto-complete-config)
;(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;(ac-config-default)
;(ac-set-trigger-key "TAB")
;(ac-set-trigger-key "<tab>")
;(require 'ac-c-headers)
;(require 'auto-complete-config)
; do default config for auto-complete
;(require 'auto-complete-c-headers)
; auto-complete-c-headers
;(defun my:ac-c-header-init ()
;  (add-to-list 'ac-sources 'ac-source-c-headers)
;  (add-to-list 'ac-sources 'ac-source-c-header-symbols t)
;  (loop for x in SYSTEM-C-HEADERS do
;		(add-to-list 'achead:include-directories x)))
;(add-hook 'c++-mode-hook 'my:ac-c-header-init)
;(add-hook 'c-mode-hook 'my:ac-c-header-init)
(global-company-mode t)

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
(custom-set-variables
 '(livedown:autostart nil) ; automatically open preview when opening markdown files
 '(livedown:open t) ; automatically open the browser window
 '(livedown:port 1337)) ; port for livedown server
(require 'livedown)


;; setup javascript
(require 'setup-js)

;; eclim
(require 'setup-eclim)

;;; my function
(require 'setup-cocos2d)

(provide 'init)
;;; init.el ends here




