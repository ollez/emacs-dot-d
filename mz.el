;; OLLE HACKS AFTER HERE

;;;;;; fix the PATH variable
;; (defun set-exec-path-from-shell-PATH ()
;;   (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'"))
;;         (mz-home-from-shell (shell-command-to-string "$SHELL -i -c 'echo $MZ_HOME'"))
;;         (mz-pp-from-shell (shell-command-to-string "$SHELL -i -c 'echo $MZ_PACKAGE_PATHS'")))
;;     (setenv "PATH" path-from-shell)
;;     (setenv "MZ_HOME" mz-home-from-shell)
;;     (setenv "MZ_PACKAGE_PATHS" mz-pp-from-shell)
;;   (setq exec-path (split-string path-from-shell path-separator))))

(defun locate-mz-base ()
  (locate-dominating-file buffer-file-name "env.sh"))

(defun locate-project-dir() 
  (locate-dominating-file buffer-file-name "build.xml"))

(shell-command-to-string "echo $SHELL")
(if window-system (set-exec-path-from-shell-PATH))

(defun str-remove-newlines (s)
  (let* ((n (split-string s "\n"))
        (h (delete "\n" n))
        (i (delete "" h)))
    (first i)))

(defun mz-jack-in ()
  (interactive)
  (let ((mzb (locate-mz-base)))
    (setq mz-base mzb)
    (setq mz-home (concat mzb "/core"))))

(directory-files (concat mz-base "/packages"))

;;(setq mz-home (str-remove-newlines (getenv "MZ_HOME")))
(setq mz-packages-dirs (mapcar 'str-remove-newlines
                               (split-string (getenv "MZ_PACKAGE_PATHS")
                                             path-separator)))
(setq env-cmd "env.sh")
(setq env-cmd-prefix "-command")


(custom-set-variables
 '(auto-revert-interval 1)
 ;;'(global-auto-revert-mode 1)
 '(auto-revert-tail-mode t)
)

(setq revert-without-query
      '(".*\.log"))

(defun mzsh-cmd(s)
  (let ((cmd (format "%s %s" "mzsh" s)))
    (format "%s/%s %s %S" mz-home env-cmd env-cmd-prefix cmd)))

(defmacro mzsh (c)
  `(let* ((default-directory ,mz-home)
          (cmd (mzsh-cmd ,c))
          (res (shell-command-to-string cmd)))
     res))

(defun with-env (c)
  (let ((default-directory mz-home)
        (cmd (format "%s/%s %s %S"
                     mz-home
                     env-cmd
                     env-cmd-prefix
                     c)))
    (shell-command-to-string cmd)))

(defun ant (c dir)
  (let ((a (format " ant %s -buildfile %s/build.xml -Dnosvn=true" c dir)))
     (with-env a)))

(defmacro mz-package(name pkg-dir)
  `(defun ,(intern (format "mz-package-%s" (eval name))) ()
    (interactive)
    (message (format "CLEANING, BUILDING, INSERTING %s PLEASE WAIT" ,(eval name)))
    (message
     (concat
      (ant "clean" ,(eval pkg-dir))
      (ant "" ,(eval pkg-dir))
      (mzsh ,(format "mzadmin/dr pcommit %s/lib/*.mzp" (eval pkg-dir)))))))

(defun flatten (l)
   (if l
       (append (car l) (flatten (cdr l)))
     nil))

(defun get-file-name (path)
  (car
   (last
    (split-string path "/"))))

(defun mz-package-paths()
  (flatten
   (mapcar
    '(lambda (f)
       (directory-files f nil "^[^\.]*$"))
    mz-packages-dirs)))

(defun create-mz-package-functions()
  (let ((paths (mz-package-paths)))
    (while paths
      (let ((n (get-file-name (car paths)))
            (path (car paths)))
        (mz-package n path)
        (setq paths (cdr paths))))))

(create-mz-package-functions)

(mz-package "core" mz-home)

(eval mz-home)
(defun mz-status ()
  "mzsh status command"
  (interactive)
  (message (mzsh "status")))

(defun mz-startup (a)
  "mzsh startup command"
  (interactive "sPico: \n")
  (message
   (mzsh (format "startup %s" a))))

(defun mz-restart (a)
  "mzsh restart command"
  (interactive "sPico: \n")
  (message
   (mzsh (format "restart %s" a))))

(defun mz-desktop ()
  (interactive)
  (mzsh "desktop")
  (message "desktop is started"))

(defun mz-shutdown (a)
  (interactive "sPico: \n")
  (message
   (mzsh (format "shutdown %s" a))))

(defun mz-package-remove (a)
  (interactive "sPackage: \n")
  (message
   (mzsh (format "mzadmin/dr premove  %s" a))))

(defun mz-tail (a)
  (interactive "sPico: \n")
  (let ((oldbuf (current-buffer))
        (newbuf (find-file (format "%s/core/log/%s.log" mz-home a))))
    (set-buffer newbuf)
    (revert-buffer 'ignore-auto 'dont-ask)
    (auto-revert-tail-mode 1)
    (set-buffer oldbuf)))

(defun find-java-file (a)
  (interactive "sType: \n")
  (find-name-dired mz-home (format "*%s*.java" a)))

(defun find-java-type (type &optional dir)
  (interactive)
  (let ((d (if dir dir mz-home)))
    (find-grep-dired d (format "class %s" type))))

(defun rest-send-file (a b c d e)
  (interactive "sURL: \n sMethod: \n sFile: \n sUser: \n sPassword: \n")
  (shell-command-to-string
   (format "curl -X %s --data-binary @%s -H %S %s --user %s:%s" b c "Content-Type: application/octet-stream" a d e)))



;; (add-hook 'eshell-mode-hook
;;           '(lambda nil
;;              (eshell/export "AWS_SECRET_ACCESS_KEY=OwGVdxLQdY/Ut7qYewKhqmbqlUGppXljIpIr/2Si")
;;              (eshell/export "AWS_ACCESS_KEY_ID=AKIAJLCJ5A4XP7PXVPBQ")
;;              (let ((path))
;;                (setq path "/usr/X11/bin")
;;                (setq path (concat path ":/usr/bin"))
;;                (setq path (concat path ":/bin"))
;;                (setq path (concat path ":/usr/sbin"))
;;                (setq path (concat path ":/sbin"))
;;                (setq path (concat path ":/usr/local/bin"))
;;                (setq path (concat path ":/Users/ollem/bin"))
;;                (setenv "PATH" path))))
