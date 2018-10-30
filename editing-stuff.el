;; General purpose stuff to make editing more peaceful
(setq inhibit-startup-screen t)
(setq debug-on-quit nil)
(setq message-log-max 2000)
(size-indication-mode t)
(delete-selection-mode 0)
(transient-mark-mode 0)
(setq-default wrap-lines t)

;; Auto refresh buffers
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose t)

;; Open files in the same frame
(setq ns-pop-up-frames nil)

;; DisableMenubars and Toolbars
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Powerline
(el-get-bundle powerline)
(require 'powerline)
(powerline-default-theme)

;; ;; Multiple Major Mode support
;; (require 'mmm-auto)
;; (setq mmm-global-mode 'maybe)
;; (mmm-mode t)

;; Delete trailing whitespaces
(el-get-bundle whitespace)
(require 'whitespace)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;Set backup dir
(setq auto-save-directory-fallback "~/.saves")
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;; Auto highlight symbol
(el-get-bundle auto-highlight-symbol)
;; (require 'auto-highlight-symbol)
;; (global-highlight-symbols-mode t)

;; Rainbow delimiters - Match parens
(el-get-bundle rainbow-delimiters)
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Smartparens - Add parens automatically
(show-paren-mode 1)
(setq show-paren-style 'expression)
(el-get-bundle smartparens)
;; (require 'smartparens)
;; (smartparens-global-mode 1)

;; Autocomplete
(el-get-bundle auto-complete)
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(setq
 ac-auto-show-menu 1
 ac-auto-start t
 ac-menu-height 20
 ac-delay 0.01
 )
(global-auto-complete-mode t)


;; Swiper (better C-s)
(el-get-bundle swiper-helm)
(require 'swiper-helm)
(global-set-key (kbd "C-s") 'swiper-helm)

;; Commenting
(global-set-key (kbd "M-;") 'comment-or-uncomment-region)

;; Show column number and line number
(el-get-bundle nlinum
  :url "https://raw.githubusercontent.com/emacsmirror/nlinum/master/nlinum.el")
(require 'nlinum)
(dolist (mode '(column-number-mode line-number-mode))
  (when (fboundp mode) (funcall mode t)))

(dolist (mode-hook '(text-mode-hook prog-mode-hook))
  (add-hook mode-hook
            (lambda ()
              (nlinum-mode 1))))

;; Show current function/class
(which-function-mode 1)

;; Toggle line highlighting in all buffers
(global-hl-line-mode t)

;; Tab related stuff
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;; Always indent
(el-get-bundle aggressive-indent-mode)
;; (require 'aggressive-indent)
;; (add-hook 'prog-mode-hook 'aggressive-indent-mode)

;; Multiple cursors
(el-get-bundle multiple-cursors)
(require 'multiple-cursors)
(global-set-key (kbd "C-c C-c") 'mc/edit-lines)
(global-set-key (kbd "C-c C-.") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c ,") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c .") 'mc/mark-all-like-this)

;; Undo-redo keybindings
(global-set-key (kbd "C--") 'undo-only)
(global-set-key (kbd "M--") 'undo-tree-redo)

;; Backward delete word instead of kill
(el-get-bundle evil)
(require 'evil)
(global-set-key (kbd "M-DEL") 'evil-delete-backward-word)

(el-get-bundle flycheck)
(require 'flycheck)
(add-hook 'after-init-hook 'global-flycheck-mode)
(defun flycheck-list-errors-only-when-errors ()
  (if flycheck-current-errors
      (flycheck-list-errors)
    (-when-let (buffer (get-buffer flycheck-error-list-buffer))
      (dolist (window (get-buffer-window-list buffer))
        (quit-window nil window)))))
(add-hook 'before-save-hook #'flycheck-list-errors-only-when-errors)

(el-get-bundle format-all
  :url "https://raw.githubusercontent.com/lassik/emacs-format-all-the-code/master/format-all.el")
(require 'format-all)
(add-hook 'prog-mode-hook #'format-all-mode)
