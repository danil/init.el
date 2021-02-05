;; Set whitespace as vertical separator character symbol
;; <http://stackoverflow.com/questions/18210631/how-to-change-the-character-composing-the-emacs-vertical-border#18211568>,
;; <https://lists.gnu.org/archive/html/help-gnu-emacs/2013-01/msg00271.html>

(defun init-disp-table-vertical-border ()
  (unless standard-display-table
    (setq standard-display-table (make-display-table)))

  (set-display-table-slot standard-display-table
                          'vertical-border (make-glyph-code 32)) ;(make-glyph-code 8203) is an zero width space ; ?\u200B is an zero width space ;(make-glyph-code 32) is an blank space ;?|))
  )

(provide 'init-disp-table-vertical-border)
