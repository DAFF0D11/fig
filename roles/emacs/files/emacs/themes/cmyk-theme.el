;; cmyk-theme.el --- A minimalistic custom theme for Emacs
(deftheme cmyk
  "If you squint, it sort of works...")
(let (
       (bakg    "#000000")
       (forg    "#e7e7e7")
       (cyan    "#00bdb1")
       (magenta "#e61566")
       (yellow  "#f7e92e")
       (black   "#000000")
       (white   "#ffffff")
       (gray    "#4c4c5f")
       (gray11  "#111119")
       (gray55  "#a2a4ba") ;; original forg
       (gray88  "#f9f9f9")
       (red     "#E93C58")
       (green   "#5cd59c")
       (blue    "#5f71a1")
       (diff-green    "#0b3a29")
       (diff-green-hl "#1a8660")
       (diff-red      "#390f16")
       (diff-red-hl   "#9d293c")
       (diff-blue     "#5f71a1")
       (diff-blue-hl  "#5f71a1")
       )

(custom-theme-set-faces
 'cmyk
 ;; Standard font lock faces
 `(default                          ((t (:background, bakg :foreground, forg ))))
 `(bold                             ((t (:bold nil))))
 `(italic                           ((t (:bold nil))))
 `(underline                        ((t (:bold nil))))
 `(variable-pitch                   ((t (nil))))
 `(cursor                           ((t (:background, white))))

 `(font-lock-comment-face           ((t (:bold nil :foreground, gray ))))
 `(font-lock-comment-delimiter-face ((t (:bold nil :foreground, gray ))))

 `(font-lock-doc-string-face        ((t (:foreground, cyan ))))
 `(font-lock-string-face            ((t (:foreground, cyan ))))
 `(font-lock-doc-face               ((t (:foreground, cyan ))))

 `(font-lock-function-name-face     ((t (           :foreground, forg ))))
 `(font-lock-builtin-face           ((t (:bold, nil :foreground, forg))))
 `(font-lock-variable-name-face     ((t (           :foreground, forg ))))
 ;; `(font-lock-reference-face         ((t (           :foreground, forg ))))
 ;; `(font-lock-function               ((t (           :foreground, green ))))
 `(font-lock-constant-face          ((t (           :foreground, forg ))))
 `(font-lock-type-face              ((t (:bold, nil :foreground, gray ))))
 ;; `(font-lock-number-face            ((t (           :foreground, grayll ))))
 ;; `(font-lock-preprocessor-face      ((t (           :foreground, foreg ))))
 `(font-lock-keyword-face           ((t (:bold, nil :foreground, magenta))))
 `(font-lock-warning-face           ((t (:bold, nil :foreground, magenta))))

 ;; Emacs Interface
 `(fringe              ((t (:background, bakg :foreground, bakg ))))
 ;; `(menu                ((t (:background, grayd :foreground, grayl ))))
 ;; `(minibuffer-prompt   ((t (:foreground, grayll ))))
 `(line-number   ((t (:foreground, gray ))))

 ;; split window color vertical border
 ;; `(vertical-border  ((t ( :foreground, foreg  ))))
 `(vertical-border  ((t ( :foreground, bakg  ))))

 `(region              ((t (:background, gray11 ))))
 ;; `(secondary-selection ((t (:background, backg :foreground, grayll ))))
 ;; `(tool-bar            ((t (:background, grayd :foreground, grayd ))))
 ;; `(tooltip             ((t (:background, graym :foreground, grayd ))))
 ;; `(widget-button-face  ((t (:bold nil :foreground, graym ))))
 ;; `(widget-field-face   ((t (:bold nil :foreground, grayd ))))

 `(mode-line          ((t (:background, bakg :foreground, forg ))))
 `(mode-line-inactive ((t (:background, bakg :foreground, gray ))))

 ;; Search
 `(isearch                     ((t (:foreground, bakg :background, forg ))))
 `(isearch-lazy-highlight-face ((t (:foreground, forg ))))
 `(lazy-highlight              ((t (:foreground, bakg :background, forg ))))

 ;; Parenthesis matching
 `(show-paren-match-face    ((t (:foreground, bakg :background, gray ))))
 `(show-paren-mismatch-face ((t (:foreground, bakg :background, forg ))))

 ;; Pair
 `(sp-pair-overlay-face ((t (:foreground, forg :background, bakg ))))

 ;; Line highlighting
 `(hl-line                     ((t (:background, gray11 :foreground nil ))))
 `(highlight                   ((t (:background, gray11 :foreground nil ))))

 ;; what is this?
 ;; `(highlight-current-line-face ((t (:background, grayd :foreground nil ))))

 ;; Buttons
 `(button             ((t (:bold nil ))))
 `(custom-button-face ((t (:bold nil :foreground, gray ))))

 ;; Calendar
 `(holiday-face ((t (:background, bakg :foreground, red ))))

 ;; Dired
 `(dired-directory ((t (:bold nil :foreground, cyan ))))
 `(dired-symlink ((t (:foreground, magenta ))))

 ;; Dired subtree
 `(dired-subtree-depth-1-face ((t :background, bakg )))
 `(dired-subtree-depth-2-face ((t :background, bakg )))
 `(dired-subtree-depth-3-face ((t :background, bakg )))
 `(dired-subtree-depth-4-face ((t :background, bakg )))
 `(dired-subtree-depth-5-face ((t :background, bakg )))
 `(dired-subtree-depth-6-face ((t :background, bakg )))

 ;; info, help and apropos faces
 `(info-header-node ((t (:foreground, gray ))))
 `(info-header-xref ((t (:foreground, gray ))))
 `(info-menu-5      ((t (:underline t))))
 `(info-menu-header ((t (:bold nil :foreground, gray ))))
 `(info-node        ((t (:bold nil :foreground, gray ))))
 `(info-xref        ((t (:bold nil :foreground, gray ))))

 ;; Org
 `(org-ellipsis      ((t (:foreground, gray :underline nil ))))
 `(org-date-selected ((t (:foreground, red :background, bakg ))))
 `(org-todo          ((t (:foreground, white :background, bakg ))))
 `(org-drawer        ((t (:foreground, gray :underline nil ))))
 `(org-date          ((t (:foreground, gray :underline nil ))))
 `(org-tag           ((t (:bold nil :foreground, gray :underline nil ))))
 `(org-code          ((t (:foreground, gray :underline nil ))))
 `(org-block         ((t (:background, bakg :foreground, forg :underline nil ))))

 ;; `(org-headline-todo ((t (:bold, t :foreground, grayll :underline, nil ))))
 ;; `(org-headline-done ((t (:bold, t :foreground, grayll :underline, nil ))))
 `(org-headline-done ((t (:bold nil :foreground, gray ))))

 `(org-level-1 ((t (:bold, nil :foreground, yellow :underline, nil ))))
 `(org-level-2 ((t (:bold, nil :foreground, cyan :underline, nil ))))
 `(org-level-3 ((t (:bold, nil :foreground, magenta :underline, nil ))))
 `(org-level-4 ((t (:bold, nil :foreground, blue :underline, nil ))))
 `(org-level-5 ((t (:bold, nil :foreground, red :underline, nil ))))
 `(org-level-6 ((t (:bold, nil :foreground, green :underline, nil ))))

 `(org-agenda-date-today     ((t (:foreground, cyan :background, bakg ))))
 ;; `(org-agenda-calendar-event ((t (:foreground, red :background, backg ))))
 `(org-scheduled-previously  ((t (:foreground, yellow :background, bakg ))))

 ;; `(org-ellipsis ((t (:background, bg :foreground, g8 :underline nil))))

 `(org-link ((t (:bold nil :foreground, cyan :underline nil ))))
 `(link     ((t (:bold nil :foreground, cyan :underline nil ))))

 `(header-line           ((t (:background, bakg :foreground, magenta ))))
 `(header-line-highlight ((t (:background, bakg :foreground, forg ))))
 `(help-key-binding      ((t (:background, bakg :foreground, forg ))))

;; bookmark
 `(bookmark-face ((t (:background, bakg :foreground, cyan ))))

 ;; Org Agenda
 `(org-agenda-date ((t (:background, bakg :foreground, forg ))))
 `(org-agenda-date-weekend ((t (:bold, nil :background, bakg :foreground, forg ))))
 `(org-agenda-structure ((t ( :bold, nil :background, bakg :foreground, forg ))))
 `(org-scheduled ((t (:background, bakg :foreground, gray ))))
 `(org-scheduled-today ((t (:background, bakg :foreground, forg ))))

 ;; Avy
 `(avy-goto-char-timer-face ((t ( :bold nil :background, bakg :foreground, green ))))
 `(avy-background-face ((t ( :bold nil :background, bakg :foreground, green ))))
 `(avy-lead-face ((t ( :bold nil :background, bakg :foreground, green ))))
 `(avy-lead-face-0 ((t ( :bold nil :background, bakg :foreground, green ))))
 `(avy-lead-face-1 ((t (:bold nil :background, bakg :foreground, green ))))
 `(avy-lead-face-2 ((t (:bold nil :background, bakg :foreground, green ))))

 ;; JavaScript
 `(js2-function-param ((t ( :foreground, forg ))))

 ;; Vertico
 `(vertico-current ((t (:background, gray11 :foreground, forg ))))

 ;; Vertico posframe
 ;; `(vertico-posframe-border ((t (:background, gray ))))

 ;; Consult
 `(consult-preview-match  ((t (:background, bakg :foreground, forg ))))
 `(consult-preview-cursor ((t (:background, bakg :foreground, forg ))))

 ;; Completion
 `(completions-common-part      ((t ( :foreground, magenta ))))
 `(completions-first-difference ((t (:bold nil :foreground, forg ))))
 `(completions-common-part      ((t ( :foreground, magenta ))))


 ;; tab-bar
 `(tab-bar              ((t (:background, bakg :foreground, gray ))))
 `(tab-bar-tab          ((t (:background, bakg :foreground, yellow ))))
 `(tab-bar-tab-ungrouped ((t (:background, bakg :foreground, gray ))))
 `(tab-bar-tab-inactive ((t (:background, bakg :foreground, gray ))))


 ;; Company
 `(company-tooltip-common               ((t (:bold nil :background, bakg :foreground, cyan ))))
 `(company-tooltip-common-selection     ((t (:bold nil :background, bakg :foreground, yellow ))))
 `(company-tooltip                      ((t (:bold nil :background, bakg :foreground, magenta ))))
 `(company-tooltip-selection            ((t (:bold nil :background, bakg :foreground, white ))))
 `(company-tooltip-annotation           ((t (:bold nil :foreground, gray ))))
 `(company-tooltip-annotation-selection ((t (:bold nil :foreground, gray ))))
 `(company-tooltip-scrollbar-thumb      ((t (:bold nil :background, bakg :foreground, bakg ))))
 `(company-tooltip-scrollbar-track      ((t (:bold nil :background, bakg :foreground, bakg ))))

 ;; diff-hl
 ;; `(diff-hl-add-highlighting ((t (:background, fg :foreground,g8))))
 `(diff-hl-change ((t (:background, yellow :foreground, yellow ))))
 `(diff-hl-delete ((t (:background, magenta :foreground, magenta ))))
 `(diff-hl-insert ((t (:background, cyan :foreground, cyan ))))

;; Magit
 ;; `(magit-header-line ((t (:bold t :background, bakg :foreground, fg ))))
 `(magit-section-heading             ((t (:bold nil :background, bakg :foreground, yellow ))))
 `(magit-section-highlight           ((t (:bold nil  :background, gray11  ))))
 `(magit-diff-context-highlight      ((t (:bold nil  :foreground, white :background, gray11  ))))
 `(magit-diff-context                ((t (:bold nil  :foreground, gray55 :background, gray11  ))))
 `(magit-diff-hunk-heading-highlight ((t (:bold nil :foreground, bakg  :background, gray88  ))))
 `(magit-diff-file-heading           ((t (:bold nil :foreground, forg  :background, bakg  ))))
 `(magit-diff-hunk-heading           ((t (:bold nil :background, gray  ))))
 `(magit-diff-added-highlight        ((t (:bold nil :foreground, white :background, diff-green-hl  ))))
 `(magit-diff-added                  ((t (:bold nil :background, diff-green  ))))
 `(magit-diff-removed-highlight      ((t (:bold nil :foreground, white :background, diff-red-hl  ))))
 `(magit-diff-removed                ((t (:bold nil :background, diff-red  ))))
 `(magit-branch-remote   ((t (:bold nil  :foreground, magenta :background, bakg  ))))
 `(magit-branch-local  ((t (:bold nil  :foreground, cyan :background, bakg  ))))
 `(git-commit-summary  ((t (:bold nil  :foreground, forg :background, bakg  ))))
 `(git-commit-overlong-summary  ((t (:bold nil  :foreground, red :background, bakg  ))))

 ;; shell
 ;; `(sh-quoted-exec ((t ( :height, 120 :foreground, orange ))))
 `(sh-heredoc ((t ( :height, 120 :foreground, gray ))))

;; orderless
 `(orderless-match-face-0 ((t (:foreground, cyan ))))
 `(orderless-match-face-1 ((t (:foreground, magenta ))))
 `(orderless-match-face-2 ((t (:foreground, white ))))

;; elfeed
 `(elfeed-search-date-face         ((t (:foreground, gray11 ))))
 `(elfeed-search-title-face        ((t (:bold nil :foreground, gray ))))
 `(elfeed-search-feed-face         ((t (:foreground, forg ))))
 `(elfeed-search-tag-face          ((t (:foreground, gray ))))
 `(elfeed-search-unread-title-face ((t (:foreground, cyan ))))

 `(shr-text ((t ( :height, 120 ))))
 ;; `(shr-link ((t ( :height, 120 :foreground, blue ))))
 ;; `(shr-code ((t ( :height, 120 :background, grayd :foreground, grayll ))))

;; message
 `(message-header-name ((t (:foreground, magenta ))))
 `(message-header-subject ((t (:foreground, yellow ))))
 `(message-header-other ((t (:foreground, cyan ))))
 `(message-header-to ((t (:foreground, yellow ))))

 ;;bufler
 ;; `(bufler-group               ((t (:bold nil :background, bakg :foreground, forg ))))

 ;; Tree sitter

 `(tree-sitter-hl-face:function.method.call ((t (:bold nil :background, bakg :foreground, forg ))))

 ;; Terminal
 `(vterm                     ((t (:bold nil :background, bakg :foreground, forg ))))
 `(vterm-color-inverse-video ((t (:bold nil :background, forg ))))
 `(vterm-color-default       ((t (:bold nil :background, forg :foreground, forg ))))
 `(vterm-color-white         ((t (:bold nil :foreground, white ))))
 `(vterm-color-black         ((t (:bold nil :background, gray :foreground, gray ))))
 `(vterm-color-yellow        ((t (:bold nil :foreground, yellow ))))
 `(vterm-color-green         ((t (:bold nil :foreground, green))))
 `(vterm-color-red           ((t (:bold nil :foreground, red ))))
 `(vterm-color-blue          ((t (:bold nil :foreground, blue ))))
 `(vterm-color-magenta       ((t (:bold nil :foreground, magenta ))))
 `(vterm-color-cyan          ((t (:bold nil :foreground, cyan ))))
 ))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'cmyk)

;; Local Variables:
;; no-byte-compile: t
;; End:
