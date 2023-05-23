;; add all subdirectories of ~/.emacs.d/modes to load path
;; (progn
;;   (cd "~/.emacs.d/modes")
;;   (normal-top-level-add-subdirs-to-load-path)
;;   (cd "~/"))
;; add themes directory to theme load path
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; setting paths
(if (eq system-type 'darwin) (progn
  (defun set-exec-path-from-shell-PATH ()
  "Set up Emacs' `exec-path' and PATH environment variable to match
that used by the user's shell.

This is particularly useful under Mac OS X and macOS, where GUI
apps are not started from a shell."
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string
			  "[ \t\n]*$" "" (shell-command-to-string
					  "$SHELL --login -c 'echo $PATH'"
					  ))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
  (set-exec-path-from-shell-PATH)
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
(desktop-save-mode 1)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(setq make-backup-files nil)
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq default-input-method "korean-hangul")
(show-paren-mode 1)
(column-number-mode 1)
(setq-default indent-tabs-mode nil)
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

;; windmove
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

;; vertico mode
(use-package vertico
  :ensure t
  :init
  (vertico-mode))

;; Optionally use the `orderless' completion style.
(use-package orderless
  :ensure t
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

;; Enable rich annotations using the Marginalia package
(use-package marginalia
  :ensure t
  :bind (:map minibuffer-local-map ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

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
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
              ("C-c p" . projectile-command-map)))

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

;; company-mode
(use-package company
  :ensure t)

;; flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package treemacs
  :ensure t
  :defer t
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t d"   . treemacs-select-directory)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

;; scala-mode
(use-package scala-mode
  :ensure t)

;; haskell-mode
(use-package haskell-mode
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


;; BEGIN: ocaml configuration

(use-package tuareg
  :ensure t
  :mode (("\\.ocamlinit\\'" . tuareg-mode)))

(use-package dune
  :ensure t)

;; Merlin configuration
(use-package merlin
  :ensure t
  :config
  (add-hook 'tuareg-mode-hook #'merlin-mode)
  (add-hook 'merlin-mode-hook #'company-mode)
  ;; we're using flycheck instead
  (setq merlin-error-after-save nil))

;; Merlin eldoc
(use-package merlin-eldoc
  :after merlin
  :ensure t
  :custom
  (eldoc-echo-area-use-multiline-p t) ; use multiple lines when necessary
  (merlin-eldoc-max-lines 8)          ; but not more than 8
  (merlin-eldoc-type-verbosity 'min)  ; don't display verbose types
  (merlin-eldoc-occurrences t)        ; highlight all ident occurrences
  :bind (:map merlin-mode-map
              ("C-c m p" . merlin-eldoc-jump-to-prev-occurrence)
              ("C-c m n" . merlin-eldoc-jump-to-next-occurrence))
  :hook ((tuareg-mode) . merlin-eldoc-setup))

;; This uses Merlin internally
(use-package flycheck-ocaml
  :ensure t
  :config
  (flycheck-ocaml-setup))

(use-package ocamlformat
  :ensure t
  :hook (before-save . ocamlformat-before-save))

;; END: ocaml configuration


;; auto-generated custom config to custom.el
(setq custom-file "~/.emacs.d/custom.el")
(if (file-exists-p custom-file) (load custom-file))
