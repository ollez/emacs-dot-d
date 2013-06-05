(require 'paredit)

(add-hook 'clojure-mode-hook
	  (lambda ()
	    (enable-paredit-mode)))

(add-hook 'nrepl-interaction-mode-hook
	  (lambda ()
	    (nrepl-turn-on-eldoc-mode)))

(setq nrepl-hide-special-buffers t)

(setq nrepl-history-file "~/.emacs.d/nrepl-history")

(add-hook 'nrepl-mode-hook 'subword-mode)

(provide 'setup-clojure)

