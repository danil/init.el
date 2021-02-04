(defun init-dired-aux ()
  (if (boundp 'dired-mode-map) (init-dired-aux-lazy-init)
    (with-eval-after-load 'dired (init-dired-aux-lazy-init))))

(defun init-dired-aux-lazy-init ()
  (define-key dired-mode-map (kbd "C-c Q") 'init-dired-aux-do-query-replace))

(defun init-dired-aux-do-query-replace (from to &optional delimited)
  "Do `query-replace' of FROM with TO, on all marked files.
Third arg DELIMITED (prefix arg) means replace only word-delimited matches.
If you exit (\\[keyboard-quit], RET or q), you can resume the query replace
with the command \\[tags-loop-continue]."
  (interactive
   (let ((common
          (query-replace-read-args
           "Query replace in marked files" nil t)))
     (list (nth 0 common) (nth 1 common) (nth 2 common))))
  (require 'dired-aux)
  (dolist (file (dired-get-marked-files nil nil 'dired-nondirectory-p))
    (let ((buffer (get-file-buffer file)))
      (if (and buffer (with-current-buffer buffer
                        buffer-read-only))
          (error "File `%s' is visited read-only" file))))
  (init-dired-aux-tags-query-replace
   from to delimited '(dired-get-marked-files nil nil 'dired-nondirectory-p)))

(defun init-dired-aux-tags-query-replace (from to &optional delimited file-list-form)
  "Do `query-replace' of FROM with TO on all files listed in tags table.
Third arg DELIMITED (prefix arg) means replace only word-delimited matches.
If you exit (\\[keyboard-quit], RET or q), you can resume the query replace
with the command \\[tags-loop-continue].
Fourth arg FILE-LIST-FORM non-nil means initialize the replacement loop.
Fifth and sixth arguments START and END are accepted, for compatibility
with `query-replace', and ignored.

If FILE-LIST-FORM is non-nil, it is a form to evaluate to
produce the list of files to search.

See also the documentation of the variable `tags-file-name'."
  (interactive (query-replace-read-args "Tags query replace" nil t))
  (require 'etags)
  (setq tags-loop-scan `(let ,(unless (equal from (downcase from))
                                '((case-fold-search nil)))
                          (if (search-forward ',from nil t)
                              ;; When we find a match, move back
                              ;; to the beginning of it so perform-replace
                              ;; will see it.
                              (goto-char (match-beginning 0))))
        tags-loop-operate `(perform-replace ',from ',to t nil ',delimited
                                            nil multi-query-replace-map))
  (tags-loop-continue (or file-list-form t)))

(provide 'init-dired-aux)
