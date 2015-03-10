;;; package --- summary
;;; commentary:
;;; code:
(require 'ggtags)

(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (ggtags-mode 1))))

(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)
(define-key ggtags-mode-map (kdb "C-c g p") 'ggtags-prev-mark)
(define-key ggtags-mode-map (kdb "C-c g n") 'ggtags-next-mark)
(define-key ggtags-mode-map (kdb "C-c g t") 'ggtags-find-tag-dwim)

(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)


(provide 'setup-ggtags)
;;; setup-ggtags ends here
