;;=============
;; code style
;;=============
(require 'cc-mode)
(setq c-default-style "linux"
      ;c-basic-offset 4
	  tab-width 4)
(setq-default tab-width 4 indent-tabs-mode t)
;; automatic indentation                                                
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
;; which will delete all characters until next non-whitespace when you delete whitespace                                                        
(add-hook 'c-mode-common-hook'(lambda () (c-toggle-hungry-state 1)))

(add-to-list 'load-path "~/.emacs.d/custom")
;; this is intended for manually installed libraries
(add-to-list 'load-path "~/.emacs.d/site-lisp/")
;; show line num
;(global-linum-mode)

;;==========
;; constant
;;==========
(setq system-c-headers '("/Applications/Xcode.app/Contents/Developer/Toolchain\
s/XcodeDefault.xctoolchain/usr/include/c++/v1" "/usr/local/include" "Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/6.0/include" "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include" "/usr/include" "/System/Library/Frameworks" "/Library/Frameworks"))


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
;; trun on undo-tree mode
(require 'undo-tree)
(global-undo-tree-mode)
;; evil mode
(require 'evil)
(evil-mode 1)

; start auto-complete with emacs
(require 'auto-complete)
; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)
; auto-complete-c-headers
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (loop for x in system-c-headers do
		(add-to-list 'achead:include-directories x)))
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)

; Fix iedit bug in Mac
(define-key global-map (kbd "C-c ;") 'iedit-mode)

;;=======
;; cedet
;;=======
(require 'setup-cedet)

(mapcar 'semantic-add-system-include system-c-headers)


(add-hook 'c-mode-hook (lambda ()
						 (add-to-list 'ac-sources 'ac-source-c-headers)
						 (add-to-list 'ac-sources 'ac-source-c-header-symbols t)))

; let's define a function which adds semantic as a suggestion backend to auto complete
; and hook this function to c-mode-common-hook
(defun my:add-semantic-to-autocomplete() 
  (add-to-list 'ac-sources 'ac-source-semantic)
)
(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)
;; ede config
; create a project for our program.
(ede-cpp-root-project "my project" :file "~/Documents/workspace/cpp/demos/my_program/src/main.cpp"
		            :include-path '("/../my_inc"))
; you can use system-include-path for setting up the system header file locations.
; turn on automatic reparsing of open buffers in semantic

;; ecb
(require 'ecb)
;(require 'ecb-autoloads)


