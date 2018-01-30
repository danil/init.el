;;; highlight-static-strings-tmp.el --- highlight TODO and similar keywords  -*- lexical-binding: t -*-

;; Copyright (C) 2013-2017  Jonas Bernoulli

;; Author: Jonas Bernoulli <jonas@bernoul.li>
;; Homepage: https://github.com/tarsius/hl-todo
;; Keywords: convenience
;; Package-Version: 20170621.1257

;; This file is not part of GNU Emacs.

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; For a full copy of the GNU General Public License
;; see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Highlight TODO and similar keywords in comments and strings.

;; You can either turn on `highlight-static-strings-mode' in individual buffers or use
;; the the global variant `global-highlight-static-strings-mode'.  Note that the option
;; `highlight-static-strings-activate-in-modes' controls in what buffers the local mode
;; will be activated if you do the latter.  By default it will only be
;; activated in buffers whose major-mode derives from `prog-mode'.

;; This package also provides commands for moving to the next or
;; previous keyword and to invoke `occur' with a regexp that matches
;; all known keywords.  If you want to use these commands, then you
;; should bind them in `highlight-static-strings-mode-map', e.g.:
;;
;;   (define-key highlight-static-strings-mode-map (kbd "C-c p") 'highlight-static-strings-previous)
;;   (define-key highlight-static-strings-mode-map (kbd "C-c n") 'highlight-static-strings-next)
;;   (define-key highlight-static-strings-mode-map (kbd "C-c o") 'highlight-static-strings-occur)

;; See [[http://emacswiki.org/FixmeMode][this list]] on the Emacswiki for other packages that implement
;; the same basic features, but which might also provide additional
;; features that you might like, but which I don't deem necessary.

;;; Code:

(defgroup highlight-static-strings nil
  "Highlight TODO and similar keywords in comments and strings."
  :group 'font-lock-extra-types)

(defface highlight-static-strings
  '((t (:bold t :foreground "#cc9393")))
  "Base face used to highlight TODO and similar keywords.
The faces used to highlight certain keywords are, by default,
created by inheriting this face and using the appropriate
color specified using the option `highlight-static-strings-keyword-faces' as
foreground color."
  :group 'highlight-static-strings)

(defcustom highlight-static-strings-activate-in-modes '(prog-mode)
  "Major modes in which `highlight-static-strings-mode' should be activated.
This is used by `global-highlight-static-strings-mode'."
  :group 'highlight-static-strings
  :type '(repeat function))

(defvar highlight-static-strings-regexp nil)

(defvar highlight-static-strings-keyword-faces)

(defun highlight-static-strings-set-regexp ()
  "Set the value of `highlight-static-strings-regexp' based on `highlight-static-strings-keyword-faces'."
  (setq highlight-static-strings-regexp
        (let* ((l (mapcar #'car highlight-static-strings-keyword-faces))
               (s (mapconcat 'identity l "\\|")))
          (concat "\\(" s "\\)"))))

(defcustom highlight-static-strings-keyword-faces
  '((" := " . (:inherit default :weight bold))
    ("break" . (:inherit font-lock-keyword-face :weight bold))
    ("continue" . (:inherit font-lock-keyword-face :weight bold))
    ("goto" . (:inherit font-lock-keyword-face :weight bold))
    ("return" . (:inherit font-lock-keyword-face :weight bold)))
  "Faces used to highlight specific TODO keywords."
  :group 'highlight-static-strings
  :type '(repeat (cons (string :tag "Keyword")
                       (choice :tag "Face   "
                               (string :tag "Color")
                               (sexp :tag "Face"))))
  :set (lambda (symbol value)
         (set-default symbol value)
         (highlight-static-strings-set-regexp)))

(defvar highlight-static-strings-keywords
  `(((lambda (limit)
       (let (case-fold-search)
         (and (re-search-forward highlight-static-strings-regexp limit t)
              ;; (not (nth 8 (syntax-ppss))) ; not inside comment or string
              )))
     (1 (highlight-static-strings-get-face) t t))))

(defun highlight-static-strings-get-face ()
  (let ((face (cdr (assoc (match-string 1) highlight-static-strings-keyword-faces))))
    (if (stringp face)
        (list :inherit 'highlight-static-strings :foreground face)
      face)))

(defvar highlight-static-strings-mode-map (make-sparse-keymap)
  "Keymap for `highlight-static-strings-mode'.")

;;;###autoload
(define-minor-mode highlight-static-strings-mode
  "Highlight TODO and similar keywords in comments and strings."
  :lighter ""
  :keymap highlight-static-strings-mode-map
  :group 'highlight-static-strings
  (if highlight-static-strings-mode
      (progn (highlight-static-strings-set-regexp)
             (font-lock-add-keywords nil highlight-static-strings-keywords t))
    (font-lock-remove-keywords nil highlight-static-strings-keywords))
  (when font-lock-mode
    (if (and (fboundp 'font-lock-flush)
             (fboundp 'font-lock-ensure))
        (save-restriction
          (widen)
          (font-lock-flush)
          (font-lock-ensure))
      (with-no-warnings
        (font-lock-fontify-buffer)))))

;;;###autoload
(define-globalized-minor-mode global-highlight-static-strings-mode
  highlight-static-strings-mode turn-on-highlight-static-strings-mode-if-desired)

(defun turn-on-highlight-static-strings-mode-if-desired ()
  (when (apply #'derived-mode-p highlight-static-strings-activate-in-modes)
    (highlight-static-strings-mode 1)))

;;;###autoload
(defun highlight-static-strings-next (arg)
  "Jump to the next TODO or similar keyword.
The prefix argument ARG specifies how many keywords to move.
A negative argument means move backward that many keywords."
  (interactive "p")
  (if (< arg 0)
      (highlight-static-strings-previous (- arg))
    (while (and (> arg 0)
                (not (eobp))
                (let ((case-fold-search nil))
                  (when (looking-at highlight-static-strings-regexp)
                    (goto-char (match-end 0)))
                  (or (re-search-forward highlight-static-strings-regexp nil t)
                      (user-error "No more matches"))))
      (cl-decf arg))))

;;;###autoload
(defun highlight-static-strings-previous (arg)
  "Jump to the previous TODO or similar keyword.
The prefix argument ARG specifies how many keywords to move.
A negative argument means move forward that many keywords."
  (interactive "p")
  (if (< arg 0)
      (highlight-static-strings-next (- arg))
    (while (and (> arg 0)
                (not (bobp))
                (let ((case-fold-search nil)
                      (start (point)))
                  (re-search-backward (concat highlight-static-strings-regexp "\\=") nil t)
                  (or (re-search-backward highlight-static-strings-regexp nil t)
                      (progn (goto-char start)
                             (user-error "No more matches")))))
      (goto-char (match-end 0))
      (cl-decf arg))))

;;;###autoload
(defun highlight-static-strings-occur ()
  "Use `occur' to find all TODO or similar keywords.
This actually finds a superset of the highlighted keywords,
because it uses a regexp instead of a more sophisticated
matcher."
  (interactive)
  (occur highlight-static-strings-regexp))

(provide 'highlight-static-strings)

;;; highlight-static-strings-tmp.el ends here
