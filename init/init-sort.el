;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defgroup init-sort nil
  "init-sort"
  :group  'editing
  :tag    "init-sort"
  :prefix "init-sort-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defun init-sort-chars (reverse beg end)
  "Sort chars alphabetically in region (in `REVERSE' if negative)
Sort between `BEG' and `END'.
Prefixed with negative \\[universal-argument], sorts in reverse.

The variable `sort-fold-case' determines whether alphabetic case
affects the sort order.

See `sort-regexp-fields'."

      (interactive "*P\nr")
      (sort-regexp-fields reverse "." "\\&" beg end))

(defun init-sort-symbols (reverse beg end)
  "Sort symbols alphabetically in region (in `REVERSE' if negative)
Sort between `BEG' and `END'.
Prefixed with negative \\[universal-argument], sorts in reverse.
See `sort-words'."

      (interactive "*P\nr")
      (sort-regexp-fields reverse "\\(\\sw\\|\\s_\\)+" "\\&" beg end))

(defun init-sort-words (reverse beg end)
  "Sort words alphabetically in region (in `REVERSE' if negative).
Sort between `BEG' and `END'.
Prefixed with negative \\[universal-argument], sorts in reverse.

The variable `sort-fold-case' determines whether alphabetic case
affects the sort order.

See `sort-regexp-fields'."

      (interactive "*P\nr")
      (sort-regexp-fields reverse "\\w+" "\\&" beg end))

(provide 'init-sort)
