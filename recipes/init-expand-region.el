;;; init-expand-region.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(my-init--hook
 (my-init--autoload-file-on-functions "expand-region"
                                      'er/expand-region
                                      'er/mark-comment
                                      'er/mark-defun
                                      'er/mark-email
                                      'er/mark-inside-pairs
                                      'er/mark-inside-quotes
                                      'er/mark-method-call
                                      'er/mark-next-accessor
                                      'er/mark-outside-pairs
                                      'er/mark-outside-quotes
                                      'er/mark-symbol
                                      'er/mark-symbol-with-prefix
                                      'er/mark-url
                                      'er/mark-word)

  (define-key myinit-map (kbd "e e") 'er/expand-region)

  (define-key myinit-map (kbd "e c") 'er/mark-comment)
  (define-key myinit-map (kbd "e d") 'er/mark-defun)
  (define-key myinit-map (kbd "e m c") 'er/mark-method-call)
  (define-key myinit-map (kbd "e m m") 'er/mark-email)
  (define-key myinit-map (kbd "e n") 'er/mark-next-accessor)
  (define-key myinit-map (kbd "e p i") 'er/mark-inside-pairs)
  (define-key myinit-map (kbd "e p o") 'er/mark-outside-pairs)
  (define-key myinit-map (kbd "e q i") 'er/mark-inside-quotes)
  (define-key myinit-map (kbd "e q o") 'er/mark-outside-quotes)
  (define-key myinit-map (kbd "e s p") 'er/mark-symbol-with-prefix)
  (define-key myinit-map (kbd "e s s") 'er/mark-symbol)
  (define-key myinit-map (kbd "e u") 'er/mark-url)
  (define-key myinit-map (kbd "e w") 'er/mark-word))

;;; init-expand-region.el ends here
