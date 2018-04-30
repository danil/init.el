;;; init-js2-mode.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2016 Danil <danil@kutkevich.org>.
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

(defcustom myinit-js2-mode-patterns '()
  "Regexp patterns associated with `js2-mode'."
  :group 'myinit)

(custom-set-variables '(myinit-js2-mode-patterns
                        '(
                          "\\.htc\\'" ;HTML Components (HTCs or .htc) <http://en.wikipedia.org/wiki/HTML_Components>
                          ;; "\\.js.erb\\'"
                          "\\.js\\'"
                          )))

(autoload 'js2-mode "js2-mode" nil t)

(custom-set-variables
 ;; '(js2-highlight-level 3)
 '(js2-mode-show-strict-warnings nil))

(add-hook 'after-init-hook 'myinit-js2-mode)

(defun myinit-js2-mode ()
  "My init."

  ;; (myinit-after-load 'js2-mode
  ;;   (define-key js2-mode-map (kbd "C-c C-f") nil))

  (dolist (pattern myinit-js2-mode-patterns)
    (add-to-list 'auto-mode-alist (cons pattern 'js2-mode))))

(defun myinit-js2-mode--rainbow-identifiers-init ()
  (when (equal major-mode 'js2-mode)
    (make-local-variable 'rainbow-identifiers-filter-functions)
    (add-hook 'rainbow-identifiers-filter-functions
              'rainbow-identifiers-face-overridable)
    (add-hook 'rainbow-identifiers-filter-functions
              'myinit-js2-mode--rainbow-identifiers-filter)

    (make-local-variable 'rainbow-identifiers-faces-to-override)
    (setq rainbow-identifiers-faces-to-override
          '(
            font-lock-variable-name-face
            js2-function-call
            js2-function-param
            js2-object-property
            ))

    (myinit-rainbow-identifiers--lazyinit)))

;; <http://amitp.blogspot.ru/2014/09/emacs-rainbow-identifiers-customized.html>.
(defun myinit-js2-mode--rainbow-identifiers-filter (beg end)
  "My rainbow-identifiers custom init for symbol between `BEG' and `END'."

  (let ((ch-cur (char-after beg))
        (ch-before (char-before beg))
        (ch-after (char-after end))
        (str-cur (buffer-substring-no-properties beg end))
        (str-after (buffer-substring-no-properties end (point-max))))
    (and
     (not (member ch-cur
                  '(?0 ?1 ?2 ?3 ?4 ?5 ?6 ?7 ?8 ?9 ?? ?_ ?& ?| ?= ?+ ?- ?* ?/)))
     (not (or (string-match-p "\\`[A-Z]" str-cur)
              (string-match-p "[=/*+-]" str-cur)))
     ;; (not (string-match-p "\\`[[:space:]]*:" str-after))
     (not (and (equal ch-after ?\()
               (string-match-p "\\`[[:space:]\n]*(\\([^)]*\\|[^)]+(\\([^)]*\\|[^)]+(\\([^)]*\\|[^)]+(\\([^)]*\\|[^)]+([^)]*)\\))\\))\\))\\))[[:space:]\n]*\\."
                               str-after)))
     (or (not (and (equal ch-before ?\.) (equal ch-after ?\.)))
         (string-match-p "\\`\\.[[:space:]\n]*\\(apply\\|call\\|debug\\|forEach\\|join\\|length\\|map\\|parse\\|pipe\\|pop\\|push\\|reverse\\|split\\|stringify\\|watch\\|write\\)[^a-zA-Z0-1]"
                         str-after))
     (not (member str-cur '(
                                       "apply"
                                       "call"
                                       "console"
                                       "debug"
                                       "execute"
                                       "forEach"
                                       "gulp"
                                       "join"
                                       "length"
                                       "log"
                                       "map"
                                       "parse"
                                       "pipe"
                                       "pop"
                                       "push"
                                       "require"
                                       "reverse"
                                       "split"
                                       "stringify"
                                       "this"
                                       "watch"
                                       "write"
                                       ))))))

;;; init-js2-mode.el ends here
