;;; init-dockerfile-mode.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2016 Danil <danil@kutkevich.org>.
;; Author: Danil <danil@kutkevich.org>
;; Version: 0.0.1
;; Package-Requires: ((myinit))
;; Keywords: convenience
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

(add-hook 'after-init-hook 'myinit-dockerfile-mode)

(defun myinit-dockerfile-mode ()
  "My init."
  ;; (myinit-after-load 'dockerfile-mode
  ;;   (define-key myinit-mode-map (kbd "C-v m") dockerfile-mode-map))
  (myinit-add-mode-to-patterns 'dockerfile-mode "/Dockerfile\\'"))

(defun myinit-dockerfile-mode--rainbow-identifiers-init ()
  (when (equal major-mode 'dockerfile-mode)
    (make-local-variable 'rainbow-identifiers-filter-functions)
    (add-hook 'rainbow-identifiers-filter-functions
              'rainbow-identifiers-face-overridable)
    (add-hook 'rainbow-identifiers-filter-functions
              'myinit-dockerfile-mode--rainbow-identifiers-filter)
    (make-local-variable 'rainbow-identifiers-faces-to-override)
    (setq rainbow-identifiers-faces-to-override '(
                                                  ;; dockerfile-image-alias
                                                  ;; dockerfile-image-name
                                                  ;; font-lock-keyword-face
                                                  ;; font-lock-variable-name-face
                                                  ))
    (myinit-rainbow-identifiers--lazyinit)))

;; <http://amitp.blogspot.ru/2014/09/emacs-rainbow-identifiers-customized.html>.
(defun myinit-dockerfile-mode--rainbow-identifiers-filter (beg end)
  "My rainbow-identifiers custom init for symbol between `BEG' and `END'."
  (let ((ch-cur (char-after beg))
        (ch-before (char-before beg))
        (ch-after (char-after end))
        (str-cur (buffer-substring-no-properties beg end))
        (ch80-before (let ((i 80))
                       (if (< (point-min) (- beg i))
                           (buffer-substring-no-properties (- beg i) beg)
                         (buffer-substring-no-properties (point-min) beg))))
        (ch80-after (let ((i 80))
                      (if (> (point-max) (+ end i))
                          (buffer-substring-no-properties end (+ end i))
                        (buffer-substring-no-properties end (point-max)))))
        (str-before (buffer-substring-no-properties (point-min) beg))
        (str-after (buffer-substring-no-properties end (point-max))))
    (not (member ch-cur '(?0 ?1 ?2 ?3 ?4 ?5 ?6 ?7 ?8 ?9 ?? ?_)))))

;;; init-dockerfile-mode.el ends here
