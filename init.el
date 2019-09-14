;; Turn off mouse interface early in startup to avoid momentary display

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq inhibit-startup-message t)

(require 'system-environment)

(require 'backup-settings)

(require 'install-package)

(require 'setup-shell)

(when is-mac (require 'mac))

(require 'appearance)

(require 'setup-clojure)

(require 'setup-elisp)

(require 'keyboard-bindings)

;; Emacs server
(require 'server)
(unless (server-running-p)
  (server-start))
(put 'upcase-region 'disabled nil)


(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;;(autoload 'gtags-mode "gtags" "" t)


(require 'undo-tree)
(global-undo-tree-mode)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (dracula-theme undo-tree paredit magit exec-path-from-shell cider))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
