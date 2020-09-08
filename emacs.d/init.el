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
    "/Users/ihji/.homebrew/bin"
    "/usr/texbin"
    "/usr/local/bin"
  ) exec-path))
  (setenv "PATH" (mapconcat 'identity exec-path path-separator))
))

;; add marmalade, melpa repo
(require 'package)
(add-to-list 'package-archives
  '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives
  '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(mapc
 (lambda (package)
   (or (package-installed-p package)
       (package-install package)))
 '(
   ace-jump-mode
   auctex
   auto-complete
   clojure-mode
   cider ;; clojure minor mode
   expand-region
   gnuplot
   haskell-mode
   helm
   js2-mode
   magit
   markdown-mode
   monokai-theme
   multiple-cursors
   neotree
   projectile
   proof-general
   scala-mode
   undo-tree
   writegood-mode
   yasnippet
   zenburn-theme
   zencoding-mode
   )
 )

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
(column-number-mode 1)
(setq-default indent-tabs-mode nil)
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(global-auto-revert-mode 1)
(require 'dired-x)
(put 'dired-find-alternate-file 'disabled nil)
(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
(add-hook 'prog-mode-hook
  (lambda () (setq show-trailing-whitespace t)))
(add-hook 'text-mode-hook 'turn-on-flyspell)
(setq send-mail-function 'sendmail-send-it)

;; additional global shortcuts
(define-key global-map (kbd "M-/") 'hippie-expand)
(define-key global-map (kbd "C-x C-b") 'ibuffer)
(define-key global-map (kbd "RET") 'newline-and-indent)
(define-key global-map (kbd "C-c a") 'org-agenda)
(define-key global-map (kbd "S-SPC") 'toggle-input-method)

;; resizing windows
(global-set-key (kbd "M-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "M-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-<down>") 'shrink-window)
(global-set-key (kbd "M-<up>") 'enlarge-window)

;; autoload theme
(load-theme 'monokai t)

;; org-mode settings
(setq org-agenda-files '("~/Documents/org"))

;; markdown-mode settings
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; auctex settings
(setq-default TeX-master nil)
(setq TeX-PDF-mode t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-view-program-list '(("open" "open %o")))
(setq TeX-view-program-selection '((output-pdf "open")))
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

;; ace jump mode settings
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; expand-region settings
(define-key global-map (kbd "C-=") 'er/expand-region)

;; yasnippet settings
;(yas-global-mode 1)
(setq yas-prompt-functions
  '(yas-dropdown-prompt yas-ido-prompt yas-completing-prompt yas-x-prompt yas-no-prompt))

;; multiple-cursors
(global-set-key (kbd "C->") 'mc/mark-next-like-this)

;; undo-tree mode
(global-undo-tree-mode)

;; projectile mode
(projectile-global-mode)

;; helm settings
(global-set-key (kbd "C-c h") 'helm-mini)

;; magit shortcut
(global-set-key (kbd "C-c g") 'magit-status)

;; zencoding mode
(add-hook 'sgml-mode-hook 'zencoding-mode)

;; auto-generated custom config to custom.el
(setq custom-file "~/.emacs.d/custom.el")
(if (file-exists-p custom-file) (load custom-file))
