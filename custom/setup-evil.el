(require 'evil)
(evil-mode 1)

(defun semantic-goto-definition (point)
   "Goto definition using semantic-ia-fast-jump save the pointer marker if tag is found"
   (interactive "d")
   (condition-case err
       (progn
         (ring-insert semantic-tags-location-ring (point-marker))
         (semantic-ia-fast-jump point))
     (error
      ;;if not found remove the tag saved in the ring
      (set-marker (ring-remove semantic-tags-location-ring 0) nil nil)
      (signal (car err) (cdr err)))))
(defun semantic-pop-tag-mark ()
   "popup the tag save by semantic-goto-definition"
   (interactive)
   (if (ring-empty-p semantic-tags-location-ring)
       (message "%s" "No more tags available")
     (let* ((marker (ring-remove semantic-tags-location-ring 0))
               (buff (marker-buffer marker))
                  (pos (marker-position marker)))
       (if (not buff)
             (message "Buffer has been deleted")
         (switch-to-buffer buff)
         (goto-char pos))
       (set-marker marker nil nil))))
;; enter to emacs open emacs edit mode
;(setq evil-default-state 'emacs) 

; C-o按键调用vim功能（就是临时进入normal模式，然后自动回来） 
; 比如，你要到第一行，可以使用emacs的 M-<，也可以使用evil的C-o gg 
; 其中C-o是进入vim模式 gg是去第一行，命令之后自动还原emacs模式！ 
; "Fuck you!" 如何删除""里面的内容呢？Emacs的话，默认文本对象能力不强 
; 有了evil的拓展 C-o di" 轻轻松松搞定~ 
; 比如C-o 3dd C-o dib C-o yy C-o p C-o f * 舒服啊~发挥想象力吧 "')
(define-key evil-emacs-state-map (kbd "C-o") 'evil-execute-in-normal-state) 


(provide 'setup-evil)
