(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(eval-after-load "enriched"
  '(defun enriched-decode-display-prop (start end &optional param)
     (list start end)))

(setq inhibit-startup-message t)

(require 'package) ;; You might already have this line
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Load emacs config modules
(let* ((emacs-dir (file-name-as-directory user-emacs-directory))
      (hooks-dir (file-name-as-directory (concat emacs-dir "hooks")))
      (config-file (concat emacs-dir "config.el"))
      (hook-files  (directory-files-recursively hooks-dir ".*\.el$")))
  (progn
    (load config-file)
    (mapcar 'load hook-files)))
  

;; Disable unwanted commands
(put 'suspend-frame 'disabled t)
