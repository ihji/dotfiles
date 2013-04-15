;; general settings
;;(setq mac-command-modifier 'meta)
;;(setq mac-option-modifier nil)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(setq make-backup-files nil)
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq default-input-method "korean-hangul")
(show-paren-mode 1)
(setq-default indent-tabs-mode nil)
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(global-auto-revert-mode 1)
(define-key global-map (kbd "M-/") 'hippie-expand)
(define-key global-map (kbd "C-x C-b") 'ibuffer)
(require 'dired-x)
(put 'dired-find-alternate-file 'disabled nil)
(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
(add-hook 'prog-mode-hook
  (lambda () (setq show-trailing-whitespace t)))
(add-hook 'text-mode-hook 'turn-on-flyspell)
(setq send-mail-function 'sendmail-send-it)

;; add all subdirectories of ~/.emacs.d/modes to load path
;; (progn
;;   (cd "~/.emacs.d/modes")
;;   (normal-top-level-add-subdirs-to-load-path)
;;   (cd "~/"))
;; add themes directory to theme load path
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; setting paths
(if (eq system-type 'darwin) (progn
  (setq exec-path (append (list
    "~/.homebrew/bin"
    "/usr/texbin"
    "/usr/local/bin"
  ) exec-path))
  (setenv "PATH" (mapconcat 'identity exec-path path-separator))
))

;; add marmalade repo
(require 'package)
(add-to-list 'package-archives
  '("marmalade" .
    "http://marmalade-repo.org/packages/"))
(package-initialize)

;; initialize el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))
(setq my-el-get-packages
      '(
        ProofGeneral
        ace-jump-mode
        artbollocks-mode
        auctex   ;; OSX: auctex requires autoconf
        clojure-mode
        el-get   ;; el-get manages el-get
        haskell-mode
        helm
        magit
        markdown-mode
        multiple-cursors
        nrepl ;; clojure repl client
        scala-mode2
        undo-tree
        yasnippet
        zenburn-theme
        zencoding-mode
       ))
(el-get 'sync my-el-get-packages)

;; autoload zenburn theme
(load-theme 'zenburn t)

;; auctex settings
(setq-default TeX-master nil)
(setq TeX-PDF-mode t)
(setq TeX-view-program-list '(("open" "open %o")))
(setq TeX-view-program-selection '((output-pdf "open")))

;; ace jump mode settings
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; yasnippet settings
(yas/global-mode 1)
(setq yas/prompt-functions
  '(yas/dropdown-prompt yas/ido-prompt yas/completing-prompt yas/x-prompt yas/no-prompt))

;; artbollocks mode
(setq artbollocks nil)

;; multiple-cursors
(global-set-key (kbd "C->") 'mc/mark-next-like-this)

;; undo-tree mode
(global-undo-tree-mode)

;; helm settings
(global-set-key (kbd "C-c h") 'helm-mini)

;; magit shortcut
(global-set-key (kbd "C-c g") 'magit-status)

;; zencoding mode
(add-hook 'sgml-mode-hook 'zencoding-mode)
