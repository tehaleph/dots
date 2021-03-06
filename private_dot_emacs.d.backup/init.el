;; PATH
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(setenv "PATH" (concat "~/go/bin:" (getenv "PATH")))

;; exec-path
(setq exec-path (append exec-path '("/usr/local/bin")))
(setq exec-path (append exec-path '("~/go/bin")))

;; Font
(add-to-list 'default-frame-alist '(font . "JetBrains Mono"))
(set-face-attribute 'default t :font "JetBrains Mono")

;; Spellchecker
(setenv "DICTIONARY" "en_US")

;; Packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(require 'use-package)

;; Neotree
(require 'neotree)
;; Disable line-numbers minor mode for neotree
(add-hook 'neo-after-create-hook (lambda (&optional dummy) (display-line-numbers-mode -1)))


(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(line-number-mode 1)
 '(package-selected-packages
   '(org-protocol-jekyll org-roam-server godoctor company-go lsp-ui use-package lsp-mode quickrun magit org-roam go-mode elpy neotree projectile dracula-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Modes
(projectile-mode +1)
(elpy-enable)
(global-display-line-numbers-mode)

;; Keys
(global-set-key [f8] 'neotree-toggle)
(global-set-key (kbd "C-c C-d t") 'org-roam-dailies-today)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(load-theme 'dracula t)
(put 'upcase-region 'disabled nil)

(defun diary-last-day-of-month (date)
"Return `t` if DATE is the last day of the month."
  (let* ((day (calendar-extract-day date))
         (month (calendar-extract-month date))
         (year (calendar-extract-year date))
         (last-day-of-month
            (calendar-last-day-of-month month year)))
    (= day last-day-of-month)))

;; Backup files
(setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))
;; Org-roam
(setq org-roam-directory "~/zettelkasten")
(setq org-roam-graph-executable "/usr/local/bin/dot")
(setq org-roam-graph-viewer "/Applications/Firefox Nightly.app/Contents/MacOS/firefox")

(setq org-roam-dailies-capture-templates '(("d" "daily" plain (function org-roam-capture--get-point) ""
    :immediate-finish t
    :file-name "dailies/%<%Y-%m-%d>"
    :head "#+TITLE: %<%Y-%m-%d>")))

(require 'org-protocol)
(require 'org-roam-protocol)

(use-package org-roam-server
  :ensure t
  :config
  (setq org-roam-server-host "127.0.0.1"
        org-roam-server-port 8080
        org-roam-server-authenticate nil
        org-roam-server-export-inline-images t
        org-roam-server-serve-files nil
        org-roam-server-served-file-extensions '("pdf" "mp4" "ogv")
        org-roam-server-network-poll t
        org-roam-server-network-arrows nil
        org-roam-server-network-label-truncate t
        org-roam-server-network-label-truncate-length 60
        org-roam-server-network-label-wrap-length 20))

;; Org-fc
(add-to-list 'load-path "~/dev/github/org-fc/")

(require 'org-fc)

(setq org-fc-directories '("~/zettelkasten/"))

;; Appearance
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(setq initial-buffer-choice "~/zettelkasten")

;; gopls
(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook (go-mode . lsp-deferred))

;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; Optional - provides fancier overlays.
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

;; Company mode is a standard completion package that works well with lsp-mode.
(use-package company
  :ensure t
  :config
  ;; Optionally enable completion-as-you-type behavior.
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1))

;; godoctor
(use-package go-mode
  :config (use-package godoctor))

;; switch to previous buffer
(defun kb-switch-to-previous-buffer ()
  "Switch to previously open buffer.
Repeated invocations toggle between the two most recently open buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(global-set-key (kbd "s-[") #'kb-switch-to-previous-buffer)

