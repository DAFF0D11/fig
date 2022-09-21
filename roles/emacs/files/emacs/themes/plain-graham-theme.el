;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;; ---------------------------
;;
;; Graham: A dark color theme
;;
;; static const char *colorname[] = {
;;         "#000000",  /* black   0 */
;; 	"#d5535e",  /* red     1 */
;; 	"#1ef1a4",  /* green   2 */
;; 	"#ffaf87",  /* yellow  3 */
;; 	"#8b929f",  /* blue    4 */
;; 	"#af5fd7",  /* magenta 5 */
;; 	"#b4baeb",  /* cyan    6 */
;; 	"#f8f8f8",  /* white   7 */
;; 	"#454558",  /* black   8 */ //comments
;; 	"#e46082",  /* red     9 */
;; 	"#1ef1a4",  /* green   10*/
;; 	"#ffe958",  /* yellow  11*/
;; 	"#a4aebd",  /* blue    12*/ // blue: let var const 
;; 	"#bc84df",  /* magenta 13*/
;; 	"#b9bede",  /* cyan    14*/
;; 	"#9094a5",  /* white   15*/
;; 	[255] = 0,
;; 	/* more colors can be added after 255 to use with DefaultXX */
; 	"#dddddd", /* 256 -> cursor */
;; 	"#555555", /* 257 -> rev cursor*/
;; 	"#000000", /* 258 -> bg */
;; 	"#dddddd", /* 259 -> fg */
;; 	"black",
;; }
                                        ;
;; ----------------------------

(unless (>= emacs-major-version 24)
  (error "requires Emacs 24 or later."))

(deftheme plain-graham "A dark color theme for Emacs")


