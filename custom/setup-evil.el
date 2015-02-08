(require 'evil)
(evil-mode 1)

(setq evil-default-state 'emacs) 
;这个是打开文件后默认进入emacs模式 
;我还要在emacs和vim模式里面切换：C-z，换来换去啊 

(define-key evil-emacs-state-map (kbd "C-o") 'evil-execute-in-normal-state) 
; C-o按键调用vim功能（就是临时进入normal模式，然后自动回来） 
; 比如，你要到第一行，可以使用emacs的 M-<，也可以使用evil的C-o gg 
; 其中C-o是进入vim模式 gg是去第一行，命令之后自动还原emacs模式！ 
; "Fuck you!" 如何删除""里面的内容呢？Emacs的话，默认文本对象能力不强 
; 有了evil的拓展 C-o di" 轻轻松松搞定~ 
; 比如C-o 3dd C-o dib C-o yy C-o p C-o f * 舒服啊~发挥想象力吧 "')


(provide 'setup-evil)
