;; THIS HAS BOLD
;; simple-theme.el --- A minimalistic custom theme for Emacs
;; Revision 3
;;
;; Copyright (C) 2008-2010, 2016 Jason R. Blevins <jrblevin@sdf.org>
;;
;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;;
;; The above copyright notice and this permission notice shall be included in
;; all copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
;; THE SOFTWARE.


(deftheme simple
  "A minimalistic and mostly monochromatic color scheme inspired
by `color-theme-late-night' and the Light is Light theme for vim.")

(let (
       (curs    "#1ef1a4")

       (backg   "#000000")
       (foreg   "#ffffff")

       (red     "#E93C58")
       (green   "#1ef1a4")
       (yellow  "#ffaf87")
       (blue    "#6d72a3")
       (magenta "#bc84df")
       (cyan    "#a4ffff")

       (grayd   "#111111")
       (graym   "#454558")
       (grayml  "#a2a4ba")
       (grayl   "#d9dce7")
       )

(custom-theme-set-faces
 'simple

 ;; Standard font lock faces
 `(default ((t (:background, backg :foreground, grayml ))))
 `(bold ((t (:bold t :foreground, foreg ))))
 `(italic ((t (:bold t))))
 `(underline ((t (:bold nil))))
 `(variable-pitch ((t (nil))))
 `(cursor ((t (:background, green))))
 `(font-lock-comment-face ((t (:foreground, graym ))))
 `(font-lock-comment-delimiter-face ((t (:foreground, graym ))))
 `(font-lock-doc-string-face ((t (:foreground, yellow ))))
 `(font-lock-string-face ((t (:foreground, yellow ))))
 `(font-lock-function-name-face ((t (:foreground, blue ))))
 `(font-lock-variable-name-face ((t (:foreground, foreg ))))
 `(font-lock-constant-face ((t (:foreground, foreg ))))
 `(font-lock-doc-face ((t (:foreground, foreg ))))
 `(font-lock-preprocessor-face ((t (:foreground, foreg ))))
 `(font-lock-reference-face ((t (:foreground, foreg ))))
 `(font-lock-type-face    ((t (:bold, nil :foreground, foreg ))))
 `(font-lock-builtin-face ((t (:bold, nil :foreground, foreg))))
 `(font-lock-keyword-face ((t (:bold, nil :foreground, foreg))))
 `(font-lock-warning-face ((t (:bold, nil :foreground, red))))

 ;; Emacs Interface
 `(fringe ((t (:background, backg :foreground, backg ))))
 `(header-line ((t (:background, graym :foreground, backg ))))
 `(menu ((t (:background, grayd :foreground, grayl ))))
 `(minibuffer-prompt ((t (:foreground, foreg ))))
 `(region ((t (:background, graym :foreground, foreg ))))
 `(secondary-selection ((t (:background, backg :foreground, foreg ))))
 `(tool-bar ((t (:background, grayd :foreground, grayd ))))
 `(tooltip ((t (:background, graym :foreground, grayd ))))
 `(widget-button-face ((t (:bold t :foreground, graym ))))
 `(widget-field-face ((t (:bold t :foreground, graym ))))

 `(mode-line ((t (:background, backg :foreground, foreg ))))
 `(mode-line-inactive ((t (:background, backg :foreground, graym ))))

 ;; Search
 `(isearch ((t (:foreground, backg :background, curs ))))
 `(isearch-lazy-highlight-face ((t (:foreground, curs ))))
 `(lazy-highlight ((t (:foreground, backg :background, curs ))))

 ;; Parenthesis matching
 `(show-paren-match-face ((t (:foreground, backg :background, grayl ))))
 `(show-paren-mismatch-face ((t (:foreground, backg :background, red ))))

 ;; Pair
 `(sp-pair-overlay-face ((t (:foreground, red :background, backg ))))

 ;; Line highlighting
 `(highlight ((t (:background, graym :foreground nil ))))
 `(highlight-current-line-face ((t (:background, grayl :foreground nil ))))
 `(hl-line ((t (:background, graym :foreground nil ))))

 ;; Buttons
 `(button ((t (:bold nil ))))
 `(custom-button-face ((t (:bold t :foreground, graym ))))

 ;; Calendar
 `(holiday-face ((t (:background, backg :foreground, grayd ))))

 ;; Dired
 `(dired-directory ((t (:bold t :foreground, foreg ))))
 `(dired-symlink ((t (:foreground, green ))))

 ;; Dired subtree
 `(dired-subtree-depth-1-face ((t :background, backg )))
 `(dired-subtree-depth-2-face ((t :background, backg )))
 `(dired-subtree-depth-3-face ((t :background, backg )))
 `(dired-subtree-depth-4-face ((t :background, backg )))
 `(dired-subtree-depth-5-face ((t :background, backg )))
 `(dired-subtree-depth-6-face ((t :background, backg )))

 ;; info, help and apropos faces
 `(info-header-node ((t (:foreground, graym ))))
 `(info-header-xref ((t (:foreground, graym ))))
 `(info-menu-5 ((t (:underline t))))
 `(info-menu-header ((t (:bold t :foreground, graym ))))
 `(info-node ((t (:bold t :foreground, graym ))))
 `(info-xref ((t (:bold t :foreground, grayd ))))

 ;; Org
 `(org-ellipsis ((t (:foreground, graym :underline nil ))))
 `(org-date-selected ((t (:foreground, red :background, backg ))))
 `(org-drawer ((t (:foreground, graym :underline nil ))))
 `(org-date ((t (:foreground, graym :underline nil ))))
 `(org-tag ((t (:bold t :foreground, graym :underline nil ))))
 `(org-code ((t (:foreground, grayl :underline nil ))))
 `(org-block ((t ( :background, backg :foreground, foreg :underline nil ))))

 `(org-headline-todo ((t (:bold, t :foreground, foreg :underline, nil ))))
 `(org-headline-done ((t (:bold, t :foreground, foreg :underline, nil ))))

 `(org-level-1 ((t (:bold, nil :foreground, foreg :underline, nil ))))
 `(org-level-2 ((t (:bold, nil :foreground, foreg :underline, nil ))))
 `(org-level-3 ((t (:bold, nil :foreground, foreg :underline, nil ))))
 `(org-level-4 ((t (:bold, nil :foreground, foreg :underline, nil ))))
 `(org-level-5 ((t (:bold, nil :foreground, foreg :underline, nil ))))
 `(org-level-6 ((t (:bold, nil :foreground, foreg :underline, nil ))))

 `(org-agenda-date-today ((t (:foreground, green :background, backg ))))
 `(org-agenda-calendar-event ((t (:foreground, red :background, backg ))))
 `(org-scheduled-previously ((t (:foreground, yellow :background, backg ))))

 ;; `(org-ellipsis ((t (:background, bg :foreground, g8 :underline nil))))

 `(header-line ((t (:background, backg :foreground, foreg ))))
 `(header-line-highlight ((t (:background, backg :foreground, foreg ))))
 `(help-key-binding ((t (:background, backg :foreground, foreg ))))

 `(org-link ((t (:bold t :foreground, green :underline nil ))))
 `(link ((t (:bold t :foreground, green :underline nil ))))

;; bookmark
 `(bookmark-face ((t (:background, backg :foreground, blue ))))
 ;; Org Agenda
 `(org-agenda-date ((t (:background, backg :foreground, foreg ))))
 `(org-agenda-date-weekend ((t (:bold, nil :background, backg :foreground, foreg ))))
 `(org-agenda-structure ((t ( :bold, t :background, backg :foreground, foreg ))))
 `(org-scheduled ((t (:background, backg :foreground, graym ))))
 `(org-scheduled-today ((t (:background, backg :foreground, foreg ))))

 ;; Avy
 `(avy-goto-char-timer-face ((t ( :bold t :background, backg :foreground, green ))))
 `(avy-background-face ((t ( :bold t :background, backg :foreground, green ))))
 `(avy-lead-face ((t ( :bold t :background, backg :foreground, green ))))
 `(avy-lead-face-0 ((t ( :bold t :background, backg :foreground, green ))))
 `(avy-lead-face-1 ((t (:bold t :background, backg :foreground, green ))))
 `(avy-lead-face-2 ((t (:bold t :background, backg :foreground, green ))))

 ;; Vertico
 `(vertico-current ((t (:background, graym :foreground,foreg))))

 ;; Consult
 `(consult-preview-match ((t (:background, backg :foreground,foreg))))
 `(consult-preview-cursor ((t (:background, backg :foreground,foreg))))

 ;; Completion
 `(completions-common-part ((t ( :foreground, green ))))
 `(completions-first-difference ((t (:bold nil :foreground, foreg ))))

 ;; tab-bar
 `(tab-bar-tab ((t (:background, backg :foreground,foreg ))))
 `(tab-bar ((t (:background, backg :foreground,foreg ))))
 `(tab-bar-tab-inactive ((t (:background, backg :foreground, graym ))))

 ;; Company
 `(company-tooltip ((t (:bold t :background, backg :foreground, graym ))))
 `(company-tooltip-selection ((t (:bold t :background, backg :foreground, foreg ))))
 `(company-tooltip-scrollbar-thumb ((t (:bold t :background, backg :foreground, backg ))))
 `(company-tooltip-scrollbar-track ((t (:bold t :background, backg :foreground, backg ))))
 `(company-tooltip-common ((t (:bold t :background, backg :foreground, green ))))
 `(company-tooltip-common-selection ((t (:bold t :background, backg :foreground, green ))))
 `(company-tooltip-annotation ((t (:bold t :foreground, graym ))))
 `(company-tooltip-annotation-selection ((t (:bold t :foreground, grayl ))))

 ;; diff-hl
 ;; `(diff-hl-add-highlighting ((t (:background, fg :foreground,g8))))
 `(diff-hl-change ((t (:background, green :foreground, green ))))
 `(diff-hl-delete ((t (:background, red :foreground, red ))))
 `(diff-hl-insert ((t (:background, magenta :foreground, magenta ))))
;; Magit
 ;; `(magit-header-line ((t (:bold t :background, bg :foreground, fg ))))
 `(magit-section-heading ((t (:bold t :background, backg :foreground, foreg ))))

 ;; Terminal
 `(vterm ((t (:background, backg :foreground, foreg ))))
 `(vterm-color-default ((t (:background, foreg :foreground, foreg ))))
 `(vterm-color-inverse-video ((t ( :background, foreg ))))
 `(vterm-color-black ((t (:background, graym :foreground, graym ))))

 `(vterm-color-red ((t ( :foreground, red ))))
 `(vterm-color-green ((t ( :foreground, green))))
 `(vterm-color-yellow ((t ( :foreground, yellow ))))
 `(vterm-color-blue ((t ( :foreground, blue ))))
 `(vterm-color-magenta ((t ( :foreground, magenta ))))
 `(vterm-color-cyan ((t ( :foreground, cyan ))))
 `(vterm-color-white ((t ( :foreground, foreg ))))
 ))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'simple)

;; Local Variables:
;; no-byte-compile: t
;; End:
