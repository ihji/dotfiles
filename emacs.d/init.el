;; general settings
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)
(tool-bar-mode 0)
(setq make-backup-files nil)
(setq inhibit-startup-screen t)
(setq default-input-method "korean-hangul")
(show-paren-mode 1)
(setq-default indent-tabs-mode nil)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(global-auto-revert-mode 1)
(add-hook 'prog-mode-hook
  (lambda () (setq show-trailing-whitespace t)))
(define-key global-map (kbd "M-/") 'hippie-expand)
(define-key global-map (kbd "C-x C-b") 'ibuffer)
(require 'dired)
(put 'dired-find-alternate-file 'disabled nil)
(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

;; add all subdirectories of ~/.emacs.d/modes to load path
(progn
  (cd "~/.emacs.d/modes")
  (normal-top-level-add-subdirs-to-load-path)
  (cd "~/"))
;; add themes directory to theme load path
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

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
    (goto-char (point-max))
    (eval-print-last-sexp)))
(setq my-el-get-packages
      '(el-get   ;; el-get manages el-get
        auctex   ;; OSX: auctex requires autoconf
        scala-mode
        markdown-mode
        ace-jump-mode
        yasnippet
        magit
        ))
(el-get 'sync my-el-get-packages)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("7cced48b557e24937f437e59c7f6a6cea5ace4e603377beb5067d0b2c27b4b7d" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; autoload zenburn theme
(load-theme 'zenburn)

;; auctex settings
(setq-default TeX-master nil)
(setq TeX-PDF-mode t)
(setq TeX-view-program-list '(("open" "open %o")))
(setq TeX-view-program-selection '((output-pdf "open")))

;; scala mode settings
(eval-after-load "scala-mode"
  '(define-key scala-mode-map (kbd "RET") 'newline-and-indent))

;; ace jump mode settings
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; yasnippet settings
(yas/global-mode 1)
(setq yas/prompt-functions
  '(yas/dropdown-prompt yas/ido-prompt yas/completing-prompt yas/x-prompt yas/no-prompt))

;; window numbering mode settings
(require 'window-numbering)
(window-numbering-mode 1)
