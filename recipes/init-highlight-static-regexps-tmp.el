;;; highlight-static-regexps-tmp.el --- highlight regexps -*- lexical-binding: t -*-

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

;; Highlight regexps.

;; You can either turn on `highlight-static-regexps-mode' in individual buffers or use
;; the the global variant `global-highlight-static-regexps-mode'.  Note that the option
;; `highlight-static-regexps-activate-in-modes' controls in what buffers the local mode
;; will be activated if you do the latter.  By default it will only be
;; activated in buffers whose major-mode derives from `prog-mode'.

;; This package also provides commands for moving to the next or
;; previous keyword and to invoke `occur' with a regexp that matches
;; all known keywords.  If you want to use these commands, then you
;; should bind them in `highlight-static-regexps-mode-map', e.g.:
;;
;;   (define-key highlight-static-regexps-mode-map (kbd "C-c p") 'highlight-static-regexps-previous)
;;   (define-key highlight-static-regexps-mode-map (kbd "C-c n") 'highlight-static-regexps-next)
;;   (define-key highlight-static-regexps-mode-map (kbd "C-c o") 'highlight-static-regexps-occur)

;; See [[http://emacswiki.org/FixmeMode][this list]] on the Emacswiki for other packages that implement
;; the same basic features, but which might also provide additional
;; features that you might like, but which I don't deem necessary.

;;; Code:

(defgroup highlight-static-regexps nil
  "Highlight regexps."
  :group 'font-lock-extra-types)

(defface highlight-static-regexps
  '((t (:bold t :foreground "#cc9393")))
  "Base face used to highlight regexps.
The faces used to highlight certain keywords are, by default,
created by inheriting this face and using the appropriate
color specified using the option `highlight-static-regexps-keyword-faces' as
foreground color."
  :group 'highlight-static-regexps)

(defcustom highlight-static-regexps-activate-in-modes '(prog-mode)
  "Major modes in which `highlight-static-regexps-mode' should be activated.
This is used by `global-highlight-static-regexps-mode'."
  :group 'highlight-static-regexps
  :type '(repeat function))

(defvar highlight-static-regexps-regexp nil)

(defvar highlight-static-regexps-keyword-faces)

(defun highlight-static-regexps-set-regexp ()
  "Set the value of `highlight-static-regexps-regexp' based on `highlight-static-regexps-keyword-faces'."
  (setq highlight-static-regexps-regexp
        (let* ((l (mapcar #'car highlight-static-regexps-keyword-faces))
               (s (mapconcat 'identity l "\\|")))
          (concat "\\(" s "\\)"))))

(defcustom highlight-static-regexps-keyword-faces '()
  "Faces used to highlight specific regexps."
  :group 'highlight-static-regexps
  :type '(repeat (cons (string :tag "Keyword")
                       (choice :tag "Face   "
                               (string :tag "Color")
                               (sexp :tag "Face"))))
  :set (lambda (symbol value)
         (set-default symbol value)
         (highlight-static-regexps-set-regexp)))

(defvar highlight-static-regexps-keywords
  `(((lambda (limit)
       (let (case-fold-search)
         (and (re-search-forward highlight-static-regexps-regexp limit t)
              ;; (not (nth 8 (syntax-ppss))) ; not inside comment or string
              )))
     (1 (highlight-static-regexps-get-face) t t))))

(defun highlight-static-regexps-get-face ()
  (let ((face (cdr (assoc (match-string 1) highlight-static-regexps-keyword-faces))))
    (if (stringp face)
        (list :inherit 'highlight-static-regexps :foreground face)
      face)))

(defvar highlight-static-regexps-mode-map (make-sparse-keymap)
  "Keymap for `highlight-static-regexps-mode'.")

;;;###autoload
(define-minor-mode highlight-static-regexps-mode
  "Highlight regexps."
  :lighter ""
  :keymap highlight-static-regexps-mode-map
  :group 'highlight-static-regexps
  (if highlight-static-regexps-mode
      (progn (highlight-static-regexps-set-regexp)
             (font-lock-add-keywords nil highlight-static-regexps-keywords t))
    (font-lock-remove-keywords nil highlight-static-regexps-keywords))
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
(define-globalized-minor-mode global-highlight-static-regexps-mode
  highlight-static-regexps-mode turn-on-highlight-static-regexps-mode-if-desired)

(defun turn-on-highlight-static-regexps-mode-if-desired ()
  (when (apply #'derived-mode-p highlight-static-regexps-activate-in-modes)
    (highlight-static-regexps-mode 1)))

(provide 'highlight-static-regexps)

;;; highlight-static-regexps-tmp.el ends here
