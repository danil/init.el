;;; init-ruby-mode.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2018 Danil <danil@kutkevich.org>.
;; Author: Danil <danil@kutkevich.org>
;; Maintainer: Danil <danil@kutkevich.org>
;; URL: https://github.com/danil/init.el

;;; Commentary:

;; Please see README.md for documentation.

;;; License:

;; This file is not part of GNU Emacs.
;; However, it is distributed under the same license.

;; GNU Emacs is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

(defcustom myinit-ruby-mode-patterns '()
  "Regexp patterns associated with `ruby-mode'."
  :group 'myinit)

(custom-set-variables
 '(myinit-ruby-mode-patterns
   '(
     "/Capfile\\'"
     "/Gemfile\\'"
     "/Guardfile\\.private.example\\'"
     "/Guardfile\\.private\\'"
     "/Guardfile\\'"
     "/[rR]akefile\\'"
     "/[vV]agrantfile.proxy\\'"
     "/[vV]agrantfile\\'"
     "\\.atex\\'"
     "\\.gemspec\\'"
     "\\.irbrc\\'"
     "\\.mdlrc\\'"
     "\\.prawn\\'"
     "\\.rake\\'"
     "\\.rb\\.erb\\'"
     "\\.thor\\'"
     "\\.yml\\.erb\\'"
     ))
 '(ruby-encoding-magic-comment-style 'ruby)
 '(ruby-insert-encoding-magic-comment nil))

(add-hook 'after-init-hook 'myinit-ruby-mode)
(defun myinit-ruby-mode ()
  "My init."
  (dolist (pattern myinit-ruby-mode-patterns)
    (add-to-list 'auto-mode-alist (cons pattern 'ruby-mode)))
  (add-hook 'ruby-mode-hook
            (lambda () (interactive)
              (remove-hook 'before-save-hook 'ruby-mode-set-encoding)))
  ;; (add-hook 'ruby-mode-hook 'ror-doc-lookup)
  (if (boundp 'ruby-mode) (myinit-ruby-mode--setup)
    (with-eval-after-load 'ruby-mode (myinit-ruby-mode--setup))))

(defun myinit-ruby-mode--setup ()
  (define-key ruby-mode-map (kbd "C-c C-f n") 'beginning-of-defun)
  (define-key ruby-mode-map (kbd "C-c C-k") 'xref-pop-marker-stack)
  (define-key ruby-mode-map (my-kbd "m r b") 'my-ruby-toggle-block)
  ;; Ruby indentation fix
  ;; <https://github.com/mlapshin/dotfiles/blob/2531616385b9fd3bef4b6418a5f024fd2f010461/.emacs.d/custom/ruby.el#L49>.
  (defadvice ruby-indent-line (after line-up-args activate)
    (let (indent prev-indent arg-indent)
      (save-excursion
        (back-to-indentation)
        (when (zerop (car (syntax-ppss)))
          (setq indent (current-column))
          (skip-chars-backward " \t\n")
          (when (eq ?, (char-before))
            (ruby-backward-sexp)
            (back-to-indentation)
            (setq prev-indent (current-column))
            (skip-syntax-forward "w_.")
            (skip-chars-forward " ")
            (setq arg-indent (current-column)))))
      (when prev-indent
        (let ((offset (- (current-column) indent)))
          (cond ((< indent prev-indent)
                 (indent-line-to prev-indent))
                ((= indent prev-indent)
                 (indent-line-to arg-indent)))
          (when (> offset 0) (forward-char offset)))))))

(defun myinit-ruby-mode--highlight-static-regexps-init ()
  (when (equal major-mode 'ruby-mode)
    (make-local-variable 'highlight-static-regexps-filter-functions)
    (add-hook 'highlight-static-regexps-filter-functions
              'myinit-ruby-mode--highlight-static-regexps-filter)
    (make-local-variable 'highlight-static-regexps-faces-to-override)
    (setq highlight-static-regexps-faces-to-override '( font-lock-keyword-face default))
    (when (<= (buffer-size) 100000)
      (myinit-highlight-static-regexps--lazyinit))))

(defun myinit-ruby-mode--highlight-static-regexps-filter (beg end)
  "My highlight-static-regexps custom init for symbol between `BEG' and `END'."
  (let ((face-cur (or (get-char-property beg 'read-face-name)
                      (get-char-property beg 'face)))
        (str-cur (buffer-substring-no-properties beg end)))
    (and
     (not (member face-cur '('font-lock-string-face 'font-lock-comment-face)))
     (and (member str-cur '(
                            " return"
                            ))))))

(defun myinit-ruby-mode--rainbow-identifiers-init ()
  (when (equal major-mode 'ruby-mode)
    (make-local-variable 'rainbow-identifiers-filter-functions)
    (add-hook 'rainbow-identifiers-filter-functions
              'rainbow-identifiers-face-overridable)
    (add-hook 'rainbow-identifiers-filter-functions
              'myinit-ruby-mode--rainbow-identifiers-filter)
    (make-local-variable 'rainbow-identifiers-faces-to-override)
    (setq rainbow-identifiers-faces-to-override '(font-lock-variable-name-face
                                                  font-lock-constant-face
                                                  font-lock-type-face
                                                  font-lock-function-name-face))
    (myinit-rainbow-identifiers--lazyinit)))

;; <http://amitp.blogspot.ru/2014/09/emacs-rainbow-identifiers-customized.html>.
(defun myinit-ruby-mode--rainbow-identifiers-filter (beg end)
  "My rainbow-identifiers custom init for symbol between `BEG' and `END'."
  (let ((ch-cur (char-after beg))
        (ch-before (char-before beg))
        (ch-after (char-after end))
        (str-cur (buffer-substring-no-properties beg end))
        (str-before (buffer-substring-no-properties (point-min) beg))
        (str-after (buffer-substring-no-properties end (point-max))))
    (and (not (member ch-cur '(?0 ?1 ?2 ?3 ?4 ?5 ?6 ?7 ?8 ?9 ?? ?_)))
         ;; (not (string-match-p "[?!]\\'" str-cur))
         ;; (not (and (string-match-p "^[[:space:]]*\\'" str-before)
         ;;           (string-match-p "\\`[[:space:]]*$" str-after)))
         ;; (not (string-match-p "\\(self\\|super\\)[[:space:]\n]*\\.[[:space:]\n]*\\'"
         ;;                      str-before))
         ;; (not (equal ch-after ?\())
         ;; (not (string-match-p "\\`[[:space:]]+:[^[:space:]]" str-after))
         ;; (not (and (string-match-p "\\`[[:space:]]+[^=!,/*?&#|:<>{}+-]" str-after)
         ;;           (not (string-match-p "\\`[[:space:]]+\\(if\\|unless\\)" str-after))))
         ;; (not (string-match-p "\\`[[:space:]\n]+\\({\\|do\\)[^a-zA-Z]" str-after))
         ;; (or (not (and (equal ch-before ?\.) (equal ch-after ?\.)))
         ;;     (string-match-p "\\`\\.[[:space:]\n]*\\(blank\\?\\|count\\|first\\|join\\|last\\|extract_options!\\|length\\|new\\|pop\\|present\\?\\|nil\\?\\|save!?\\|scoped\\|second\\|size\\|split\\|to_a\\|to_h\\|to_i\\|to_s\\|upcase\\|update_all\\)[^a-zA-Z0-1]"
         ;;                     str-after))
         (not (member str-cur '(
                                "each"
                                "class"
                                "each_with_object"
                                "after_save"
                                "before_save"
                                "merge"
                                "slice"
                                "freeze"
                                ":count"
                                ":date"
                                ":errors"
                                ":float"
                                ":json"
                                ":jsonb"
                                ":push"
                                ":uuid"
                                "add_index"
                                "after"
                                "after_create"
                                "after_create_commit"
                                "after_update"
                                "alias_attribute"
                                "all"
                                "and"
                                "and_return"
                                "as:"
                                "belongs_to"
                                "bigint"
                                "blank?"
                                "boolean"
                                "build"
                                "by"
                                "call"
                                "column"
                                "column:"
                                "compact"
                                "concat"
                                "count"
                                "create"
                                "create_table"
                                "created_at"
                                "date"
                                "datetime"
                                "decimal"
                                "default"
                                "default:"
                                "delegate"
                                "disable_extension"
                                "drop_table"
                                "enable_extension"
                                "enum"
                                "equal_to"
                                "errors"
                                "errors:"
                                "even"
                                "event"
                                "execute"
                                "extension_enabled?"
                                "extract_options!"
                                "false"
                                "find_by"
                                "first"
                                "float"
                                "force"
                                "force:"
                                "from"
                                "from:"
                                "full_messages"
                                "greater_than"
                                "greater_than_or_equal_to"
                                "has_many"
                                "hstore"
                                "id"
                                "if:"
                                "included"
                                "initial"
                                "integer"
                                "is_a?"
                                "join"
                                "joins"
                                "json"
                                "json:"
                                "jsonb"
                                "jsonb:"
                                "last"
                                "length"
                                "less_than"
                                "less_than_or_equal_to"
                                "limit"
                                "limit:"
                                "log"
                                "match"
                                "mock_model"
                                "module_function"
                                "new"
                                "nil"
                                "nil?"
                                "not"
                                "null"
                                "null:"
                                "numericality"
                                "odd"
                                "other_than"
                                "params:"
                                "performed?"
                                "polymorphic"
                                "polymorphic:"
                                "pop"
                                "presence"
                                "presence:"
                                "present?"
                                "push"
                                "push:"
                                "remove_index"
                                "render"
                                "respond_to?"
                                "save!"
                                "save"
                                "scoped"
                                "second"
                                "self"
                                "size"
                                "split"
                                "state"
                                "status"
                                "status:"
                                "string"
                                "stub"
                                "table_name"
                                "text"
                                "timestamps"
                                "to_a"
                                "to_h"
                                "to_hash"
                                "to_i"
                                "to_json"
                                "to_not"
                                "to_s"
                                "transitions"
                                "true"
                                "try"
                                "uniq"
                                "unique"
                                "unique:"
                                "uniqueness"
                                "upcase"
                                "update!"
                                "update"
                                "update_all"
                                "updated_at"
                                "valid"
                                "valid?"
                                "validate"
                                "validates"
                                "where"
                                "with_options"
                                ))))))

;; My keyboard macroses.
;; <http://emacs-fu.blogspot.ru/20.0.17/keyboard-macros.html>.
;; (fset 'my-kbd-macro-ruby-new-hash-syntax
;;    "\C-s =>\C-m\C-r:\C-m\C-d\C-s =>\C-m\C-?\C-?\C-?:")
(fset 'my-kbd-macro-ruby-string-to-symbol
      "\C-[\C-s\\(\"\\|'\\)\C-s\C-m\C-?\C-[\C-r\\(\"\\|'\\)\C-m\C-d:")

(defun my-ruby-toggle-block ()
  "Toggle block type from do-end to braces or back.
The block must begin on the current line or above it and end after the point.
If the result is do-end block, it will always be multiline."
  (interactive)

  (let ((start (point)) beg end)
    (end-of-line)
    (unless
        (if (and (re-search-backward "\\({\\)\\|\\_<do\\(\\s \\|$\\||\\)")
                 (progn
                   (setq beg (point))
                   (save-match-data (ruby-forward-sexp))
                   (setq end (point))
                   (> end start)))
            (if (match-beginning 1)
                (my-ruby-brace-to-do-end beg end)
              (my-ruby-do-end-to-brace beg end)))
      (goto-char start))))

(defun my-ruby-brace-to-do-end (orig end)
  (let (beg-marker end-marker)
    (goto-char end)
    (when (eq (char-before) ?\})
      (delete-char -1)
      (when (save-excursion
              (skip-chars-backward " \t")
              (not (bolp)))
        (insert "\n"))
      (insert "end")
      (setq end-marker (point-marker))
      (when (and (not (eobp)) (eq (char-syntax (char-after)) ?w))
        (insert " "))
      (goto-char orig)
      (delete-char 1)
      (when (eq (char-syntax (char-before)) ?w)
        (insert " "))
      (insert "do")
      (setq beg-marker (point-marker))
      (when (looking-at "\\(\\s \\)*|")
        (unless (match-beginning 1)
          (insert " "))
        (goto-char (1+ (match-end 0)))
        (search-forward "|"))
      (unless (looking-at "\\s *$")
        (insert "\n"))
      (indent-region beg-marker end-marker)
      (goto-char beg-marker)
      t)))

(defun my-ruby-do-end-to-brace (orig end)
  (let (beg-marker end-marker beg-pos end-pos)
    (goto-char (- end 3))
    (when (looking-at ruby-block-end-re)
      (delete-char 3)
      (setq end-marker (point-marker))
      (insert "}")
      (goto-char orig)
      (delete-char 2)
      (insert "{")
      (setq beg-marker (point-marker))
      (when (looking-at "\\s +|")
        (unless (match-beginning 1)
          (insert " "))
        (delete-char (- (match-end 0) (match-beginning 0) 1))
        (forward-char)
        (re-search-forward "|" (line-end-position) t))
      (save-excursion
        (skip-chars-forward " \t\n\r")
        (setq beg-pos (point))
        (goto-char end-marker)
        (skip-chars-backward " \t\n\r")
        (setq end-pos (point)))
      (when (or
             (< end-pos beg-pos)
             (and (= (line-number-at-pos beg-pos) (line-number-at-pos end-pos))
                  (< (+ (current-column) (- end-pos beg-pos) 2) fill-column)))
        (just-one-space -1)
        (goto-char end-marker)
        (just-one-space -1))
      (goto-char beg-marker)
      t)))

;;TODO: To refactor below.

;; ;;; Inf ruby mode (irb) history <http://www.emacswiki.org/emacs/SqlMode#toc3>.
;; (defun my-irb-save-history-hook ()
;;   (let ((lval 'sql-input-ring-file-name)
;;         (rval 'sql-product))
;;     (if (symbol-value rval)
;;         (let ((filename
;;                (concat "~/.emacs.d/irb/"
;;                        (symbol-name (symbol-value rval))
;;                        "-history.sql")))
;;           (set (make-local-variable lval) filename))
;;       (error
;;        (format "IRB history will not be saved because %s is nil"
;;                (symbol-name rval))))))
;; (add-hook 'inf-ruby-mode-hook 'my-irb-save-history-hook)

;;; ri-emacs.
;; (setq ri-ruby-script "~/share/emacs/site-lisp/ri-emacs/ri-emacs.rb")
;; (autoload 'ri "~/share/emacs/site-lisp/ri-emacs/ri-ruby.el" nil t)
;; (add-hook 'ruby-mode-hook
;;   (lambda ()
;;     (local-set-key 'f1 'ri)
;;     (local-set-key "\M-\C-i" 'ri-ruby-complete-symbol)
;;     (local-set-key 'f4 'ri-ruby-show-args)
;;     ))

;;; Ruby and Rails documentation lookup.
;; (defun ror-doc-lookup () (local-set-key (kbd "<f1>") 'doc-symbol-lookup))
;; ;http://www.google.com/search?num=100&q=site%3Aruby-doc.org/core+
;; (defun doc-symbol-lookup ()
;;   (interactive)
;;   (let ((symbol (symbol-at-point)))
;;     (if (not symbol)
;;       (message "No symbol at point.")
;;       (browse-url
;;         (concat
;;           "http://www.google.com/search?num=100&q=site%3Aapi.rubyonrails.org+"
;;           (symbol-name symbol))))))

;; (setq interpreter-mode-alist
;;      (cons '("ruby" . ruby-mode) interpreter-mode-alist))
;; (autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
;; (autoload 'inf-ruby-keys "inf-ruby"
;;  "Set local key defs for inf-ruby in ruby-mode")
;; (add-hook 'ruby-mode-hook
;;          '(lambda ()
;;             (inf-ruby-keys)
;;             ))

;;; init-ruby-mode.el ends here
