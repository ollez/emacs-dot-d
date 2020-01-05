(require 'paredit)

(add-hook 'clojure-mode-hook
	  (lambda ()
	    (enable-paredit-mode)))

(setq nrepl-hide-special-buffers t)

(setq nrepl-history-file "~/.emacs.d/nrepl-history")

(add-hook 'nrepl-mode-hook 'subword-mode)

(setq nrepl-hide-special-buffers t)



(setq cider-prompt-for-symbol nil)


(setq cider-save-file-on-load nil)

(global-company-mode)

(add-hook 'cider-repl-mode-hook #'cider-company-enable-fuzzy-completion)
(add-hook 'cider-mode-hook #'cider-company-enable-fuzzy-completion)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojurescript-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)


;; Enter cider mode when entering the clojure major mode
(add-hook 'clojure-mode-hook 'cider-mode)

(add-hook 'clojure-mode-hook #'aggressive-indent-mode)

;; Turn on auto-completion with Company-Mode
(global-company-mode)
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)

;; Replace return key with newline-and-indent when in cider mode.
(add-hook 'cider-mode-hook '(lambda () (local-set-key (kbd "RET") 'newline-and-indent)))


(setenv "GOOGLE_APPLICATION_CREDENTIALS" "/Users/ollem/Private/pubsubclient.json")

(provide 'setup-clojure)

