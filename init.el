;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq inhibit-startup-message t)

(let ((package-directory (expand-file-name "site-lisp" user-emacs-directory)))
  (add-to-list 'load-path user-emacs-directory)
  (add-to-list 'load-path package-directory))

(require 'system-environment)

(require 'backup-settings)

(require 'setup-package)

(require 'install-package)

(require 'setup-shell)

(when is-mac (require 'mac))

(require 'appearance)

(require 'setup-clojure)

(require 'setup-elisp)

;; Emacs server
(require 'server)
(unless (server-running-p)
  (server-start))
(put 'upcase-region 'disabled nil)
