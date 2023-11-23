;;; TODO: Move this recipe file to init!!!~~~~<danil@kutkevich.org>

(add-hook 'after-init-hook 'noxrcp-my-sort)

(defun noxrcp-my-sort ()
  "No X recipe init."

  (define-key noxel-map (kbd "C-x S c") 'my-sort-chars)
  (define-key noxel-map (kbd "C-x S s") 'my-sort-symbols)
  (define-key noxel-map (kbd "C-x S w") 'my-sort-words))

(defun my-sort-chars (reverse beg end)
  "Sort chars alphabetically in region (in `REVERSE' if negative)
Sort between `BEG' and `END'.
Prefixed with negative \\[universal-argument], sorts in reverse.

The variable `sort-fold-case' determines whether alphabetic case
affects the sort order.

See `sort-regexp-fields'."

      (interactive "*P\nr")
      (sort-regexp-fields reverse "." "\\&" beg end))

(defun my-sort-symbols (reverse beg end)
  "Sort symbols alphabetically in region (in `REVERSE' if negative)
Sort between `BEG' and `END'.
Prefixed with negative \\[universal-argument], sorts in reverse.
See `sort-words'."

      (interactive "*P\nr")
      (sort-regexp-fields reverse "\\(\\sw\\|\\s_\\)+" "\\&" beg end))

(defun my-sort-words (reverse beg end)
  "Sort words alphabetically in region (in `REVERSE' if negative).
Sort between `BEG' and `END'.
Prefixed with negative \\[universal-argument], sorts in reverse.

The variable `sort-fold-case' determines whether alphabetic case
affects the sort order.

See `sort-regexp-fields'."

      (interactive "*P\nr")
      (sort-regexp-fields reverse "\\w+" "\\&" beg end))

;;; init-my-sort.el ends here
