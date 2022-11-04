;; (add-to-list 'default-frame-alist '(background-color . "#000000")) ;; minimize white flash

(setq inhibit-splash-screen t)
(setq package-enable-at-startup nil) ;; straight is used for packages

;; Turn off gui elements
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; silence navite-comp report
(setq native-comp-async-report-warnings-errors 'silent)
