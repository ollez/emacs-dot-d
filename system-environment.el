
(defvar is-windows (string-match "windows-nt" (symbol-name system-type)))
(defvar is-cygwin (string-match "cygwin" (symbol-name system-type)))
(defvar is-mac (string-match "darwin" (symbol-name system-type)))
(defvar is-linux (string-match "gnu/linux" (symbol-name system-type)))

(provide 'system-environment)
