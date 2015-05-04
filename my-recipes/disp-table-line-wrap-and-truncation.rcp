;; Set line-wrap and line-truncation characters
;; <http://en.wikipedia.org/wiki/Arrow_(symbol)>.

(unless standard-display-table
  (setq standard-display-table (make-display-table)))

(defface my-wrap-and-truncation-glyph-face
  '((t (:background "slateblue")))
  "My custom face for the wrap glyphs.")

;; Truncation
;; <http://stackoverflow.com/questions/8370778/remove-glyph-at-end-of-truncated-lines#8371037>.
(set-display-table-slot standard-display-table
                        0
                        (make-glyph-code ?→ ;U+2192 rightwards arrow
                                         'my-wrap-and-truncation-glyph-face))

;; Wrap
;; <http://emacswiki.org/emacs/LineWrap>.
(set-display-table-slot standard-display-table
                        'wrap
                        (make-glyph-code ?← ;U+2190 leftwards arrow
                                         ;; ?↵ ;U+21B5 crarr, downwards arrow with corner, leftwards (carriage return)
                                         'my-wrap-and-truncation-glyph-face))
