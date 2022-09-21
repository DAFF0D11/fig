;; med-theme.el --- A minimalistic custom theme for Emacs
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

;; (normal             "#e1e2e5")
;; (current-line       "#a2a5b5")
;; (mode-inactive-fg   "#454558")
;; (comments           "#454558")
;; (constant           "#bc84df")
;; (keywords           "#E93C58")
;; (line-number        "#061A1F")
;; (method-declaration "#bc84df")
;; (number             "#ffaf87")
;; (operators          "#ffaf87")
;; (warning            "#FF6C60")
;; (regexp             "#1ef1a4")
;; (string             "#a2a5b5")
;; (vc-modified        "#ffaf87")
;; (vc-added           "#1ef1a4")
;; (vc-deleted         "#E93C58")
;; (variable           "#b4baeb")
;; (inv                "#101014")
;; (visual-selection   "#1c1c21"))

(deftheme light
  "A minimalistic and mostly monochromatic color scheme inspired
by `color-theme-late-night' and the Light is Light theme for vim.")

(let (
       (black "#000000") ;; #000000
       (white "#ffffff") ;; #ffffff
       (bg  "#e0e1e4") ;; #000000
       (fg  "#1c1a27") ;; #ffffff
       ;; (cr  "#DAFF0D")
       (cr  "#E93C58")
       (c0  "#21222c")
       (c1  "#E93C58")
       (c2  "#1acc88")
       (c3  "#cb9865")
       (c4  "#bc84df")
       (c5  "#d866a9")
       (c6  "#b4baeb")
       (c7  "#e1e2e5")
       (c8  "#4f5cb3")
       (c9  "#ff6e6e")
       (c10 "#69ff94")
       (c11 "#ffffa5")
       (c12 "#d6acff")
       (c13 "#ff92df")
       (c14 "#a4ffff")
       (c15 "#ffffff")
       (g1  "#dadada")
       (g2  "#e1e2e5")
       (g8  "#818184")
       (g11 "#dadada")
       (g3  "#999999")
       (g4  "#888888")
       (g5  "#0c0c10")
       (g6  "#cecfd3")
       (g7  "#d9dce7")
       (g9  "#232533")
       (g10 "#111111")
       (g12 "#b6b6b9") ;; comments
       )

(custom-theme-set-faces
 'light

 ;; Standard font lock faces
 `(default ((t (:background, bg :foreground, fg))))
 `(bold ((t (:bold t))))
 `(italic ((t (:bold, nil))))
 `(underline ((t (:bold, nil))))
 `(variable-pitch ((t (nil))))
 `(cursor ((t (:background, cr))))
 `(font-lock-comment-face ((t (:bold t :foreground, g12))))
 `(font-lock-comment-delimiter-face ((t (:foreground, g12))))
 `(font-lock-doc-string-face ((t (:foreground, c1))))
 `(font-lock-string-face ((t (:foreground, c1))))
 `(font-lock-function-name-face ((t (:foreground, c8))))
 `(font-lock-variable-name-face ((t (:foreground, fg))))
 `(font-lock-constant-face ((t (:foreground, fg))))
 `(font-lock-doc-face ((t (:foreground, fg))))
 `(font-lock-preprocessor-face ((t (:foreground, fg))))
 `(font-lock-reference-face ((t (:foreground, fg))))
 `(font-lock-type-face    ((t (:bold, nil :foreground, fg))))
 `(font-lock-builtin-face ((t (:bold, t :foreground, fg))))
 `(font-lock-keyword-face ((t (:bold, t :foreground, fg))))
 `(font-lock-warning-face ((t (:bold, t :foreground, c1))))

 ;; Emacs Interface
 `(fringe ((t (:background, bg :foreground, bg))))
 `(header-line ((t (:background, g8 :foreground, bg))))
 `(menu ((t (:background, g10 :foreground, g7))))
 `(minibuffer-prompt ((t (:foreground, fg))))
 `(region ((t (:background, g9 :foreground, bg))))
 `(secondary-selection ((t (:background, bg :foreground, fg))))
 `(tool-bar ((t (:background, g10 :foreground, g6))))
 `(tooltip ((t (:background, g8 :foreground, g6))))
 `(widget-button-face ((t (:bold t :foreground, g4))))
 `(widget-field-face ((t (:bold t :foreground, g4))))

 `(mode-line ((t (:background, bg :foreground, fg))))
 `(mode-line-inactive ((t (:background, bg :foreground, g8))))

 ;; Search
 `(isearch ((t (:foreground, bg :background, cr))))
 `(isearch-lazy-highlight-face ((t (:foreground, cr))))
 `(lazy-highlight ((t (:foreground, bg :background, cr))))

 ;; Parenthesis matching
 `(show-paren-match-face ((t (:foreground, bg :background, g1))))
 `(show-paren-mismatch-face ((t (:foreground, bg :background, c1))))

 ;; Pair
 `(sp-pair-overlay-face ((t (:foreground, c1 :background, bg))))

 ;; Line highlighting
 `(highlight ((t (:background, g6 :foreground, nil))))
 `(highlight-current-line-face ((t (:background, g6 :foreground, nil))))
 `(hl-line ((t (:background, g6 :foreground, fg))))

 ;; Buttons
 `(button ((t (:bold t))))
 `(custom-button-face ((t (:bold t :foreground, g4))))

 ;; Calendar
 `(holiday-face ((t (:background, bg :foreground, g5))))

 ;; Dired
 `(dired-directory ((t (:bold t :foreground, fg))))
 `(dired-symlink ((t (:foreground, cr))))

 ;; Dired subtree
 `(dired-subtree-depth-1-face ((t :background, bg )))
 `(dired-subtree-depth-2-face ((t :background, bg )))
 `(dired-subtree-depth-3-face ((t :background, bg )))
 `(dired-subtree-depth-4-face ((t :background, bg )))
 `(dired-subtree-depth-5-face ((t :background, bg )))
 `(dired-subtree-depth-6-face ((t :background, bg )))

 ;; info, help and apropos faces
 `(info-header-node ((t (:foreground,g6))))
 `(info-header-xref ((t (:foreground,g6))))
 `(info-menu-5 ((t (:underline, t))))
 `(info-menu-header ((t (:bold, t :foreground,g6))))
 `(info-node ((t (:bold, t :foreground, g4))))
 `(info-xref ((t (:bold, t :foreground, g5))))

 ;; Org
 `(org-ellipsis ((t (:foreground, g8 :underline, nil))))
 `(org-date-selected ((t (:foreground, c1 :background, bg))))
 `(org-drawer ((t (:foreground, g8 :underline, nil))))
 `(org-date ((t (:foreground, g8 :underline, nil))))
 `(org-tag ((t (:bold, t :foreground, g8 :underline, nil))))
 `(org-table ((t (:bold, nil :foreground, fg :underline, nil))))
 `(org-code ((t (:foreground, fg :underline, nil))))
 `(org-headline-todo ((t (:bold, t :foreground, fg :underline, nil))))
 `(org-headline-done ((t (:bold, t :foreground, fg :underline, nil))))

 `(org-verbatim ((t (:foreground, fg :underline nil))))
 `(org-block ((t (:background, g1 :foreground, fg :underline nil))))
 `(org-block-end-line ((t (:bold, nil :foreground, g12 :underline nil))))
 `(org-block-begin-line ((t (:bold, nil :foreground, g12 :underline nil))))


 `(org-level-1 ((t (:bold, t :foreground, fg :underline, nil))))
 `(org-level-2 ((t (:bold, t :foreground, fg :underline, nil))))
 `(org-level-3 ((t (:bold, t :foreground, fg :underline, nil))))
 `(org-level-4 ((t (:bold, t :foreground, fg :underline, nil))))
 `(org-level-5 ((t (:bold, t :foreground, fg :underline, nil))))
 `(org-level-6 ((t (:bold, t :foreground, fg :underline, nil))))

 `(org-agenda-date-today ((t (:foreground, c2 :background, bg))))
 `(org-agenda-calendar-event ((t (:foreground, c1 :background, bg))))
 `(org-scheduled-previously ((t (:foreground, c3 :background, bg))))

 ;; `(org-ellipsis ((t (:background, bg :foreground, g8 :underline nil))))

 `(header-line ((t (:background, bg :foreground, fg))))
 `(header-line-highlight ((t (:background, bg :foreground, fg))))
 `(help-key-binding ((t (:background, bg :foreground, fg))))

 `(org-link ((t (:bold, nil :foreground, cr :underline nil))))
 `(link ((t (:bold, nil :foreground, cr :underline nil))))

;; bookmark
 `(bookmark-face ((t (:background, bg :foreground, c6))))
 ;; Org Agenda
 `(org-agenda-date ((t (:background, bg :foreground, fg))))
 `(org-agenda-date-weekend ((t (:bold, nil :background, bg :foreground, fg))))
 `(org-agenda-structure ((t ( :bold, t :background, bg :foreground, fg))))
 `(org-scheduled ((t (:background, bg :foreground, g8))))
 `(org-scheduled-today ((t (:background, bg :foreground, fg))))

 ;; Avy
 `(avy-goto-char-timer-face ((t ( :bold t :background, bg :foreground, cr ))))
 `(avy-background-face ((t ( :bold t :background, bg :foreground, cr ))))
 `(avy-lead-face ((t ( :bold t :background, bg :foreground, cr ))))
 `(avy-lead-face-0 ((t ( :bold t :background, bg :foreground, cr ))))
 `(avy-lead-face-1 ((t (:bold t :background, bg :foreground, cr ))))
 `(avy-lead-face-2 ((t (:bold t :background, bg :foreground, cr ))))

 ;; Vertico
 `(vertico-current ((t (:background, g6 :foreground,fg))))

 ;; Consult
 `(consult-preview-match ((t (:background, bg :foreground,fg))))
 `(consult-preview-cursor ((t (:background, bg :foreground,fg))))

 ;; Completion
 `(completions-common-part ((t ( :foreground, cr ))))
 `(completions-first-difference ((t (:bold nil :foreground, fg ))))

 ;; tab-bar
 `(tab-bar-tab ((t (:background, bg :foreground,fg ))))
 `(tab-bar ((t (:background, bg :foreground,fg ))))
 `(tab-bar-tab-inactive ((t (:background,bg :foreground, g8 ))))

 ;; Company
 `(company-tooltip ((t (:bold t :background, bg :foreground, g12 ))))
 `(company-tooltip-selection ((t (:bold t :background, bg :foreground, fg ))))
 `(company-tooltip-scrollbar-thumb ((t (:bold t :background, bg :foreground, bg ))))
 `(company-tooltip-scrollbar-track ((t (:bold t :background, bg :foreground, bg ))))
 `(company-tooltip-common ((t (:bold t :background, bg :foreground, cr ))))
 `(company-tooltip-common-selection ((t (:bold t :background, bg :foreground, cr ))))
 `(company-tooltip-annotation ((t (:bold t :foreground, g12 ))))
 `(company-tooltip-annotation-selection ((t (:bold t :foreground, g12 ))))

 ;; diff-hl
 ;; `(diff-hl-add-highlighting ((t (:background, fg :foreground,g8))))
 `(diff-hl-change ((t (:background, c2 :foreground, c2 ))))
 `(diff-hl-delete ((t (:background, c1 :foreground, c1 ))))
 `(diff-hl-insert ((t (:background, c4 :foreground, c4 ))))
;; Magit
 ;; `(magit-header-line ((t (:bold t :background, bg :foreground, fg ))))
 `(magit-section-heading ((t (:bold t :background, bg :foreground, fg ))))

 ;; Terminal
 `(vterm ((t (:background, bg :foreground, fg ))))
 `(vterm-color-default ((t (:background, fg :foreground, fg ))))
 `(vterm-color-inverse-video ((t ( :background, fg ))))
 `(vterm-color-black ((t (:background, g8 :foreground, g8 ))))
 `(vterm-color-red ((t ( :foreground, c1 ))))
 `(vterm-color-green ((t ( :foreground, c2))))
 `(vterm-color-yellow ((t ( :foreground, c3 ))))
 `(vterm-color-blue ((t ( :foreground, c8 ))))
 `(vterm-color-magenta ((t ( :foreground, c5 ))))
 `(vterm-color-cyan ((t ( :foreground, c6 ))))
 `(vterm-color-white ((t ( :foreground, fg ))))
 ))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'light)

;; Local Variables:
;; no-byte-compile: t
;; End:
