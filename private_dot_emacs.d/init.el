(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

;; Packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Neotree
(require 'neotree)


(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files '("~/org/cleaning.org" "~/org/bday.org" "~/org/fin.org"))
 '(package-selected-packages
   '(quickrun magit org-roam go-mode elpy neotree projectile dracula-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Modes
(menu-bar-mode t)
(projectile-mode +1)
(elpy-enable)

;; Keys
(global-set-key [f8] 'neotree-toggle)
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

;; Org-fc
(add-to-list 'load-path "~/dev/github/org-fc/")

(require 'org-fc)

(setq org-fc-directories '("~/zettelkasten/"))
