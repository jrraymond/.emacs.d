;; Standard libraries needed
(require 'cl-lib)

;; Packages and configs to load
    ;;smex
(defvar packages
  '(evil
    haskell-mode
    )
  "Packages whose location follows the packages/package-name/package-name.el format.")

;;"structured-haskell-mode/elisp"
;;"hindent/elisp"
;;"git-modes"
;;"magit/lisp"
(defvar custom-load-paths
  '()
  "Custom load paths that don't follow the normal package-name/module-name.el format.")

(defvar configs
  '(;;"global"
    ;;"haskell"
    )
  "Configuration files that follow the config/foo.el file path format.")

;; zenburn themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/zenburn/")
;; moe-theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/moe-theme/")
(add-to-list 'load-path "~/.emacs.d/themes/moe-theme/")
(require `moe-theme)

;; Load packages
(cl-loop for location in custom-load-paths
         do (add-to-list 'load-path
                         (concat (file-name-directory (or load-file-name
                                                          (buffer-file-name)))
                                 "packages/"
                                 location)))

(cl-loop for name in packages
         do (progn (unless (fboundp name)
                     (add-to-list 'load-path
                                  (concat (file-name-directory (or load-file-name
                                                                   (buffer-file-name)))
                                          "packages/"
                                          (symbol-name name)))
                     (require name))))

;;(require 'shm)
;;(require 'hindent)
;;(require 'shm-case-split)
;;(require 'shm-reformat)
(evil-mode 1)

;; Emacs configurations
(cl-loop for name in configs
         do (load (concat (file-name-directory load-file-name)
                          "config/"
                          name ".el")))

;; Mode initializations
;;(smex-initialize)
;;(turn-on-haskell-simple-indent)
(load "haskell-mode-autoloads.el")

;; Agda Mode
;;(load-file (let ((coding-system-for-read 'utf-8))
;;                (shell-command-to-string "agda-mode locate")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("866be962f0a48c2fe648ea23a3f3c0148e5747d05626d75b6eaa9cd55a44c592" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
