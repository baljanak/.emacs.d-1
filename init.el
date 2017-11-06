;;; init.el --- user init file      -*- no-byte-compile: t -*-


;; Package and compile related
(setq load-prefer-newer t)
(load "~/.emacs.d/package-stuff.el")
;; package-initialize is called inside package-stuff.el
;; (package-initialize)
(el-get-bundle auto-compile)
(require 'auto-compile)
(setq auto-compile-display-buffer nil)
(setq auto-compile-mode-line-counter t)
(auto-compile-on-load-mode)
(auto-compile-on-save-mode)

;; Set exec-path from $PATH
(el-get-bundle exec-path-from-shell)
(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)


;;;; Configure useful emacs extensions


(load "~/.emacs.d/helm-stuff.el")
(load "~/.emacs.d/projectile-stuff.el")
(load "~/.emacs.d/grep-stuff.el")
(load "~/.emacs.d/tramp-stuff.el")
(load "~/.emacs.d/magit-stuff.el")
(load "~/.emacs.d/editing-stuff.el")
(load "~/.emacs.d/tabbar-stuff.el")
(load "~/.emacs.d/modeline-stuff.el")

;; PYTHON RELATED
(load "~/.emacs.d/python-stuff.el")

;; GO RELATED
(load "~/.emacs.d/go-stuff.el")


;; Theme related
(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame
                  (load "~/.emacs.d/theme-stuff.el"))))
  (load "~/.emacs.d/theme-stuff.el"))

(if (daemonp)
    (global-unset-key (kbd "C-z"))
  )

(el-get 'sync)
