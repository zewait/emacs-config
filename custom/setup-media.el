
;; EMMS(player)
(require 'emms-setup)
(emms-standard)
(emms-default-players)
(define-emms-simple-player afplay '(file)
   (regexp-opt '(".mp3" ".m4a" ".acc"))
   "afplay")
(setq emms-player-list `(,emms-player-afplay))

(setq emms-source-file-default-directory "~/Music/my-list")

(provide 'setup-media)
