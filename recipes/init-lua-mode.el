;;; init-lua-mode.el --- This file is part of Danil <https://danil.kutkevich.org> home.

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

(defcustom noxrcp-lua-mode-patterns '()
  "Regexp patterns associated with `lua-mode'."
  :group 'noxrcp)

(custom-set-variables '(noxrcp-lua-mode-patterns
                        '(
                          "\\.lua\\.example\\'"
                          "\\.ws\\'"
                          )))

(add-hook 'after-init-hook 'noxrcp-lua-mode)
(defun noxrcp-lua-mode ()
  "No X recipe init."
  (dolist (pattern noxrcp-lua-mode-patterns)
    (add-to-list 'auto-mode-alist (cons pattern 'lua-mode)))
  (noxrcp-after-load 'lua-mode
    ;; <http://lua-users.org/wiki/LuaStyleGuide>,
    ;; <http://stackoverflow.com/questions/4643206/how-to-configure-indentation-in-emacs-lua-mode#answer-4652043>.
    (setq lua-indent-level 2)
    ;; (define-key lua-mode-map "\C-c\C-f" nil)
    (define-key lua-mode-map "\C-v" nil)))

(defun noxrcp-lua-mode--rainbow-identifiers-init ()
  (when (equal major-mode 'lua-mode)
    (make-local-variable 'rainbow-identifiers-filter-functions)
    (add-hook 'rainbow-identifiers-filter-functions
              'rainbow-identifiers-face-overridable)
    (add-hook 'rainbow-identifiers-filter-functions
              'noxrcp-lua-mode--rainbow-identifiers-filter)

    (make-local-variable 'rainbow-identifiers-faces-to-override)
    (setq rainbow-identifiers-faces-to-override
          '(font-lock-variable-name-face font-lock-function-name-face))

    (noxrcp-rainbow-identifiers--lazyinit)))

;; <http://amitp.blogspot.ru/2014/09/emacs-rainbow-identifiers-customized.html>.
(defun noxrcp-lua-mode--rainbow-identifiers-filter (beg end)
  "My rainbow-identifiers custom init for symbol between `BEG' and `END'."

  (let ((ch-cur (char-after beg))
        (ch-before (char-before beg))
        (ch-after (char-after end))
        (str-cur (buffer-substring-no-properties beg end))
        (str-before (buffer-substring-no-properties (point-min) beg))
        (str-after (buffer-substring-no-properties end (point-max))))
    (and (not (member ch-cur
                      '(?0 ?1 ?2 ?3 ?4 ?5 ?6 ?7 ?8 ?9 ??)))
         (or (not (and (equal ch-before ?\.) (equal ch-after ?\.)))
             (string-match-p "\\`\\.[[:space:]\n]*\\(new\\)[^a-zA-Z0-1]"
                             str-after)))))

;;; init-lua-mode.el ends here
