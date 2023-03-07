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

;; initialize use-package
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(or (package-installed-p 'use-package)
    (progn (package-refresh-contents)
           (package-install 'use-package)))

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

;; org-mode settings
(setq org-agenda-files '("~/Documents/org"))
(define-key global-map (kbd "C-c a") 'org-agenda)

;; additional global shortcuts
(define-key global-map (kbd "M-/") 'hippie-expand)
(define-key global-map (kbd "C-x C-b") 'ibuffer)
(define-key global-map (kbd "RET") 'newline-and-indent)
(define-key global-map (kbd "S-SPC") 'toggle-input-method)

;; resizing windows
(global-set-key (kbd "M-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "M-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-<down>") 'shrink-window)
(global-set-key (kbd "M-<up>") 'enlarge-window)

;; autoload theme
(use-package monokai-theme
  :ensure t
  :config
  (load-theme 'monokai t))

;; markdown-mode settings
(use-package markdown-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode)))

;; auctex settings
(use-package tex
  :ensure auctex
  :init
  (setq-default TeX-master nil)
  (setq TeX-PDF-mode t)
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq TeX-view-program-list '(("open" "open %o")))
  (setq TeX-view-program-selection '((output-pdf "open")))
  (setq reftex-plug-into-AUCTeX t)
  (add-hook 'LaTeX-mode-hook 'turn-on-reftex))

;; expand-region settings
(use-package expand-region
  :ensure t
  :bind
  ("C-=" . 'er/expand-region))

;; yasnippet settings
(use-package yasnippet
  :ensure t
  :init
  (setq yas-prompt-functions
        '(yas-dropdown-prompt
          yas-ido-prompt
          yas-completing-prompt
          yas-x-prompt
          yas-no-prompt)))

;; multiple-cursors
(use-package multiple-cursors
  :ensure t
  :bind
  ("C->" . 'mc/mark-next-like-this))

;; projectile mode
(use-package projectile
  :ensure t
  :config
  (projectile-global-mode))

;; helm settings
(use-package helm
  :ensure t
  :bind
  ("C-c h" . 'helm-mini))

;; magit shortcut
(use-package magit
  :ensure t
  :bind
  ("C-c g" . 'magit-status))

;; js2-mode
(use-package js2-mode
  :ensure t)

;; writegood-mode
(use-package writegood-mode
  :ensure t)

;; neotree
(use-package neotree
  :ensure t)

;; scala-mode
(use-package scala-mode
  :ensure t)

;; haskell-mode
(use-package haskell-mode
  :ensure t)

;; auto-complete
(use-package auto-complete
  :ensure t)

;; gnuplot
(use-package gnuplot
  :ensure t)

;; proof-general
(use-package proof-general
  :ensure t)

;; clojure-mode
(use-package clojure-mode
  :ensure t)

;; cider
(use-package cider
  :ensure t)

;; auto-generated custom config to custom.el
(setq custom-file "~/.emacs.d/custom.el")
(if (file-exists-p custom-file) (load custom-file))
