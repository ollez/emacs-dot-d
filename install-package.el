;; Install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   (cons 'exec-path-from-shell melpa)
   ;;(cons 'magit melpa)
   (cons 'paredit melpa)
   ;; (cons 'move-text melpa)
   ;;(cons 'gist melpa)
   ;; (cons 'htmlize melpa)
   ;; (cons 'visual-regexp melpa)
   ;;(cons 'smartparens melpa)
   ;; (cons 'restclient melpa)
   ;; (cons 'elisp-slime-nav melpa)
   ;; (cons 'slime-js marmalade)
   ;;(cons 'git-commit-mode melpa)
   ;;(cons 'gitconfig-mode melpa)
   ;;(cons 'gitignore-mode melpa)
   (cons 'clojure-mode melpa)
   (cons 'nrepl melpa)
;;   (cons 'cyberpunk-theme melpa)
))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

(provide 'install-package)