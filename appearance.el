(setq  ring-bell-function 'ignore
       font-lock-maximum-decoration t
       color-theme-is-global t
       truncate-partial-width-windows nil)

;; Highlight current line
;;(global-hl-line-mode 0)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (blink-cursor-mode 1))

(load-theme 'dracula t)

(provide 'appearance)
