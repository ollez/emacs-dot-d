(setq  ring-bell-function 'ignore
       font-lock-maximum-decoration t
       color-theme-is-global t
       truncate-partial-width-windows nil)

;; Highlight current line
(global-hl-line-mode 0)
(set-default-font "Source Code Pro 14")

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (blink-cursor-mode 0)
  (set-cursor-color "#FF33A8")
  (setq-default cursor-type 'bar) 
  )

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(set-language-environment "UTF-8")

;; Every time a window is started, make sure it get maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(load-theme 'dracula t)

(provide 'appearance)
