; gcc -xc++ -E -v -
(defconst SYSTEM-C-HEADERS '("." "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1" "/usr/local/include" "Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/6.0/include" "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include" "/usr/include" "/System/Library/Frameworks" "/Library/Frameworks" "/Users/shifanhuang/applications/cocos2dx/cocos2d-x-3.4/cocos"))

(setq company-clang-arguments '("-I/Users/shifanhuang/applications/cocos2dx/cocos2d-x-3.4/cocos"))
(require 'cc-mode)
(setq c-default-style "linux"
      c-basic-offset 4)
;; which will delete all characters until next non-whitespace when you delete whitespace
;(add-hook 'c-mode-common-hook'(lambda () (c-toggle-hungry-state 1)))



(require 'ac-c-headers)
;(setq cc-search-directories SYSTEM-C-HEADERS)
(defun my-c-hook ()
  ;; init headers
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-header-symbols t)
  (loop for x in SYSTEM-C-HEADERS do
		(add-to-list 'cc-search-directories x)))
  ;)
  ;;(defvar achead:include-directories SYSTEM-C-HEADERS))
(add-hook 'c++-mode-hook 'my-c-hook)
;(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'c-mode-hook 'my-c-hook)
(add-hook 'c-mode-common-hook 'ac-cc-mode-setup)

(require 'auto-complete-clang)
(setq ac-clang-flags
	  (mapcar (lambda (item) (concat "-I" item)) SYSTEM-C-HEADERS))
(define-key c++-mode-map (kbd "<backtab>") 'ac-complete-clang)
(define-key c-mode-map (kbd "<backtab>") 'ac-complete-clang)


(provide 'setup-cpp)
