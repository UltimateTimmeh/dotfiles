(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 108 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(mode-line ((t (:background "#3b3b3b" :foreground "#9b9b9b" :box (:line-width -1 :style released-button)))))
 '(mode-line-inactive ((t (:background "#090909" :foreground "#909090" :box nil :weight light)))))

 ;; Custom theme.
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'ample-zen t)

 ;; Default frame size at startup.
(add-to-list 'default-frame-alist '(height . 51))
(add-to-list 'default-frame-alist '(width . 101))
