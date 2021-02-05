;; Set line-wrap and line-truncation characters
;; <http://en.wikipedia.org/wiki/Arrow_(symbol)>.

(defgroup init-disp-table-line-wrap-and-truncation nil
  "init-disp-table-line-wrap-and-truncation"
  :group  'editing
  :tag    "init-disp-table-line-wrap-and-truncation"
  :prefix "init-disp-table-line-wrap-and-truncation-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defface init-truncation-glyph-face '((t (:background "orchid3"))) "init-disp-table-line-wrap-and-truncation" :group 'init-disp-table-line-wrap-and-truncation)
(defface init-wrap-glyph-face '((t (:background "limegreen"))) "init-disp-table-line-wrap-and-truncation" :group 'init-disp-table-line-wrap-and-truncation)

(defun init-disp-table-line-wrap-and-truncation ()
  (unless standard-display-table
    (setq standard-display-table (make-display-table)))

  ;; Truncation
  ;; <http://stackoverflow.com/questions/8370778/remove-glyph-at-end-of-truncated-lines#8371037>.
  (set-display-table-slot standard-display-table
                          0
                          (make-glyph-code ?\u0020 ;· \u00B7 dot ;→ U+2192 rightwards arrow
                                           'init-truncation-glyph-face))

  ;; Wrap
  ;; <http://emacswiki.org/emacs/LineWrap>.
  (set-display-table-slot standard-display-table
                          'wrap
                          (make-glyph-code ?\u0020 ;· \u00B7 dot ;← U+2190 leftwards arrow
                                           ;; ?↵ ;U+21B5 crarr, downwards arrow with corner, leftwards (carriage return)
                                           'init-wrap-glyph-face)))

(provide 'init-disp-table-line-wrap-and-truncation)
