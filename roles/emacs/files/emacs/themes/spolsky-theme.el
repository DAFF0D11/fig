;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; Yo
u should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;; ---------------------------
;;
;; Spolsky : A dark color theme
;;
;; ----------------------------

(unless (>= emacs-major-version 24)
  (error "requires Emacs 24 or later."))

(deftheme spolsky  "A dark color theme for Emacs based on Sublime Text 2")

(custom-theme-set-variables
  'spolsky
  '(linum-format " %7i "))

(let ((*background*         "#000000")
      (*comments*           "#454558")
      (*constant*           "#bc84df")
      (*current-line*       "#1c1c21")
      (*cursor-underscore*  "#e1e2e5")
      (*keywords*           "#E93C58")

      ;; Sidebar line numbers
      (*line-number*        "#000000")
      (*line-fg*            "#a2a5b5")

      (*type-face*          "#66D9EF")
      (*method-declaration* "#1ef1a4")
      (*mode-line-bg*       "#000000")
      (*mode-inactive-bg*   "#000000")
      (*mode-line-fg*       "#e1e2e5")
      (*mode-inactive-fg*   "#454558")
      (*normal*             "#e1e2e5")
      (*number*             "#ffaf87")
      (*operators*          "#ffaf87")
      (*warning*            "#FF6C60")
      (*regexp*             "#1ef1a4")
      (*string*             "#a2a5b5")
      (*variable*           "#b4baeb")
      (*daffod*             "#DAFF0D")
      (*visual-selection*   "#1c1c21"))

  (custom-theme-set-faces
   'spolsky

   `(bold ((t (:bold t))))
   `(button ((t (:foreground, *keywords* :underline t))))
   `(default ((t (:background, *background* :foreground, *normal*))))
   `(header-line ((t (:background, *mode-line-bg* :foreground, *normal*)))) ;; info header
   `(highlight ((t (:background, *current-line*))))
   `(highlight-face ((t (:background, *current-line*))))
   `(hl-line ((t (:background, *current-line* :underline t))))
   `(info-xref ((t (:foreground, *keywords* :underline t))))
   `(region ((t (:background, *visual-selection*))))
   `(underline ((nil (:underline t))))

   ;; font-lock
   `(font-lock-builtin-face ((t (:foreground, *operators*))))
   `(font-lock-comment-delimiter-face ((t (:foreground, *comments*))))
   `(font-lock-comment-face ((t (:foreground, *comments*))))
   `(font-lock-constant-face ((t (:foreground, *constant*))))
   `(font-lock-doc-face ((t (:foreground, *string*))))
   `(font-lock-doc-string-face ((t (:foreground, *string*))))
   `(font-lock-function-name-face ((t (:foreground, *method-declaration*))))
   `(font-lock-keyword-face ((t (:foreground, *keywords*))))
   `(font-lock-negation-char-face ((t (:foreground, *warning*))))
   `(font-lock-number-face ((t (:foreground, *number*))))
   `(font-lock-preprocessor-face ((t (:foreground, *keywords*))))
   `(font-lock-reference-face ((t (:foreground, *constant*))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground, *regexp*))))
   `(font-lock-regexp-grouping-construct ((t (:foreground, *regexp*))))
   `(font-lock-string-face ((t (:foreground, *string*))))
   `(font-lock-type-face ((t (:foreground, *type-face*))))
   `(font-lock-variable-name-face ((t (:foreground, *variable*))))
   `(font-lock-warning-face ((t (:foreground, *warning*))))

   ;; GUI
   `(fringe ((t (:background, *background*))))
   `(linum ((t (:background, *line-number* :foreground, *line-fg*))))
   `(minibuffer-prompt ((t (:foreground, *variable*))))
   `(mode-line ((t (:background, *mode-line-bg* :foreground, *mode-line-fg*))))
   `(mode-line-inactive ((t (:background, *mode-inactive-bg* :foreground, *mode-inactive-fg*))))
   `(cursor ((t (:background, *cursor-underscore*))))
   `(text-cursor ((t (:background, *cursor-underscore*))))
   `(vertical-border ((t (:background, *background* :foreground, *comments*)))) ;; between splits

   ;; show-paren
   `(show-paren-mismatch ((t (:background, *warning* :foreground, *normal* :weight bold))))
   `(show-paren-match ((t (:background, *keywords* :foreground, *normal* :weight bold))))
   ;; org-mode
   `(org-ellipsis ((t (:foreground, *comments* :underline nil :weight bold))))

   ;; search
   `(isearch ((t (:background, *regexp* :foreground, *visual-selection*))))
   `(isearch-fail ((t (:background, *warning*))))
   `(lazy-highlight ((t (:background, *operators* :foreground, *visual-selection*))))

  ;; TERM
   `(vterm ((t (:background, *background* :foreground,*normal* ))))
   `(vterm-color-default ((t (:background, *normal* :foreground, *normal* ))))
   `(vterm-color-inverse-video ((t ( :background, *normal* ))))
   `(vterm-color-black ((t (:background, *line-fg* :foreground, *line-fg* ))))
   `(vterm-color-red ((t ( :foreground, *keywords* ))))
   `(vterm-color-green ((t ( :foreground, *method-declaration*))))
   `(vterm-color-yellow ((t ( :foreground,*number* ))))
   `(vterm-color-blue ((t ( :foreground, *line-fg* ))))
   `(vterm-color-magenta ((t ( :foreground, *operators* ))))
   `(vterm-color-cyan ((t ( :foreground, *type-face* ))))
   `(vterm-color-white ((t ( :foreground, *normal* ))))

    ;; Company
   `(company-tooltip ((t (:background, *background* :foreground, *string* ))))
   `(company-tooltip-selection ((t (:background, *background* :foreground, *normal* ))))
   `(company-tooltip-common ((t (:background, *background* :foreground, *regexp* ))))

   ;; fancy-narrow
   ;; `(fancy-narrow-blocked-face ((t (:background, background :foreground,inv ))))

   ;; tab-bar
   `(tab-bar-tab ((t (:background, *background* :foreground,*normal* ))))
   `(tab-bar ((t (:background, *background* :foreground,*string* ))))
   `(tab-bar-tab-inactive ((t (:background, *background* :foreground,*comments* ))))

   ;; Avy
   `(avy-lead-face ((t (:background, *background* :foreground, *daffod* ))))
   `(avy-lead-face-0 ((t (:background,*background* :foreground, *daffod* ))))
   `(avy-lead-face-1 ((t (:background, *background* :foreground, *daffod* ))))
   `(avy-lead-face-2 ((t (:background, *background* :foreground, *daffod* ))))

    ;; diff-hl
   ;; `(diff-hl-add-highlighting ((t (:background, *string* :foreground,*comments* ))))
   `(diff-hl-change ((t (:background, *regexp* :foreground, *regexp* ))))
   `(diff-hl-delete ((t (:background, *warning* :foreground, *warning* ))))
   `(diff-hl-insert ((t (:background, *operators* :foreground, *operators* ))))

   ;; dired subtree
   `(dired-subtree-depth-1-face ((t (:background, *background* :foreground, *regexp* ))))
   `(dired-subtree-depth-2-face ((t (:background, *background* :foreground, *regexp* ))))
   `(dired-subtree-depth-3-face ((t (:background, *background* :foreground, *regexp* ))))
   `(dired-subtree-depth-4-face ((t (:background, *background* :foreground, *regexp* ))))
   `(dired-subtree-depth-5-face ((t (:background, *background* :foreground, *regexp* ))))

    ;; magit
   `(magit-section-heading ((t (:background, *background* :foreground, *constant* ))))
   `(magit-section-highlight ((t (:background, *background* :foreground, *keywords* ))))
   `(magit-branch-remote ((t (:background, *background* :foreground, *number* ))))

   ;; `(magit-diff-highlight-heading ((t (:background, *background* :foreground, *number* ))))
   ;; `(magit-diff-context-highlight ((t (:background, *background* :foreground, *number* ))))
   `(magit-diff-added-highlight ((t (:background, *regexp* :foreground, *background* ))))
   ;; `(magit-diff-removed-highlight ((t (:background, *background* :foreground, *number* ))))

   ))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'spolsky)

;; Local Variables:
;; no-byte-compile: t
;; End:
