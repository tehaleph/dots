(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(require 'evil)
(package-initialize)

(menu-bar-mode t)
(projectile-mode +1)
(evil-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(projectile dracula-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(load-theme 'dracula t)
