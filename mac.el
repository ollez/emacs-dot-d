
(setq mac-option-modifier nil
      mac-command-modifier 'meta
      x-select-enable-clipboard t)
(global-set-key (kbd "M-,") 'comment-or-uncomment-current-line-or-region)

;; mac friendly font
(when window-system
  (set-face-attribute 'default nil :font "Monaco-12"))

;; keybinding to toggle full screen mode
(global-set-key (quote [M-f10]) (quote ns-toggle-fullscreen))

;; Move to trash when deleting stuff
(setq delete-by-moving-to-trash t
      trash-directory "~/.Trash/emacs")

;; Don't open files from the workspace in a new frame
(setq ns-pop-up-frames nil)

;; Use aspell for spell checking: brew install aspell --lang=en
(setq ispell-program-name "/usr/local/bin/aspell")

(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

(provide 'mac)
