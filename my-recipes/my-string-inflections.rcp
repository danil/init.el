(my-after-init
  (global-set-key (my-kbd "s i i") 'my-toggle-camelcase-and-underscore-with-repeat)
  (global-set-key (my-kbd "s i h") 'my-humanize-symbol-with-repeat))

;;; CamleCase and underscore inflection toggle
;;; <http://superuser.com/questions/126431/is-there-any-way-to-convert-camel-cased-names-to-use-underscores-in-emacs/126473#300048>,
;;; <https://bunkus.org/blog/2009/12/switching-identifier-naming-style-between-camel-case-and-c-style-in-emacs>,
;;; <http://api.rubyonrails.org/classes/ActiveSupport/Inflector.html>.
(defun my-toggle-camelcase-and-underscore-with-repeat ()
  (interactive)
  (my-with-repeat-while-press-last-key
    (my-toggle-camelcase-and-underscore)))
(defun my-toggle-camelcase-and-underscore ()
  "Toggles the symbol at point between C-style naming,
e.g. `hello_world_string', and camel case,
e.g. `HelloWorldString'."
  (interactive)
  (let* ((symbol-pos (bounds-of-thing-at-point 'symbol))
         case-fold-search symbol-at-point cstyle regexp func)
    (unless symbol-pos
      (error "No symbol at point"))
    (save-excursion
      (narrow-to-region (car symbol-pos) (cdr symbol-pos))
      (setq cstyle (string-match-p "_" (buffer-string))
            regexp (if cstyle "\\(?:\\_<\\|_\\)\\(\\w\\)" "\\([A-Z]\\)")
            func (if cstyle
                     'capitalize
                   (lambda (s)
                     (concat (if (= (match-beginning 1)
                                    (car symbol-pos))
                                 ""
                               "_")
                             (downcase s)))))
      (goto-char (point-min))
      (while (re-search-forward regexp nil t)
        (replace-match (funcall func (match-string 1))
                       t nil))
      (widen))))

(defun my-humanize-symbol-with-repeat ()
  (interactive)
  (my-with-repeat-while-press-last-key
    (my-humanize-symbol)))
(defun my-humanize-symbol ()
  "Humanize the symbol at point from
C-style naming, e.g. `hello_world_string',
and camel case, e.g. `HelloWorldString',
and Lisp-style nameing, e.g. `hello-world-string'."
  (interactive)
  (let* ((symbol-pos (bounds-of-thing-at-point 'symbol))
         case-fold-search symbol-at-point cstyle regexp func)
    (unless symbol-pos
      (error "No symbol at point"))
    (save-excursion
      (narrow-to-region (car symbol-pos) (cdr symbol-pos))
      (setq cstyle (string-match-p "_" (buffer-string))
            lisp-style (string-match-p "-" (buffer-string))
            regexp (cond (cstyle "\\(?:\\_<\\|_\\)\\(\\w\\)")
                         (lisp-style "\\(?:\\-<\\|-\\)\\(\\w\\)")
                         (t "\\([A-Z]\\)"))
            func (lambda (s)
                     (concat (if (= (match-beginning 1)
                                    (car symbol-pos))
                                 ""
                               " ")
                             (downcase s))))
      (goto-char (point-min))
      (while (re-search-forward regexp nil t)
        (replace-match (funcall func (match-string 1))
                       t nil))
      (widen))))
