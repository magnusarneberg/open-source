;; -----                               ---                                    --
;; --                                  ---                                 -----

(defconst WORKDIR "path/work")

;; ----                                ---                                    --

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; ----                                ---                                    --

(setq package-list '(use-package))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; ----                                ---                                    --

(use-package helm
  :ensure
  :init (helm-mode t)
  :bind (("M-x" . helm-M-x)
	 ("C-r" . helm-occur)
	 ("C-s" . helm-occur)
	 ("C-x C-f" . helm-find-files)
	 ("C-x b" . helm-mini)
	 ("C-x C-r" . helm-recentf)
	 ("C-c i" . helm-imenu)
	 ("M-y" . helm-show-kill-ring)
	 :map helm-map
	 ("C-z" . helm-select-action)
	 ("<tab>" . helm-execute-persistent-action)))

(use-package powerline
  :ensure  
  :config (powerline-default-theme))

(use-package company-box
  :ensure  
  :init (global-company-mode t)
  :hook (company-mode . company-box-mode)
  :config
  (setq company-idle-delay 1
        company-minimum-prefix-length 2
        company-selection-wrap-around t))

(use-package yasnippet
  :ensure  
  :config (yas-global-mode t)
  (add-to-list 'load-path
               "~/snippets"))

(use-package yasnippet-snippets
  :ensure)

;; ----                                ---                                    --

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes '(misterioso))
 '(fill-column 80)
 '(global-hl-line-mode t)
 '(global-linum-mode t)
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(org-startup-indented t)
 '(org-startup-truncated nil)
 '(org-startup-with-inline-images t)
 '(package-selected-packages '(yasnippet use-package))
 '(python-shell-interpreter "ipython")
 '(ring-bell-function 'ignore)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))

;; ----                                ---                                    --

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#2d3743" :foreground "#e1e1e0" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight bold :height 120 :width normal :foundry "outline" :family "Cascadia Code")))))

;; ----                                ---                                    --

(prefer-coding-system 'utf-8)
(add-hook 'focus-out-hook 'auto-save)

(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(set-frame-parameter (selected-frame) 'alpha '(95 . 85))
(add-to-list 'default-frame-alist '(alpha . (95 . 85)))

;; ----                                ---                                    --

(if (eq system-type 'windows-nt)
    (progn ()))

(if (eq window-system nil)
    (set-face-attribute 'default nil :background "black"))

;; ----                                ---                                    --

(defun scratch-buffer nil
  "Create the *scratch* buffer."
  (interactive)
  (switch-to-buffer (get-buffer-create "*scratch*"))
  (lisp-interaction-mode))

(defun auto-save ()
  (interactive)
  (save-some-buffers t))

;; ----                                ---                                    --

(bind-key "C-M-<right>" 'enlarge-window-horizontally)
(bind-key "C-M-<left>" 'shrink-window-horizontally)

(bind-key "C-M-<down>" 'enlarge-window)
(bind-key "C-M-<up>" 'shrink-window)

;; ----                                ---                                    --

(cd WORKDIR)
(eshell)

;; --                                  ---                                 -----
;; -----                               ---                                    --