(let ((background         "#000000")
      (comments           "#454558")
      (constant           "#ffffff")
      (current-line       "#ffffff")
      (cursor-underscore  "#FFFFFF")
      (keywords           "#d5535e")
      (line-number        "#061A1F")
      (method-declaration "#ffffff")
      (mode-line-bg       "#000000")
      (mode-inactive-bg   "#000000")
      (mode-line-fg       "#FFFFFF")
      (mode-inactive-fg   "#454558")
      (normal             "#f2f2f5")
      (number             "#ffffff")
      (operators          "#ffffff")
      (warning            "#ffffff")
      (regexp             "#ffffff")
      (string             "#ffffff")
      (vc-modified        "#ffffff")
      (vc-added           "#ffffff")
      (vc-deleted         "#ffffff")
      (variable           "#ffffff")
      (visual-selection   "#484959"))


  (custom-theme-set-faces
   'plain-graham

   ;; `(bold ((0 (:bold 0))))
   `(button ((t (:foreground, keywords :underline t))))
   `(default ((t (:background, background :foreground, normal))))
   `(header-line ((t (:background, mode-line-bg :foreground, normal)))) ;; info header
   `(highlight ((t (:background, current-line))))
   `(highlight-face ((t (:background, current-line))))
   `(hl-line ((t (:background, current-line :underline t))))
   `(info-xref ((t (:foreground, keywords :underline t))))
   `(region ((t (:background, visual-selection))))
   `(underline ((nil (:underline t))))

   ;; font-lock
   `(font-lock-builtin-face ((t (:foreground, operators))))
   `(font-lock-comment-delimiter-face ((t (:foreground, comments))))
   `(font-lock-comment-face ((t (:foreground, comments))))
   `(font-lock-constant-face ((t (:foreground, constant))))
   `(font-lock-doc-face ((t (:foreground, string))))
   `(font-lock-doc-string-face ((t (:foreground, string))))
   `(font-lock-function-name-face ((t (:foreground, method-declaration))))
   `(font-lock-keyword-face ((t (:foreground, keywords))))
   `(font-lock-negation-char-face ((t (:foreground, warning))))
   `(font-lock-number-face ((t (:foreground, number))))
   `(font-lock-preprocessor-face ((t (:foreground, keywords))))
   `(font-lock-reference-face ((t (:foreground, constant))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground, regexp))))
   `(font-lock-regexp-grouping-construct ((t (:foreground, regexp))))
   `(font-lock-string-face ((t (:foreground, string))))
   `(font-lock-type-face ((t (:foreground, operators))))
   `(font-lock-variable-name-face ((t (:foreground, variable))))
   `(font-lock-warning-face ((t (:foreground, warning))))

   ;; GUI
   `(fringe ((t (:background, background))))
   `(line-number ((t (:foreground, mode-inactive-fg))))
   `(line-number-current-line ((t (:foreground, normal))))
   `(minibuffer-prompt ((t (:foreground, variable))))
   `(mode-line ((t (:background, mode-line-bg :foreground, mode-line-fg))))
   `(mode-line-inactive ((t (:background, mode-inactive-bg :foreground, mode-inactive-fg))))
   `(cursor ((t ( :foreground, normal :background, cursor-underscore))))
   `(text-cursor ((t (:background, cursor-underscore))))
   `(vertical-border ((t ( :foreground, comments)))) ;; between splits
   `(window-divider-first-pixel ((t ( :background, background :foreground, background)))) ;; between splits
   `(window-divider-last-pixel((t ( :background, background :foreground, comments)))) ;; between splits
   `(window-divider ((t ( :background, background :foreground, background)))) ;; between splits

   ;; show-paren
   `(show-paren-mismatch ((t (:background, warning :foreground, normal :weight bold))))
   `(show-paren-match ((t (:background, keywords :foreground, normal :weight bold))))

  ;; EMMS 
   `(emms-playlist-track-face ((t (:background, background :foreground,string ))))
   `(emms-playlist-selected-face ((t (:background, background :foreground,number ))))
   ;; search
   `(isearch ((t (:background, regexp :foreground, visual-selection))))
   `(isearch-fail ((t (:background, warning))))
   `(lazy-highlight ((t (:background, operators :foreground, visual-selection))))
    ;; Company
   `(company-tooltip ((t (:background, background :foreground,normal ))))
   `(company-tooltip-annotation-selection ((t (:background, normal :foreground,keywords ))))
   `(company-tooltip-common ((t (:background, background :foreground,string ))))
   `(company-tooltip-selection ((t (:background, background :foreground,keywords ))))
   `(company-scrollbar-fg ((t (:background, comments ))))
   `(company-scrollbar-bg ((t (:background, background ))))
   `(company-tooltip-annotation ((t (:background, background :foreground, number ))))
   `(company-tooltip-annotation-selection ((t (:background, normal :foreground, keywords ))))
    ;;;; company
    ;; (company-tooltip            :inherit 'tooltip)
    ;; (company-tooltip-common                           :foreground highlight :distant-foreground base0 :weight 'bold)
    ;; (company-tooltip-search     :background highlight :foreground bg :distant-foreground fg :weight 'bold)
    ;; (company-tooltip-search-selection :background (doom-darken selection 0.25))
    ;; (company-tooltip-selection  :background selection :weight 'bold)
    ;; (company-tooltip-mouse      :background magenta   :foreground bg :distant-foreground fg)
    ;; (company-tooltip-annotation                       :foreground violet :distant-foreground bg)
    ;; (company-scrollbar-bg       :inherit 'tooltip)
    ;; (company-scrollbar-fg       :background highlight)
    ;; (company-preview                              :foreground comments)
    ;; (company-preview-common     :background base3 :foreground highlight)
    ;; (company-preview-search     :inherit 'company-tooltip-search)
    ;; (company-template-field     :inherit 'match)
   
  ;; TERM 

   `(vterm ((t (:background, normal :foreground,normal ))))
   `(vterm-color-default ((t (:background, normal :foreground,normal ))))
   `(vterm-color-inverse-video ((t ( :background,normal ))))
   `(vterm-color-black ((t (:background, string :foreground,normal ))))
   `(vterm-color-red ((t ( :foreground,keywords ))))
   `(vterm-color-green ((t ( :foreground,regexp ))))
   `(vterm-color-yellow ((t ( :foreground,number ))))
   `(vterm-color-blue ((t ( :foreground,string ))))
   `(vterm-color-magenta ((t ( :foreground,constant ))))
   `(vterm-color-cyan ((t ( :foreground,variable ))))
   `(vterm-color-white ((t ( :foreground,normal ))))
   
   ;; Tab-bar
   `(tab-bar-tab ((t (:background, background :foreground,normal ))))
   `(tab-bar ((t (:background, background :foreground,string ))))
   `(tab-bar-tab-inactive ((t (:background, background :foreground,comments ))))

    ;; magit
    ;; https://magit.vc/manual/magit/Theming-Faces.html
   `(magit-section-heading ((t (:background, background :foreground,constant ))))
   `(magit-section-highlight ((t (:background, background :foreground,keywords ))))
   `(magit-branch-remote ((t (:background, background :foreground,number ))))

    ;; this works but will be a lot of work to change all the defaults
   ;; `(magit-diff-added-highlight ((t (:background,vc-added :foreground,normal ))))

   ))


;; (set-face-background 'vertical-border "black")
;; (set-face-foreground 'vertical-border (face-background 'vertical-border))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))


(provide-theme 'plain-graham)

;; Local Variables:
;; no-byte-compile: t
;; End:

