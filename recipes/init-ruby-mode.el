;;; init-ruby-mode.el --- This file is part of Danil <https://danil.kutkevich.org> home.

;; Copyright (C) 2021 Danil <https://danil.kutkevich.org>.
;; Author: Danil <https://danil.kutkevich.org>
;; Maintainer: Danil <https://danil.kutkevich.org>
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

(defcustom noxrcp-ruby-mode-patterns '()
  "Regexp patterns associated with `ruby-mode'."
  :group 'noxinit)

(defcustom noxrcp-ruby-mode--rainbow-identifiers-stop-words '()
  "Do not highlight in `ruby-mode'."
  :group 'noxinit)

(custom-set-variables
 '(noxrcp-ruby-mode-patterns
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
 '(noxrcp-ruby-mode--rainbow-identifiers-stop-words
   '(
     "_"
     "with_indifferent_access"
     "Integer"
     "it_behaves_like"
     "inspect"
     ":count"
     ":date"
     ":errors"
     ":float"
     ":json"
     ":jsonb"
     ":push"
     ":uuid"
     "Array"
     "assign_attributes"
     "ascii_only?"
     "all?"
     "as_json"
     "allow_any_instance_of"
     "ApplicationController"
     "ArgumentError"
     "ActiveSupport"
     "ActiveRecord"
     "ActiveModel"
     "after"
     "any?"
     "after_create"
     "after_commit"
     "after_create_commit"
     "after_save"
     "after_update"
     "alias_attribute"
     "all"
     "and"
     "as:"
     "Base64"
     "backtrace"
     "Base"
     "base"
     "boolean"
     "bigint"
     "before_action"
     "between?"
     "before_save"
     "before_update"
     "belongs_to"
     "blank?"
     "build"
     "changed?"
     "Class"
     "crated_at"
     "clear_active_connections!"
     "call"
     "class"
     "clone"
     "compact!"
     "compact"
     "concat"
     "count"
     "create!"
     "create"
     "Date"
     "created_at"
     "datetime"
     "decimal"
     "decode64"
     "default"
     "default:"
     "default_scope"
     "default_scoped"
     "delegate"
     "delegate_missing_to"
     "delete"
     "delete_at"
     "delete_if"
     "destroy!"
     "destroy"
     "downcase"
     "drop"
     "dup"
     "Errno"
     "ENOENT"
     "extname"
     "encode64"
     "Enumerable"
     "Encoding"
     "Exception"
     "except"
     "each_with_index"
     "end_with?"
     "exists?"
     "each"
     "each_with_object"
     "empty?"
     "enum"
     "equal_to"
     "Errors"
     "errors"
     "errors:"
     "even"
     "extract_options!"
     "File"
     "fail"
     "FalseClass"
     "Float"
     "find"
     "find_each"
     "find_in_batches"
     "flatten!"
     "flatten"
     "false"
     "find_by"
     "find_or_create_by!"
     "find_or_create_by"
     "first"
     "float"
     "freeze"
     "full_messages"
     "gsub"
     "greater_than"
     "greater_than_or_equal_to"
     "hex"
     "Hash"
     "has_many"
     "has_one"
     "instance_variable_get"
     "instance_variable_set"
     "if:"
     "include?"
     "included"
     "index"
     "initial"
     "initialize"
     "integer"
     "is_a?"
     "json"
     "jsonb"
     "join"
     "joins"
     "keys"
     "LockWaitTimeout"
     "lock"
     "ljust"
     "last"
     "length"
     "less_than"
     "less_than_or_equal_to"
     "limit"
     "limit:"
     "method_missing"
     "methods"
     "module_parent"
     "messages"
     "map"
     "match"
     "match?"
     "merge"
     "merge!"
     "mock_model"
     "module_function"
     "none?"
     "NilClass"
     "Numeric"
     "none"
     "negative?"
     "new"
     "nil"
     "nil?"
     "not"
     "null"
     "null:"
     "numericality"
     "OrderedHash"
     "OpenStruct"
     "order"
     "odd"
     "other_than"
     "parse"
     "params:"
     "performed?"
     "positive?"
     "polymorphic"
     "polymorphic:"
     "pop"
     "pluck"
     "presence"
     "presence:"
     "present?"
     "push"
     "push:"
     "persisted?"
     "JSON"
     "read"
     "raise"
     "reject"
     "reload"
     "rescue_from"
     "rjust"
     "render"
     "respond_to?"
     "sample"
     "strip"
     "strict_encode64"
     "strict_decode64"
     "stringify_keys"
     "superclass"
     "start_with?"
     "symbolize_keys"
     "Symbol"
     "Struct"
     "send"
     "set_backtrace"
     "skip_before_action"
     "SecureRandom"
     "string"
     "String"
     "select!"
     "select"
     "save!"
     "save"
     "scope"
     "scoped"
     "second"
     "self"
     "size"
     "slice"
     "split"
     "status"
     "shift"
     "status:"
     "stub"
     "sum"
     "Thread"
     "TimeWithZone"
     "to_date"
     "to_time"
     "TrueClass"
     "Time"
     "transform_values"
     "text"
     "tap"
     "table_name"
     "third"
     "to_sym"
     "to_sym!"
     "to_a"
     "to_proc"
     "to_h"
     "to_hash"
     "to_i"
     "to_json"
     "to_s"
     "transform_keys"
     "true"
     "try"
     "UTF_8"
     "update_at"
     "uuid"
     "uniq!"
     "uniq"
     "unique"
     "unique:"
     "uniqueness"
     "upcase"
     "update!"
     "update"
     "update_attribute"
     "update_attribute!"
     "update_all"
     "update_column"
     "update_columns"
     "updated_at"
     "values"
     "valid"
     "valid?"
     "validate"
     "validates"
     "where"
     "with_options"
     "zero?"
     ))
 '(ruby-encoding-magic-comment-style 'ruby)
 '(ruby-insert-encoding-magic-comment nil))

(add-hook 'after-init-hook 'noxrcp-ruby-mode)
(defun noxrcp-ruby-mode ()
  "No X recipe init."
  (dolist (pattern noxrcp-ruby-mode-patterns)
    (add-to-list 'auto-mode-alist (cons pattern 'ruby-mode)))
  (add-hook 'ruby-mode-hook
            (lambda () (interactive)
              (remove-hook 'before-save-hook 'ruby-mode-set-encoding)))
  ;; (add-hook 'ruby-mode-hook 'ror-doc-lookup)
  (if (boundp 'ruby-mode) (noxrcp-ruby-mode--setup)
    (with-eval-after-load 'ruby-mode (noxrcp-ruby-mode--setup))))

(defun noxrcp-ruby-mode--setup ()
  (define-key ruby-mode-map (kbd "C-c C-f") nil)
  (define-key ruby-mode-map (kbd "C-c C-f e") 'noxrcp-ruby-mode--end-of-defun)
  (define-key ruby-mode-map (kbd "C-c C-f n") 'noxrcp-ruby-mode--beginning-of-defun)
  (define-key ruby-mode-map (kbd "C-c C-k") 'xref-pop-marker-stack)
  (define-key ruby-mode-map (noxel-kbd-fn "m f h") 'noxrcp-ruby-mode--align-hash)
  (define-key ruby-mode-map (noxel-kbd-fn "m f v") 'noxrcp-ruby-mode--align-variable-defenition)
  (define-key ruby-mode-map (noxel-kbd-fn "m t b") 'noxrcp-ruby-mode--toggle-block)
  ;; (modify-coding-system-alist 'file "\\.rb\\'" nil)
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

(defun noxrcp-ruby-mode--beginning-of-defun ()
  (interactive)
  (call-interactively 'beginning-of-defun)
  (search-forward-regexp "def \\(self\\.\\)?" nil t))

(defun noxrcp-ruby-mode--end-of-defun ()
  (interactive)
  (call-interactively 'end-of-defun)
  (when (search-backward "end" nil t) (forward-char 3)))

(defun noxrcp-ruby-mode--highlight-static-regexps-init ()
  (when (equal major-mode 'ruby-mode)
    (make-local-variable 'highlight-static-regexps-filter-functions)
    (add-hook 'highlight-static-regexps-filter-functions
              'noxrcp-ruby-mode--highlight-static-regexps-filter)
    (make-local-variable 'highlight-static-regexps-faces-to-override)
    (setq highlight-static-regexps-faces-to-override '( font-lock-keyword-face default))
    (when (<= (buffer-size) 100000)
      (noxrcp-highlight-static-regexps--lazyinit))))

(defun noxrcp-ruby-mode--highlight-static-regexps-filter (beg end)
  "My highlight-static-regexps custom init for symbol between `BEG' and `END'."
  (let ((face-cur (or (get-char-property beg 'read-face-name)
                      (get-char-property beg 'face)))
        (str-cur (buffer-substring-no-properties beg end)))
    (and
     (not (member face-cur '('font-lock-string-face 'font-lock-comment-face)))
     (and (member str-cur '(" return"))))))

(defun init-ruby-mode-rainbow-identifiers-setup ()
  (when (equal major-mode 'ruby-mode)
    (make-local-variable 'rainbow-identifiers-filter-functions)
    (add-hook 'rainbow-identifiers-filter-functions
              'rainbow-identifiers-face-overridable)
    (add-hook 'rainbow-identifiers-filter-functions
              'noxrcp-ruby-mode--rainbow-identifiers-filter)
    (make-local-variable 'rainbow-identifiers-faces-to-override)
    (setq rainbow-identifiers-faces-to-override '(font-lock-variable-name-face
                                                  font-lock-constant-face
                                                  font-lock-type-face
                                                  font-lock-function-name-face))
    (init-rainbow-identifiers--lazy-setup)))

;; <http://amitp.blogspot.ru/2014/09/emacs-rainbow-identifiers-customized.html>.
(defun noxrcp-ruby-mode--rainbow-identifiers-filter (beg end)
  "My rainbow-identifiers custom init for symbol between `BEG' and `END'."
  (let ((ch-cur (char-after beg))
        (ch-before (char-before beg))
        (ch-after (char-after end))
        (str-cur (buffer-substring-no-properties beg end))
        (str-before (buffer-substring-no-properties (point-min) beg))
        (str-after (buffer-substring-no-properties end (point-max))))
    (and (not (member ch-cur '(?0 ?1 ?2 ?3 ?4 ?5 ?6 ?7 ?8 ?9 ??)))
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
         (not (member str-cur noxrcp-ruby-mode--rainbow-identifiers-stop-words)))))

;; My keyboard macroses.
;; <http://emacs-fu.blogspot.ru/20.0.17/keyboard-macros.html>.
;; (fset 'nox-kbd-macro-ruby-new-hash-syntax
;;    "\C-s =>\C-m\C-r:\C-m\C-d\C-s =>\C-m\C-?\C-?\C-?:")
(fset 'nox-kbd-macro-ruby-string-to-symbol
      "\C-[\C-s\\(\"\\|'\\)\C-s\C-m\C-?\C-[\C-r\\(\"\\|'\\)\C-m\C-d:")

(defun noxrcp-ruby-mode--toggle-block ()
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
                (noxrcp-ruby-mode--brace-to-do-end beg end)
              (noxrcp-ruby-mode--do-end-to-brace beg end)))
      (goto-char start))))

(defun noxrcp-ruby-mode--brace-to-do-end (orig end)
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

(defun noxrcp-ruby-mode--do-end-to-brace (orig end)
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

;; Copyright 2016 John Cinnamond <https://raw.githubusercontent.com/jcinnamond/jc-ruby-extra/master/jc-ruby-extra.el>
(defun noxrcp-ruby-mode--align-hash ()
  (interactive)
  (if (region-active-p)
      (let ((selection (buffer-substring-no-properties (region-beginning) (region-end))))
  (if (noxrcp-ruby-mode--align-hash-old-style-p selection)
      (noxrcp-ruby-mode--align-hash-old-style)
    (noxrcp-ruby-mode--align-hash-new-style)))
    (message "noxrcp-ruby-mode--align-hash requires an active mark")))
(defun noxrcp-ruby-mode--align-hash-old-style-p (string)
  (if (string-match "=>" string) 't nil))
(defun noxrcp-ruby-mode--align-hash-old-style ()
  (message "aligning old")
  (align-regexp (region-beginning) (region-end) "\\(\\s-*\\)=>"))
(defun noxrcp-ruby-mode--align-hash-new-style ()
  (align-regexp (region-beginning) (region-end) ":\\(\\s-*\\)" 1 1 nil))

(defun noxrcp-ruby-mode--align-variable-defenition ()
  (interactive)
  (if (region-active-p)
      (let ((selection (buffer-substring-no-properties (region-beginning) (region-end))))
        (noxrcp-ruby-mode--align-variable-defenition-new-style))
    (message "noxrcp-ruby-mode--align-variable-defenition requires an active mark")))
(defun noxrcp-ruby-mode--align-variable-defenition-new-style ()
  (align-regexp (region-beginning) (region-end) "\\(\\s-*\\)=" 1 1 nil))

;;TODO: To refactor below.

;; ;;; Inf ruby mode (irb) history <http://www.emacswiki.org/emacs/SqlMode#toc3>.
;; (defun my-irb-save-history-hook ()
;;   (let ((lval 'sql-input-ring-file-name)
;;         (rval 'sql-product))
;;     (if (symbol-value rval)
;;         (let ((filename
;;                (concat user-emacs-directory "irb/"
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
