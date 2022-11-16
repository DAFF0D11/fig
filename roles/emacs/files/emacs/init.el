;; Enable modes
(recentf-mode 1)
(save-place-mode 1)

;; hooks
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(if (file-exists-p "~/pea/emacs/config.el")
    (load "~/pea/emacs/config.el")
  (setq
   config--font               "Monospace"
   config--font-height        120
   config--themes             "~/.config/emacs/themes"
   config--org-directory      "~/org/agenda"
   config--org-agenda-file    "~/org/agenda/agenda.org"
   config--org-agenda-files '("~/org/agenda/agenda.org")
   config--bookmarks          "~/org/agenda/bookmarks.org"
   config--emacs-bookmarks    "~/.config/emacs/emacs-bookmarks"))
(setq bookmark-save-flag 1)
(setq bookmark-default-file config--emacs-bookmarks)
(add-to-list 'custom-theme-load-path config--themes)
;; (add-to-list 'default-frame-alist '(internal-border-width . 10))

;; Change minibuffer default face
  (defun my-minibuffer-faces () (face-remap-add-relative 'default '(:inherit font-lock-string-face )))
  (add-hook 'minibuffer-setup-hook 'my-minibuffer-faces)

;; Center modeline
 (defun mode-line-fill-right (face reserve)
   "Return empty space using FACE and leaving RESERVE space on the right.
    source: https://gist.github.com/fhdhsni/990cba7794b4b6918afea94af0b30d66"
   (unless reserve
     (setq reserve 20))
   (when (and window-system (eq 'right (get-scroll-bar-mode)))
     (setq reserve (- reserve 3)))
   (propertize " "
               'display `((space :align-to (- (+ right right-fringe right-margin) ,reserve)))
               'face face))

 (defun mode-line-fill-center (face reserve)
   "Return empty space using FACE to the center of remaining space leaving RESERVE space on the right."
   (unless reserve
     (setq reserve 20))
   (when (and window-system (eq 'right (get-scroll-bar-mode)))
     (setq reserve (- reserve 3)))
   (propertize " "
               'display `((space :align-to (- (+ center (.5 . right-margin)) ,reserve
                                              (.5 . left-margin))))
               'face face))

 (defun reserve-left/middle ()
   (/ (length (format-mode-line mode-line-align-middle)) 2))

 (setq mode-line-align-middle
       (list
        '(:eval (when-let (vc vc-mode)
                  (list "" (propertize (concat ""(substring vc 5)" ") 'face 'tooltip))))
        '(:eval (if (not (eq major-mode 'vterm-mode))
                    (list (propertize "%f" 'face
                                      (if (buffer-modified-p)
                                          'error)))))
        '(:eval (if (not (eq major-mode 'vterm-mode))
                    (list (propertize " %l" 'face 'tooltip))))
        '(:eval (list (if major-mode (propertize " %m" ))))))

 (setq-default mode-line-format
               (list '(:eval (mode-line-fill-center 'mode-line (reserve-left/middle)))
                 mode-line-align-middle))

(set-face-attribute 'default nil :family config--font :height config--font-height)
(set-face-attribute 'variable-pitch nil :family config--font :height config--font-height)
(set-frame-font config--font nil t)

;; bootstrap straight
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
	 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Install use-package with straight.el
(straight-use-package 'use-package)

;; Configure straight.el
(use-package straight
  :custom
  (straight-use-package-by-default t)
  (straight-vc-git-default-clone-depth 1)
  (straight-check-for-modifications nil))

(use-package heaven-and-hell
  :init
  (load-theme 'dark-fi t )
  (setq heaven-and-hell-load-theme-no-confirm t)
  (setq heaven-and-hell-theme-type 'dark) ;; Omit to use light by default
  (setq heaven-and-hell-themes
        '((light . light-fi)
          (dark . dark-fi))))

(use-package general
  :config
  (define-key minibuffer-local-map (kbd "ESC") 'keyboard-escape-quit) ;; Just always...

  ;; Enable narrowing
  (put 'narrow-to-defun  'disabled nil)
  (put 'narrow-to-page   'disabled nil)
  (put 'narrow-to-region 'disabled nil)
  (defun narrow-or-widen-dwim (p)
    (interactive "P")
    (declare (interactive-only))
    (cond ((and (buffer-narrowed-p) (not p)) (widen))
          ((region-active-p)
           (narrow-to-region (region-beginning)
                             (region-end)))
          ((derived-mode-p 'org-mode)
           ;; `org-edit-src-code' is not a real narrowing
           ;; command. Remove this first conditional if
           ;; you don't want it.
           (cond ((ignore-errors (org-edit-src-code) t)
                  (delete-other-windows))
                 ((ignore-errors (org-narrow-to-block) t))
                 (t (org-narrow-to-subtree))))
          ((derived-mode-p 'latex-mode)
           (LaTeX-narrow-to-environment))
          (t (narrow-to-defun))))

  (defun daf/toggle-line-numbering ()
    "Toggle line numbering between absolute and relative."
    (interactive)
    (if (eq display-line-numbers 'relative)
        (setq display-line-numbers 'nil)
      (setq display-line-numbers 'relative)))

  (defun toggle-maximize-buffer ()
    (interactive)
    "Maximize buffer"
    (if (= 1 (length (window-list)))
        (jump-to-register '_)
      (progn
        (window-configuration-to-register '_)
        (delete-other-windows))))

  (defun edit-emacs-configuration () (interactive) (find-file "~/.config/emacs/init.el"))

  (defun daf/flip-window ()
    "toggle previous buffer, bufferlo needs (setq bufferlo-prefer-local-buffers t)"
    (interactive)
    (switch-to-buffer (other-buffer (current-buffer))))


  (defun daf/evil-visual-search-replace ()
    (interactive)
    (evil-ex "\'<,\'>s/"))

  (general-create-definer daf/key-leader
    :states '(normal visual emacs)
    :keymaps 'override
    :prefix "SPC")

  (general-create-definer daf/key-local-leader
    :states '(normal visual emacs)
    :keymaps 'override
    :prefix ",")

  (daf/key-leader
    "w" 'evil-write
    "W" 'evil-write-all
    "h" 'evil-window-left
    "l" 'evil-window-right
    "k" 'evil-window-up
    "j" 'evil-window-down
    "V" 'evil-window-split
    "v" 'evil-window-vsplit
    "D" 'evil-delete-buffer
    "x" '(lambda () (interactive)
           (delete-window)
           (balance-windows))
    "d" 'kill-this-buffer
    "z" 'toggle-maximize-buffer
    "r" 'narrow-or-widen-dwim
    "R" 'rotate-window
    "M" 'man
    "." 'edit-emacs-configuration

    "f" '(:ignore t :which-key "Files")
    "fd"  'find-file
    "fh"  'consult-recent-file
    "fg"  'consult-ripgrep
    "fr"  '(lambda () (interactive) (find-file "~/") )

    "m" '(:ignore t :which-key "marks")
    "mm"  'bookmark-jump
    "mb"  'daf/bm-heading
    "mo"  'bookmark-jump-other-window
    "ms"  'bookmark-set
    "mm"  'bookmark-jump

    "g" '(:ignore t :which-key "Git")
    "gg"  'recompile
    "gc"  'compile

    "s" '(:ignore t :which-key "surround")
    "ss" '((lambda () (interactive) (switch-to-buffer "*scratch*")) :which-key "open scratch")

    "p" '(:ignore t :which-key "Project")
    "pf"   'project-find-file
    "pk"   'project-kill-buffers
    "pp"   'daf/consult-project-project)

  (general-def
    :states '(insert emacs)
    "C-v" 'evil-paste-after
    "C-t" 'daf/multi-vterm-project-toggle
    )

  (general-def
    :states '(normal emacs)
    "R" 'evil-redo
    "t" '(lambda () (interactive) (evil-scroll-up 10))
    "s" '(lambda () (interactive) (evil-scroll-down 10))
    ;; "j" 'evil-next-visual-line
    ;; "k" 'evil-previous-visual-line
    "C-e" 'daf/flip-window
    "C-t" 'daf/multi-vterm-project-toggle
    "C-<up>" 'shrink-window
    "C-<down>" 'enlarge-window
    "C-<left>" 'shrink-window-horizontally
    "C-<right>" 'enlarge-window-horizontally
    "C-u" '(lambda () (interactive) (evil-scroll-up 10))
    "C-d" '(lambda () (interactive) (evil-scroll-down 10))

    "C-=" 'text-scale-increase
    "C--" 'text-scale-decrease

    "M-i" 'next-buffer
    "M-o" 'previous-buffer
    ;; "ZZ" 'nil
    ;; "ZQ" 'nil
    )

  (general-def
    :states '(visual emacs)
    "C-u" 'evil-scroll-up
    "C-d" 'evil-scroll-down
    "C-e" 'daf/flip-window
    ;; "t" 'evil-scroll-up
    ;; "s" 'evil-scroll-down
    "/" 'daf/evil-visual-search-replace)
  )

(use-package which-key
  :config
  (which-key-mode +1)
  (which-key-setup-minibuffer))

(use-package undo-tree
  :config
  (global-undo-tree-mode)
  (setq undo-tree-auto-save-history t)
  (setq undo-tree-history-directory-alist '(("." . "~/.config/emacs/undo"))))

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-undo-system 'undo-tree)
  (setq evil-symbol-word-search t);; Makes * work as expected
  (setq evil-esc-delay 0)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-Y-yank-to-eol t)
  (setq evil-ex-visual-char-range t)
  (setq evil-want-keybinding nil)
  (setq evil-ex-substitute-global t)
  (setq evil-kill-on-visual-paste nil)
  (setq evil-split-window-below t)
  (setq evil-vsplit-window-right t)
  (setq evil-disable-insert-state-bindings t)
  :config
  (evil-mode)
  (global-set-key (kbd "<escape>") 'keyboard-escape-quit)
  (define-key evil-insert-state-map (kbd "C-u") nil)
  ;; jumplist
  (setq evil-jumps-cross-buffers nil)
  (evil-add-command-properties #'evil-insert :jump t)
  (evil-add-command-properties #'evil-change :jump t)
  (evil-add-command-properties #'evil-delete :jump t)
  (evil-add-command-properties #'avy-goto-char-timer :jump t)
  (evil-add-command-properties #'avy-goto-word-0 :jump t)
  (evil-add-command-properties #'avy-goto-word-1 :jump t)
  (evil-add-command-properties #'evil-avy-goto-word-1 :jump t)
  )

(use-package evil-terminal-cursor-changer
  :config
  (unless (display-graphic-p)
          (evil-terminal-cursor-changer-activate)))

(use-package evil-collection :init (evil-collection-init))
(use-package evil-commentary :config (evil-commentary-mode))
(use-package evil-numbers
  :general
  (general-def
    :states '(normal)
    "C-a" 'evil-numbers/inc-at-pt
    "C-z" 'evil-numbers/dec-at-pt))

(use-package evil-surround
  :general
  (general-def
    :states '(visual)
    "S" 'evil-surround-region
    )
  (daf/key-leader
    "s" '(:ignore t :which-key "surround")
    "sc"  'evil-surround-change
    "se"  'evil-surround-edit
    "sd"  'evil-surround-delete)
  :config
  (global-evil-surround-mode 1))

(use-package expand-region
  :general
  (general-def
    :states '(visual)
    "v" 'er/expand-region
    "V" 'er/contract-region))


(use-package orderless
  :custom
  (completion-styles '(partial-completion orderless))
  :config
  (setq orderless-component-separator "[ ,]"))

(use-package marginalia
  :init
  (marginalia-mode))

(use-package consult
  :init
  (use-package consult-project-extra :commands(consult-project-extra-find))
  :config


  (setq consult-preview-key (kbd "C-l"))
  (setq consult-buffer-filter   '("\\` .*\\'"
				  "\\`\\*Completions\\*\\'"
				  "\\`\\*Bufler\\*\\'"
				  "\\`\\*lsp-log\\*\\'"
				  "\\`\\*ts-ls.*\\*\\'"
				  "\\`\\*elfeed-search\\*\\'"
				  "\\`\\*Warnings\\*\\'"
				  "\\`\\*Async-native-compile-log\\*\\'"
				  "\\`\\*compilation\\*\\'"
				  "\\`\\*elfeed-.*\\*\\'"
				  "\\`\\*clangd.*\\*\\'"
				  "\\`\\*Messages.*\\*\\'"
				  "\\`\\*Backtrace\\*\\'"
				  "\\`\\*Flymake log\\*\\'"
				  "\\`\\*Semantic SymRef\\*\\'"
				  "\\`\\*tramp/.*\\*\\'"
				  "\\`magit-.*\\'"
				  "\\`magit:.*\\'"
				  ))
  )

(use-package vertico
  :init (vertico-mode)
  :general
  (general-def
    :keymaps 'vertico-map
    "C-j" 'vertico-next
    "C-k" 'vertico-previous)
  (general-def
    :keymaps 'minibuffer-local-map
    "ESC" 'keyboard-escape-quit
    "C-w" 'backward-kill-word)
  :config
  (setq vertico-resize nil) ;; stop minibuffer from chaging size
  )

(use-package company
  :hook (after-init . global-company-mode)
  :config
  (setq company-backends '(company-capf company-files))
  (setq company-idle-delay 0.3)
  (setq company-minimum-prefix-length 2)
  (setq company-tooltip-limit 8)
  (setq company-dabbrev-ignore-case t)
  (setq company-dabbrev-downcase nil)
  (define-key company-active-map (kbd "C-l") 'company-complete-selection)
  (define-key company-active-map (kbd "C-h") 'company-abort)
  (define-key company-active-map (kbd "C-w") 'company-abort)
  (define-key company-active-map (kbd "<tab>") 'company-abort)
  (define-key company-active-map (kbd "<return>") 'company-complete-selection)
  (define-key company-search-map (kbd "C-j") 'company-select-next)
  (define-key company-search-map (kbd "C-k") 'company-select-previous))

(use-package prescient)
(use-package orderless
  :custom
  (completion-styles '(partial-completion orderless))
  :config
  (setq orderless-component-separator "[ ,]"))

(use-package marginalia
  :init
  (marginalia-mode))

(use-package bufler
  :general
  (general-def
    :states '(visual normal motion emacs)
    :keymaps 'bufler-list-mode-map
    "SPC" 'nil
    "x" 'bufler-list-buffer-kill
    "f" 'bufler-list-group-frame
    "N" 'bufler-list-buffer-name-workspace
    "RET" 'bufler-list-buffer-switch)
  (daf/key-leader
    ";" 'daf/switch-bufler-or-project
    ":" 'daf/bufler-switch-group
    "'" 'daf/bufler-switch-all
    "b" 'bufler-list)
  :config

  (bufler-mode 1)

  (defun daf/switch-bufler-or-project ()
    "If buffer is in project: project-find-file else daf/bufler-switch-group"
    (interactive)
    (if  (project-current)
	(consult-project-extra-find)
	;; (consult-buffer)
      (daf/bufler-switch-group)))

  (defun daf/bufler-switch-group ()
    (interactive)
    (daf/update-workspace)
    (bufler-switch-buffer))

  (defun daf/consult-project-project ()
    (interactive)
    (if (project-current)
	(setq unread-command-events (append unread-command-events (list ?p 32))))
    (consult-project-extra-find))

  (defun daf/bufler-switch-all ()
    (interactive)
    (bufler-switch-buffer 1))

  (defun daf/update-workspace ()
    "make workspace the current group"
    (interactive)
    (bufler-workspace-focus-buffer (current-buffer)))

  (setq bufler-filter-buffer-modes
	'(bufler-list-mode
	  calendar-mode
	  helm-major-mode
	  magit-diff-mode
	  magit-process-mode
	  magit-revision-mode
	  magit-section-mode
	  special-mode
	  timer-list-mode))

  (setq bufler-filter-buffer-name-regexps '("\\*compilation\\*"
					    "\\*gopls\\*"
					    "\\*elfeed"
					    "\\*lsp-log\\*"
					    "\\*Warnings\\*"
					    "\\*pylsp\\*"
					    "\\*Async-*"
					    "\\*Compile-Log\\*"
					    "\\*Backtrace\\*"
					    "\\*clangd\\*"
					    "\\*Help\\*"
					    "\\*Async-native-compile-log\\*"
					    "\\*scratch\\*"))

  (setf bufler-groups
	(bufler-defgroups
	  (group
	   (auto-workspace))
	  (group
	   (group-or "*Help/Info*"
		     (mode-match "*Help*" (rx bos "help-"))
		     (mode-match "*Info*" (rx bos "info-"))))
	  (group
	   (group-and "*Special*"
		      (lambda (buffer)
			(unless (or (funcall (mode-match "Dired" (rx bos "dired")) buffer)
				    (funcall (mode-match "Magit" (rx bos "magit-status")) buffer)
				    (funcall (mode-match "VTerm" (rx bos "vterm")) buffer)
				    (funcall (auto-file) buffer))
			  "*Special*")))
	   (group (mode-match "*Magit* (non-status)" (rx bos (or "magit" "forge") "-"))
		  (auto-directory)))
	  (group (auto-project)) (auto-directory)))
  )

(use-package avy
  :general
  (general-def
    :states '(normal visual emacs)
    "'" 'avy-goto-word-1)
  :config
  (setq avy-timeout-seconds 0.3))

(use-package dired
  :straight (:type built-in)
  :custom ((dired-listing-switches "-arghoA --group-directories-first"))
  :general

  (daf/key-local-leader
    :keymaps 'dired-mode-map
    "w" 'daf/setwallpaper
    "s" 'daf/dired-get-size
    "a" 'daf/toggle-hidden-in-dired)

  (general-def
    :states '(normal emacs)
    :keymaps 'dired-mode-map
    "h"   'dired-up-directory
    "l"   'dired-find-file
    "SPC" 'nil
    "t" 'nil
    "."   'nil)

  :config
  (setq dired-kill-when-opening-new-dired-buffer t)
  (setq dired-mouse-drag-files t)
  (setq dired-dwim-target t)
  (add-hook 'dired-mode-hook 'auto-revert-mode)
  (add-hook 'dired-mode-hook 'dired-hide-details-mode)

  (defun daf/toggle-hidden-in-dired ()
    (interactive)
    (setq dired-actual-switches
          (if (equal dired-actual-switches "-aghoA --group-directories-first")
                                     "-l --group-directories-first"
                                   "-aghoA --group-directories-first"))
    (dired-readin))

  (defun daf/setwallpaper()
    (interactive)
    (shell-command (concat "feh --bg-center "(buffer-file-name))))

  (defun daf/dired-get-size ()
    (interactive)
    (let ((files (dired-get-marked-files)))
      (with-temp-buffer
	(apply 'call-process "/usr/bin/du" nil t nil "-sch" files)
	(message "Size of all marked files: %s"
		 (progn
		   (re-search-backward "\\(^[0-9.,]+[A-Za-z]+\\).*total$")
		   (match-string 1)))))))

(use-package dired-subtree)

(use-package async
  :init
  (dired-async-mode 1)
  :config
  (async-bytecomp-package-mode 1)
  (setq async-shell-command-display-buffer nil))

(use-package vterm
  :demand t
  :config
  (setq vterm-disable-bold t)
  (setq vterm-always-compile-module t)
  (add-hook 'vterm-mode-hook (lambda () (display-line-numbers-mode 0))))

(use-package multi-vterm
  :demand t
  :init
  (setq multi-vterm-buffer-name "term:")
  (setq multi-vterm-dedicated-buffer-name "dterm:")
  (setq confirm-kill-processes nil)
  (setq vterm-disable-bold t)
  (setq kill-buffer-query-functions nil)
  :general
  (daf/key-leader
    "RET" 'multi-vterm
    "M-RET" 'daf/multi-vterm-rename)

  (general-def
    :states '(normal emacs)
    :keymaps 'vterm-mode-map
    "t" '(lambda () (interactive) (evil-scroll-up 10))
    "s" '(lambda () (interactive) (evil-scroll-down 10)))

  :config

  (defun daf/project-vterm-predicate (buffer)
    "Kill buffer defined by (multi-vterm-project-get-buffer-name)"
    (if (string-equal (buffer-name buffer) (multi-vterm-project-get-buffer-name))
        t
      nil))
  (add-to-list 'project-kill-buffer-conditions
               'daf/project-vterm-predicate
               t)

  (defun daf/multi-vterm-project ()
    "Create new vterm buffer at proect root (no other-window)."
    (interactive)
    (if (multi-vterm-project-root)
        (if (buffer-live-p (get-buffer (multi-vterm-project-get-buffer-name)))
            (if (string-equal (buffer-name (current-buffer)) (multi-vterm-project-get-buffer-name))
                (delete-window (selected-window))
              (switch-to-buffer-other-window (multi-vterm-project-get-buffer-name)))
          (let* ((vterm-buffer (multi-vterm-get-buffer 'project))
                 (multi-vterm-buffer-list (nconc multi-vterm-buffer-list (list vterm-buffer))))
            (set-buffer vterm-buffer)
            (multi-vterm-internal)
            (switch-to-buffer vterm-buffer)))
      (message "This file is not in a project")))

(defun daf/multi-vterm-rename (x)
  "Create terminal with name"
  (interactive "sTerminal Name: ")
  (multi-vterm)
  (multi-vterm-rename-buffer x))

  ;; Modify buffer predicate to ignore multi-vterm-project terminal buffer
  (defun daf/ignore-project-term-buffer-predicate (buffer)
    (if (string-equal (multi-vterm-project-get-buffer-name) (buffer-name buffer))
        nil
      t))

  (defun daf/multi-vterm-project-toggle ()
    "Toggle current project terminal buffer"
    (interactive)
  (set-frame-parameter nil 'buffer-predicate 'daf/ignore-project-term-buffer-predicate)
    (if (string-equal (buffer-name) (multi-vterm-project-get-buffer-name))
        (daf/flip-window)
      (if (get-buffer (multi-vterm-project-get-buffer-name))
          (switch-to-buffer (multi-vterm-project-get-buffer-name))
        (daf/multi-vterm-project))))

  (defun daf/evil-insert-vterm ()
    "This is for em term, globally open terminal"
    (interactive)
    (multi-vterm)
    (evil-insert-state))
  (evil-define-key 'insert vterm-mode-map (kbd "C-v")      #'yank)
  (evil-define-key 'insert vterm-mode-map (kbd "C-u")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-t")      #'daf/multi-vterm-project-toggle)

  )

(use-package magit
  :init
  (setq ediff-window-setup-function 'ediff-setup-windows-plain)
  (setq ediff-split-window-function (quote split-window-horizontally))
  :general
  (daf/key-leader
    "g" '(:ignore t :which-key "Git")
    "gm"  'magit)
  :config
  (add-hook 'with-editor-mode-hook 'evil-insert-state)
  ;; use the same window for magit status
  (setq magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1)
  (setq vc-follow-symlinks t))

(use-package diff-hl
  :general
  (daf/key-leader
    "g" '(:ignore t :which-key "Git")
    "gh"  'diff-hl-mode
    "gj"  'diff-hl-next-hunk
    "gk"  'diff-hl-previous-hunk
    "gp"  'diff-hl-inline-popup
    "gS"  'diff-hl-stage-current-hunk
    "gs"  'diff-hl-show-hunk
    "gr"  'diff-hl-revert-hunk)
  :init
  (global-diff-hl-mode)
  :config
  ;; (diff-hl-margin-mode )
  ;; (diff-hl-mode t)
  (add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh))

;; Non-necessary.... unless?
(use-package rainbow-mode :defer t )
(use-package olivetti
  :init
  (setq olivetti-mode-on-hook nil)
  :config
  (add-hook 'elfeed-show-mode-hook 'olivetti-mode)
  (add-hook 'elfeed-search-update-hook 'olivetti-mode)
  (add-hook 'dired-mode-hook 'olivetti-mode)
  (add-hook 'prog-mode-hook 'olivetti-mode)
  (add-hook 'text-mode-hook 'olivetti-mode)
  (add-hook 'org-agenda-mode-hook 'olivetti-mode)
  (add-hook 'vterm-mode-hook 'olivetti-mode)
  (add-hook 'magit-mode-hook 'olivetti-mode)
  (add-hook 'conf-unix-mode-hook 'olivetti-mode)
  (add-hook 'conf-javaprop-mode-hook 'olivetti-mode)
  (add-hook 'eww-mode-hook 'olivetti-mode)
  (add-hook 'compilation-mode-hook 'olivetti-mode)
  (add-hook 'help-mode-hook 'olivetti-mode)
  (add-hook 'pdf-view-mode-hook 'olivetti-mode)
  (add-hook 'minibuffer-mode-hook 'olivetti-mode)
  (add-hook 'messages-buffer-mode-hook 'olivetti-mode)
  (add-hook 'special-mode-hook 'olivetti-mode)
  (setq-default fill-column 100))

(use-package tab-bar
  :straight (:type built-in)
  :init
  (tab-bar-mode t)
  :general
  (general-def
    :states '(normal emacs)
    "C-j"  'tab-previous
    "C-k"  'tab-next)

  (daf/key-leader
    "t" '(:ignore t :which-key "tabs")
    "tt"  'tab-bar-switch-to-tab
    "ta"  'daf/tab-bar-new-tab
    "tq"  'daf/tab-bar-close-tab
    "tn"  'tab-next
    "tp"  'tab-previous
    "<" 'tab-previous
    ">" 'tab-next)
  :config
  (defun daf/tab-bar-hide-or-show ()
    (interactive)
    "Used to 'turn off' tab-bar with single tab"
    (if (> (length (tab-bar-tabs)) 1)
        (set-face-attribute 'tab-bar-tab nil :foreground "blue")
      (set-face-attribute 'tab-bar-tab nil :foreground "black")))

  (daf/tab-bar-hide-or-show)

  (defun daf/tab-bar-new-tab()
    (interactive)
    (tab-bar-new-tab)
    (daf/tab-bar-hide-or-show))

  (defun daf/tab-bar-close-tab()
    (interactive)
    (tab-bar-close-tab)
    (daf/tab-bar-hide-or-show))

  (defun daf/name-tab-by-project-or-default ()
    (if (project-current)
        (concat "PROJ: " (car (last (split-string(car (last (project-current))) "/") 2)))
      (tab-bar-tab-name-current))
    )
  (setq tab-bar-tab-name-function #'daf/name-tab-by-project-or-default)
  (setq tab-bar-close-button-show nil)
  (setq tab-bar-new-button nil)
  )

(use-package rg :defer t)
(use-package wgrep :defer t :config (setq wgrep-enable-key "T"))

(use-package evil-org
  :after (evil org general)
  :general
  (general-def
    :states '( motion emacs visual )
    :keymaps 'org-agenda-mode-map
    "SPC" 'nil
    "RET" 'org-agenda-switch-to
    "<tab>" 'org-agenda-filter-by-tag
    "C-e" 'daf/flip-window
    "l" 'org-agenda-show
    "t" 'org-agenda-todo
    "ct" 'org-agenda-set-tags
    "da" 'org-agenda-archive
    "C" 'org-agenda-capture
    "j" 'org-agenda-next-line
    "k" 'org-agenda-previous-line
    "u" 'org-agenda-undo
    "m" 'org-agenda-bulk-toggle
    "sc" 'org-agenda-filter-by-category
    "sr" 'org-agenda-filter-by-regexp
    "se" 'org-agenda-filter-by-effort
    "st" 'org-agenda-filter-by-tag
    "ss" 'org-agenda-limit-interactively
    "s^" 'org-agenda-filter-by-top-headline)
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (evil-set-initial-state 'org-agenda-mode 'motion))

(use-package org
  :straight (:type built-in)
  :init
  (add-hook 'org-mode-hook #'org-indent-mode)
  (add-hook 'org-mode-hook #'visual-line-mode)
  (add-hook 'org-capture-mode-hook #'evil-insert-state)
  (add-hook 'org-agenda-finalize-hook #'hl-line-mode)
  :general
  (daf/key-leader
    "a" '(:ignore t :which-key "Agenda")
    "aa" 'org-agenda
    "ad" '((lambda (&optional arg) (interactive "P")(org-agenda arg "d")):which-key "Daily")
    "aw" '((lambda (&optional arg) (interactive "P")(org-agenda arg "w")):which-key "Weekly")
    "ar" '((lambda (&optional arg) (interactive "P")(org-agenda arg "r")):which-key "Refile")
    "ap" ' ((lambda (&optional arg) (interactive "P")(org-agenda arg "p")):which-key "Project")
    "af" ' ((lambda (&optional arg) (interactive "P")(org-agenda arg "f")):which-key "Finance")
    "o" '(:ignore t :which-key "org")
    "oh"  'daf/choose-consult-org-heading
    "oo"  'daf/choose-consult-org-agenda-heading
    "ob"  'daf/choose-consult-org-bookmark-heading
    "on"  'daf/choose-consult-org-bookmark-heading-navigate
    "oc"  'make-capture-frame)

  (daf/key-local-leader
    :prefix ","
    :states '(normal visual)
    :keymaps 'org-mode-map
    "a"  'daf/org-archive-done-tasks
    "h"  'org-toggle-heading
    "s"  'daf/insert-now-timestamp
    "m"  'org-emphasize
    "e"  'org-babel-execute-src-block
    "E"  'org-babel-execute-subtree
    "f"  'org-tags-view
    "g"  'org-set-tags-command
    "t"  'org-todo
    "r"  'org-insert-structure-template
    ","  'org-toggle-checkbox
    "i"  'org-insert-link
    "I"  'daf/insert-url-as-org-link-fancy
    ;; "l"  'daf/org-open-current-frame
    "l"  'org-toggle-link-display
    )

  (general-def
    :states '(normal emacs)
    :keymaps 'org-mode-map
    "M-N" 'org-next-link
    "M-P" 'org-previous-link
    "M--" 'org-promote-subtree
    "M-=" 'org-demote-subtree
    "RET" 'org-open-at-point)

  :config
  (setq org-ellipsis "->")
  (setq org-hide-emphasis-markers t) ;; hide org markdown elemets like *bold*
  (setq org-agenda-files config--org-agenda-files) ;; location of agenda files
  (setq org-directory config--org-directory) ;; location of org directory
  (setq org-agenda-window-setup 'only-window) ;; make agenda use current window
  (setq org-use-tag-inheritance t) ;; tags will apply to lower headings (for agenda filtering)
  (setq org-agenda-use-tag-inheritance t) ;; make tags apply to lower items as well

  (defun org-summary-todo (n-done n-not-done)
    "Switch entry to DONE when all subentries are done, to TODO otherwise."
    (let (org-log-done org-log-states)   ; turn off logging
      (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

  (add-hook 'org-after-todo-statistics-hook #'org-summary-todo)

  (defun org-todo-if-needed (state)
    "Change header state to STATE unless the current item is in STATE already."
    (unless (string-equal (org-get-todo-state) state)
      (org-todo state)))

  (defun ct/org-summary-checkbox-cookie ()
    "Switch header state to DONE when all checkboxes are ticked, to TODO when none are ticked, and to DOING otherwise"
    ;; https://forum.zettelkasten.de/discussion/1682/emacs-org-mode-auto-update-todo-item-states-to-represent-checkbox-progress
    (let (beg end)
      (unless (not (org-get-todo-state))
        (save-excursion
          (org-back-to-heading t)
          (setq beg (point))
          (end-of-line)
          (setq end (point))
          (goto-char beg)
          ;; Regex group 1: %-based cookie
          ;; Regex group 2 and 3: x/y cookie
          (if (re-search-forward "\\[\\([0-9]*%\\)\\]\\|\\[\\([0-9]*\\)/\\([0-9]*\\)\\]"
                                 end t)
              (if (match-end 1)
                  ;; [xx%] cookie support
                  (cond ((equal (match-string 1) "100%")
                         (org-todo-if-needed "DONE"))
                        ((equal (match-string 1) "0%")
                         (org-todo-if-needed "TODO"))
                        (t
                         (org-todo-if-needed "DOING")))
                ;; [x/y] cookie support
                (if (> (match-end 2) (match-beginning 2)) ; = if not empty
                    (cond ((equal (match-string 2) (match-string 3))
                           (org-todo-if-needed "DONE"))
                          ((or (equal (string-trim (match-string 2)) "")
                               (equal (match-string 2) "0"))
                           (org-todo-if-needed "TODO"))
                          (t
                           (org-todo-if-needed "TODO")))
                  (org-todo-if-needed "TODO"))))))))
  (add-hook 'org-checkbox-statistics-hook #'ct/org-summary-checkbox-cookie)

  ;; there has the be a themeable way to do this
  (setq org-todo-keyword-faces
    (quote (("TODO"      :foreground "#24a8b4" :weight nil)
    	    ("NEXT"      :foreground "#29d398" :weight nil)
    	    ("DONE"      :foreground "#202026" :weight nil)
    	    ("KILL"      :foreground "#E93C58" :weight nil)
    	    ("MEETING"   :foreground "#ffaf87" :weight nil)
    	    ("PHONE"     :foreground "#9d6eba" :weight nil))))

  (defun daf/org-archive-done-tasks ()
    (interactive)
    (org-map-entries
     (lambda () (org-archive-subtree)
       (setq org-map-continue-from
             (org-element-property :begin (org-element-at-point))))
     "/DONE" 'file)
    (org-save-all-org-buffers))

  (defun daf/insert-now-timestamp()
    "Insert org mode timestamp at point with current date and time."
    (interactive)
    (org-insert-time-stamp (current-time) t))

  (defun daf/insert-url-as-org-link-fancy ()
    "If there's a URL on the clipboard, insert it as an org-mode
    link in the form of [[url][*]], and leave point at *."
    (interactive)
    (let ((link (substring-no-properties (x-get-selection 'CLIPBOARD)))
          (url  "\\(http[s]?://\\|www\\.\\)"))
      (save-match-data
        (if (string-match url link)
            (progn
              (insert (concat "[[" link "][]]"))
              (backward-char 2)
              (evil-insert-state)
              )
          (error "No URL on the clipboard")))))

  (defun daf/choose-consult-org-agenda-heading ()
    (interactive)
    (consult-org-agenda)
    (org-cycle 3))

  (defun daf/choose-consult-org-heading()
    (interactive)
    (consult-org-heading)
    (forward-char 2)
    (org-cycle 3))

  (defun daf/choose-consult-org-bookmark-heading ()
    (interactive)
    (find-file config--bookmarks)
    (message config--bookmarks)
    (consult-org-heading)
    (forward-char 2)
    (org-cycle 3))

  (defun daf/choose-consult-org-bookmark-heading-navigate ()
    "open bookmark file, choose heading, open it, flip back to previous window"
    (interactive)
    (find-file config--bookmarks)
    (message config--bookmarks)
    (consult-org-heading)
    (forward-char 2)
    (org-open-at-point)
    (daf/flip-window))

  ;; Refile
  (advice-add 'org-refile :after (lambda (&rest _) (org-save-all-org-buffers))) ;; save on refile
  (defun bh/verify-refile-target ()
	"Exclude todo keywords with a done state from refile targets"
	(not (member (nth 2 (org-heading-components)) org-done-keywords)))
  (setq org-refile-target-verify-function 'bh/verify-refile-target)
  (setq org-refile-targets (quote ((nil :maxlevel . 9) (org-agenda-files :maxlevel . 9))))
  (setq org-refile-use-outline-path 'file)
  (setq org-outline-path-complete-in-steps nil)
  (setq org-refile-allow-creating-parent-nodes t)

  ;; Custom Agenda views
  (defun air-org-skip-subtree-if-priority (priority)
    "Skip an agenda subtree if it has a priority of PRIORITY.
		  PRIORITY may be one of the characters ?A, ?B, or ?C."
    (let ((subtree-end (save-excursion (org-end-of-subtree t)))
	  (pri-value (* 1000 (- org-lowest-priority priority)))
	  (pri-current (org-get-priority (thing-at-point 'line t))))
      (if (= pri-value pri-current) subtree-end nil)))

  (defun air-org-skip-subtree-if-habit ()
    "Skip an agenda entry if it has a STYLE property equal to \"habit\"."
    (let ((subtree-end (save-excursion (org-end-of-subtree t))))
      (if (string= (org-entry-get nil "STYLE") "habit") subtree-end nil)))

  (setq org-agenda-custom-commands
	'(("w" "WEEKLY"
	   ((tags "PRIORITY=\"A\""
		  ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
		   (org-agenda-overriding-header "HIGH-PRIORITY")))
	    (agenda "" ((org-agenda-span 'week)))
	    (tags-todo "-project-refile-habit-finance-read" ""
		       ((org-agenda-skip-function
			 '(or (air-org-skip-subtree-if-habit)
			      (air-org-skip-subtree-if-priority ?A)
			      (org-agenda-skip-if nil '(scheduled deadline))))
			(org-agenda-overriding-header "ALL TASKS")))))
	  ("d" "DAILY"
	   ((tags "PRIORITY=\"A\""
		  ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
		   (org-agenda-overriding-header "HIGH-PRIORITY")))
	    (agenda "" ((org-agenda-span 'day)))
	    (tags-todo "-project-refile-event-watch-finance-read"
		       ((org-agenda-skip-function
			 '(or (air-org-skip-subtree-if-habit)
			      (air-org-skip-subtree-if-priority ?A)
			      (org-agenda-skip-if nil
						  '(scheduled deadline))))
			(org-agenda-overriding-header "TASKS")))))
	  ("p" "PROJECTS"
	   ((tags-todo "project"
		       ((org-agenda-skip-function
			 '(or ( org-agenda-skip-entry-if 'todo 'done )))
			(org-agenda-overriding-header "PROJECTS")))))

	  ("f" "FINANCES"
	   ((tags-todo "finance"
		       ((org-agenda-skip-function
			 '(or ( org-agenda-skip-entry-if 'todo 'done )))
			(org-agenda-overriding-header "FINANCES")))))

	  ("r" "REFILES"
	   ((tags-todo "refile"
		       ((org-agenda-skip-function
			 '(or ( org-agenda-skip-entry-if 'todo 'done )))
			(org-agenda-overriding-header "REFILE")))))))

  ;; CAPTURE
  (setq org-capture-templates
	'(
	  ("t" "TODO" entry (file+headline config--org-agenda-file "REFILE") "* TODO %?\n")
	  ("w" "WATCH" entry (file+headline config--org-agenda-file "WATCH") "* TODO %?\n")
	  ("f" "BUY" entry (file+headline config--org-agenda-file "BUY") "* TODO %?\n")
	  ("R" "READ" entry (file+headline config--org-agenda-file "READ") "* TODO %?\n")
	  ("n" "NOTE" entry (file+headline config--org-agenda-file "NOTE") "** %?\n")
	  ("b" "book" entry (file config--bookmarks ) "* %?")
	  ("h" "HABIT" entry (file+headline config--org-agenda-file "HABIT")
	   "* NEXT %?\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n")
	  ;; ("m" "MEETING" entry (file+headline config--org-agenda-file "Refile")
	  ;;  "* MEETING with %? :MEETING:\n%U")
	  ;; ("p" "Phone call" entry (file+headline config--org-agenda-file "Refile")
	  ;;  "* PHONE %? :PHONE:\n%U")
	  ;; ("r" "RESPOND" entry (file+headline config--org-agenda-file "REFILE")
	  ;;  "* NEXT Respond to %^{to} about %^{about} \nSCHEDULED: %t\n%U\n\n" :immediate-finish t)
	  ))

  ;; Set up external capture frame.
  ;; *MUST USE C-c and C-k, not the evil alternatives ZZ/ZQ*
  ;; or else it doesnt turn vertico-posframe back on

  ;; Assuming emacsclient is running.
  ;; Bind this command to a key with your window manager.
  ;; emacsclient -e '(make-capture-frame)'

  ;; Vertico-posframe screws up with the capture frame
  ;; So I turn it off with the creation of the frame
  ;; then turn it on with all the end states of a capture.
  ;; (finalize, refile, destroy)

  (defun make-capture-frame ()
    "Create a new frame and run org-capture."
    (interactive)
    (select-frame-set-input-focus
     (make-frame '((name . "capture") (width . 120) (height . 15))))
    (org-capture))

;;; Testing...
  ;; (defun make-capture-frame-mini (list)
  ;;   "Testing dmenu replacement"
  ;;    ;; emacsclient -e '(make-capture-frame-mini (list "chill" "phonk"))'
  ;;   (interactive)
  ;;   (make-frame '((width . 120) (height . 15) (minibuffer . only) (name . "capture")))
  ;;   (select-frame-by-name "capture")
  ;;   (select-frame-set-input-focus (selected-frame)) ;; possibly not needed
  ;;   (unwind-protect
  ;;       (message (completing-read "Choose: " list))
  ;;     (delete-frame)
  ;;     ))

  (defadvice org-switch-to-buffer-other-window
      (after supress-window-splitting activate)
    "Delete the extra window if we're in a capture frame"
    (if (equal "capture" (frame-parameter nil 'name))
        (delete-other-windows)))

  (defadvice org-capture-destroy
      (after delete-capture-frame activate)
    "Advise capture-destroy to close the frame"
    (if (equal "capture" (frame-parameter nil 'name))
        (progn (delete-frame))))

  (defadvice org-capture-select-template (around delete-capture-frame activate)
    "Advise org-capture-select-template to close the frame on abort"
    (unless (ignore-errors ad-do-it t)
      (setq ad-return-value "q"))
    (if (and
         (equal "q" ad-return-value)
         (equal "capture" (frame-parameter nil 'name)))
        (progn (delete-frame))))

  (defadvice org-capture-refile
      (after delete-capture-frame activate)
    "Advise org-refile to close the frame"
    (if (equal "capture" (frame-parameter nil 'name))
        (progn (delete-frame))))

  (defadvice org-capture-finalize
      (after delete-capture-frame activate)
    "Advise capture-finalize to close the frame"
    (when (and (equal "capture" (frame-parameter nil 'name))
               (not (eq this-command 'org-capture-refile)))
      (progn (delete-frame))))

  ;; Org babel
  ;; Run/highlight code using babel in org-mode
  (load-file (concat user-emacs-directory "ob-languages/ob-sh.el"))

  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     ;; (python . t)
     (sh . t)
     (shell . t)
     ))
  ;; Syntax highlight in #+BEGIN_SRC blocks
  (setq org-src-fontify-natively t)
  ;; Don't prompt before running code in org
  (setq org-confirm-babel-evaluate nil))

(use-package org-tempo :straight (:type built-in))
(use-package org-appear)

;; This is only used for lsp snippet expansion
(use-package yasnippet :init (yas-global-mode))
(use-package yasnippet-snippets)
(use-package lsp-mode
  :after (yasnippet yasnippet-snippets)
  :init
  (setq lsp-keep-workspace-alive nil)
  :hook (
	 (python-mode . lsp)
	 (go-mode . lsp)
	 (c-mode . lsp)
	 (rjsx-mode . lsp)
	 (web-mode . lsp)
	 ;; (sh-mode . lsp)
	 ;; (lisp-mode . lsp)
	 ;; (css-mode . lsp)
	 ;; (html-mode . lsp)
	 ;; (json-mode . lsp)
	 ;; (latex-mode . lsp)
	 (lsp-mode . lsp-enable-which-key-integration))
  :general
  (daf/key-leader
    "i" 'consult-imenu-multi
    "I" 'consult-imenu
    )

  (daf/key-local-leader
    :keymaps 'prog-mode-map
    "r" 'lsp-rename
    "R" 'lsp-workspace-restart
    "d" 'lsp-describe-thing-at-point
    "m" 'lsp-ui-peek-find-references
    "a" 'lsp-execute-code-action
    "f" 'lsp-format-buffer
    "s" 'lsp-signature-activate
    "i" 'lsp-organize-imports
    "n" 'flymake-goto-next-error
    "p" 'flymake-goto-prev-error
    "u" 'lsp-ui-imenu)
  :config
  (setq lsp-restart 'ignore)
  (setq lsp-enable-symbol-highlighting nil)
  (setq lsp-lens-enable nil)
  (setq lsp-eldoc-enable-hover nil)
  (setq lsp-headerline-breadcrumb-enable nil)
  (setq lsp-signature-auto-activate nil)
  (setq lsp-log-io nil)
  (setq lsp-enable-file-watchers nil)
  ;; bash
  (setq sh-basic-offset 4)
  (setq shr-indentation 4))

(use-package lsp-ui
  :after lsp-mode
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-sideline-enable nil
	lsp-ui-doc-position 'at-point
	lsp-ui-sideline-show-symbol nil
	lsp-ui-sideline-show-hover nil
	lsp-ui-sideline-show-code-actions nil
	lsp-ui-peek-enable nil
	lsp-ui-imenu-enable nil
	lsp-ui-doc-enable nil))

(use-package go-mode :mode "\\.go\\'")
;; (use-package html-mode
;;   :straight (:type built-in)
;;   :mode "\\.tmpl\\'"
;;   )
(use-package json-mode :mode "\\.json\\'")
(use-package yaml-mode :mode "\\.yaml\\'" "\\.yml\\'")
(use-package web-mode :mode "\\.tmpl\\'")
(use-package rjsx-mode
  :defer t
  :mode ("\\.js\\'" "\\.jsx\\'")
  :config
  (setq js2-strict-missing-semi-warning nil)
  (setenv "TSSERVER_LOG_FILE" "/tmp/tsserver.log")
  (setq js2-mode-show-parse-errors nil)
  (setq js2-mode-show-strict-warnings nil))

(use-package emmet-mode :hook (html-mode . emmet-mode))
(use-package restclient :defer t)
(use-package pdf-tools
  ;; run pdf-tools-install on first use
  :config
  (pdf-tools-install)
  (add-hook 'pdf-view-mode-hook 'pdf-view-themed-minor-mode)
  (add-hook 'pdf-view-mode-hook 'pdf-view-center-in-window)
  (setq-default pdf-view-display-size 'fit-page))

(load (concat user-emacs-directory "lisp/rotate.el"))

;; Really not necessary....UNLESS???
;; for some reason this is loaded twice...
(load "~/pea/emacs/elfeed.el")

;; Handle browser urls with redirected links
;; This needs a lot of cleanin...
(defun daf/play (url &rest args)
  "Play link under point with 'play pause low' command"
  (interactive)
  (start-process "play" nil "play" "pause" "low" url)
  (message "Playing..."))

(defun daf/play-checkbox ()
  "Play link under point with 'play pause low' command"
  (interactive)
  (daf/play (plist-get (cadr (org-element-context)) :raw-link))
  (org-toggle-checkbox))

(defun replace-in-string (what with in)
  (replace-regexp-in-string (regexp-quote what) with in nil 'literal))

(defun daf/redirect-old-reddit (url &rest args)
  "Redirect to libredd.it"
  (interactive)
  (browse-url-default-browser (replace-in-string "old.reddit.com" "libredd.it" url) ))

(defun daf/redirect-spike-reddit (url &rest args)
  "Redirect to libredd.it"
  (interactive)
  (browse-url-default-browser (replace-in-string "old.reddit.com" "libreddit.spike.codes" url) ))

(defun daf/redirect-libreddit (url &rest args)
  "Redirect to libredd.it"
  (interactive)
  (browse-url-default-browser (replace-in-string "reddit.com" "libredd.it" url)))

;; open regex url with handler function
(setq browse-url-handlers
      (quote (("old.reddit\\.?com" . daf/redirect-spike-reddit)
              (".*reddit\\.?com" . daf/redirect-spike-reddit)
              ("youtu\\.?be/watch.*" . daf/play)
              ("vid\\.puffyan\\.?us/watch.*" . daf/play)
              ("." . browse-url-default-browser))))

(defun make-qute-capture-frame (url title)
  (interactive)
  ;; check if url exists in bookmarks
  (with-temp-buffer
    (insert-file-contents config--bookmarks)
    (unless  (re-search-forward url nil t)
      (progn
        ;; open capture frame
        (select-frame-set-input-focus
         (make-frame '((name . "capture") (width . 120) (height . 15))))
        (org-capture-string "I dont know what this string is for" "b")
        (ignore-errors)
        (insert "[["url"]""["title"]]\n")
        ))))

(defun make-qute-capture-frame-finalize (url title)
  (interactive)
  ;; check if url exists in bookmarks
  (with-temp-buffer
    (insert-file-contents config--bookmarks)
    (unless  (re-search-forward url nil t)
      (progn
        ;; open capture frame
        (select-frame-set-input-focus
         (make-frame '((name . "capture") (width . 120) (height . 15))))
        (org-capture-string "I dont know what this string is for" "b")
        (ignore-errors)
        (insert "[["url"]""["title"]]\n")
        (org-capture-finalize)))))
