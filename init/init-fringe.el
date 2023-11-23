;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

;; TODO: Change line number width within a C source code file `src/xdisp.c`
;;       by the patch replaces the two lines of code
;;       `  pint2str (lnum_buf, it->lnum_width + 1, lnum_to_display);`
;;       `  strcat (lnum_buf, " ");`
;;       by one line of code
;;       `  pint2str (lnum_buf, it->lnum_width, lnum_to_display);`
;;       <https://emacs.stackexchange.com/questions/52269/how-to-change-line-number-gutter-width-using-display-line-numbers-mode#52271>,
;;       <https://emacs.stackexchange.com/questions/55752/change-line-number-format-with-line-number-mode#55756>.~~~~<danil@kutkevich.org>
(defun init-fringe-toggle ()
  "Toggle modes in the fringe (left margin of the window).
Toggle the `display-line-numbers-mode', `diff-hl-mode' and so on."
  (interactive)
  (cond ((or
          (and (boundp 'display-line-numbers-mode) (equal display-line-numbers-mode t))
          (and (boundp 'diff-hl-mode) (equal diff-hl-mode t)))
         (when (fboundp 'display-line-numbers-mode) (display-line-numbers-mode -1))
         (when (fboundp 'init-diff-hl-toggle) (init-diff-hl-toggle -1)))
        (t
         (when (fboundp 'display-line-numbers-mode) (display-line-numbers-mode t))
         (init-lazy
          init-lazy-seconds nil
          (lambda () (init-diff-hl-toggle t))))))

(provide 'init-fringe)
