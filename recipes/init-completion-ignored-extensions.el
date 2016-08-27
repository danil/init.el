;;; init-completion-ignored-extensions.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(add-hook 'after-init-hook 'init-completion-ignored-extensions)

(defun init-completion-ignored-extensions ()
  "Init."

  ;; <http://endlessparentheses.com/improving-emacs-file-name-completion.html>.
  (mapc (lambda (ignored-str)
          (add-to-list 'completion-ignored-extensions ignored-str))
        '("-autoloads.el" "-pkg.el"))
  (mapc (lambda (ignored-str)
          (delete ignored-str completion-ignored-extensions))
        '(
          ".bzr/"
          ".git/"
          ".hg/"
          ".svn/"
          "CVS/"
          "_MTN/"
          "_darcs/"
          ".a"
          ".aux"
          ".bbl"
          ".bin"
          ".blg"
          ".class"
          ".cp"
          ".cps"
          ".d64fsl"
          ".dfsl"
          ".dx32fsl"
          ".dx64fsl"
          ".dxl"
          ".fas"
          ".fasl"
          ".fmt"
          ".fn"
          ".fns"
          ".fsl"
          ".fx32fsl"
          ".fx64fsl"
          ".glo"
          ".gmo"
          ".idx"
          ".ky"
          ".kys"
          ".la"
          ".lbin"
          ".lib"
          ".ln"
          ".lo"
          ".lof"
          ".lot"
          ".lx32fsl"
          ".lx64fsl"
          ".mem"
          ".mo"
          ".o"
          ".p64fsl"
          ".pfsl"
          ".pg"
          ".pgs"
          ".pyc"
          ".pyo"
          ".so"
          ".sparcf"
          ".sx32fsl"
          ".sx64fsl"
          ".tfm"
          ".toc"
          ".tp"
          ".tps"
          ".ufsl"
          ".vr"
          ".vrs"
          ".wx32fsl"
          ".wx64fsl"
          ".x86f"
          )))

;;; init-completion-ignored-extensions.el ends here
