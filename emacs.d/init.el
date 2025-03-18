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
;;(setq mac-option-modifier nil)
(setq mac-command-modifier 'meta)
(desktop-save-mode 1)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(setq scroll-preserve-screen-position t)
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
(setq send-mail-function 'sendmail-send-it)
(which-key-mode)

(winner-mode 1)
(global-set-key (kbd "C-c ;")  'winner-undo)
(global-set-key (kbd "C-c '")  'winner-redo)

;; nerd-icons
(use-package nerd-icons
  ;; :custom
  ;; The Nerd Font you want to use in GUI
  ;; "Symbols Nerd Font Mono" is the default and is recommended
  ;; but you can use any other Nerd Font if you want
  ;; (nerd-icons-font-family "Symbols Nerd Font Mono")
  )

;; doom-modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;; org-mode settings
(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (file-truename "~/Documents/org-roam/"))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today))
  :config
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  ;; If using org-roam-protocol
  (require 'org-roam-protocol))

;; additional global shortcuts
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "S-SPC") 'toggle-input-method)

;; windmove
(global-set-key (kbd "C-c h")  'windmove-left)
(global-set-key (kbd "C-c l") 'windmove-right)
(global-set-key (kbd "C-c k")    'windmove-up)
(global-set-key (kbd "C-c j")  'windmove-down)

;; gptel
(use-package gptel
  :ensure t
  :init
  (gptel-make-ollama "Ollama"
    :host "localhost:11434"
    :stream t
    :models '(deepseek-r1:14b llama3.1:latest))
)

;; eyebrowse mode
(use-package eyebrowse
  :ensure t
  :init
  (eyebrowse-mode))

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

;; helm settings
(use-package helm
  :ensure t
  :bind
  ("C-c m" . 'helm-mini))

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

;; ocaml-mode
(use-package tuareg
  :ensure t
  :custom (tuareg-opam-insinuate t)
  :mode (("\\.ocamlinit\\'" . tuareg-mode)))

;; ocaml dune-mode
(use-package dune
  :ensure t)

(use-package lsp-mode
  :init (setq lsp-keymap-prefix "C-c p")
  :ensure t
  :hook ((tuareg-mode . lsp-deferred)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp lsp-deferred))

(use-package apheleia
  :ensure t
  :hook (tuareg-mode . apheleia-mode)
  :config
  (setf (alist-get 'ocamlformat apheleia-formatters)
        '("opam" "exec" "--" "ocamlformat" "--impl" "-"))
  (setf (alist-get 'tuareg-mode apheleia-mode-alist)
        '(ocamlformat)))


;; auto-generated custom config to custom.el
(setq custom-file "~/.emacs.d/custom.el")
(if (file-exists-p custom-file) (load custom-file))
