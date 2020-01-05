; list the packages you want
(setq package-list '(magit
		     cider
		     exec-path-from-shell
		     paredit
		     aggressive-indent
		     rainbow-delimiters
		     zenburn-theme
		     dracula-theme
		     helm-ag
		     undo-tree
		     yaml-mode
		     company))

; list the repositories containing them
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
			 ("gelpa" . "http://elpa.gnu.org/packages/")
			 ("elpa" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(provide 'install-package)

