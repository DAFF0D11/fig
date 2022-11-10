;; (add-to-list 'default-frame-alist '(background-color . "#000000")) ;; minimize white flash

(setq inhibit-splash-screen t)
(setq package-enable-at-startup nil) ;; straight is used for packages

;; Turn off gui elements
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; silence navite-comp report
(setq native-comp-async-report-warnings-errors 'silent)

;; Stop littering
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq make-backup-files nil)
(setq create-lockfiles nil)
(setq vc-make-backup-files nil)

(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq show-paren-mode nil)
(setq visible-cursor nil) ;; dont show cursor on unfocused split
;; (setq scroll-margin 13)
;; (setq scroll-conservatively 100000 )
;; (setq cursor-type 'hollow)
;; (setq  'hollow)

;; General settings
(defalias 'yes-or-no-p 'y-or-n-p)
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
(setq-default cursor-in-non-selected-windows nil)
(setq split-width-threshold 400 ; Favor vertical split over horizontal
      split-height-threshold nil)
(setq vc-follow-symlinks t)
(setq scroll-step 1)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;; (setq display-line-numbers-type 'relative)
;; (global-display-line-numbers-mode 'relative)

;; disable modes
(global-eldoc-mode -1)
(blink-cursor-mode -1) ;; kill the cursor blink
