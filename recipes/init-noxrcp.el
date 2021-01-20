;;; init-noxrcp.el --- This file is part of Danil <https://danil.kutkevich.org> home.

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

;; (add-hook 'after-init-hook 'noxrcp-noxrcp)

;; (defun noxrcp-noxrcp ()
;;   "No X recipe init."

;;   (noxrcp-global-mode 1)

;;   ;; (noxrcp-after-load 'noxrcp
;;   ;;   ;; Nested prefixed namespaces.
;;   ;;   (define-key noxrcp-mode-map (kbd "C-v c") mode-specific-map)
;;   ;;   (define-key noxrcp-mode-map (kbd "C-v x") ctl-x-map)

;;   ;;   ;; First row.
;;   ;;   (noxrcp-define-kbd "C-v `" "C-`")
;;   ;;   (noxrcp-define-kbd "C-v 1" "C-1")
;;   ;;   (noxrcp-define-kbd "C-v 2" "C-2")
;;   ;;   (noxrcp-define-kbd "C-v 3" "C-3")
;;   ;;   (noxrcp-define-kbd "C-v 4" "C-4")
;;   ;;   (noxrcp-define-kbd "C-v 5" "C-5")
;;   ;;   (noxrcp-define-kbd "C-v 6" "C-6")
;;   ;;   (noxrcp-define-kbd "C-v 7" "C-7")
;;   ;;   (noxrcp-define-kbd "C-v 8" "C-8")
;;   ;;   (noxrcp-define-kbd "C-v 9" "C-9")
;;   ;;   (noxrcp-define-kbd "C-v 0" "C-0")
;;   ;;   (noxrcp-define-kbd "C-v -" "C--")
;;   ;;   (noxrcp-define-kbd "C-v =" "C-=")

;;   ;;   ;; First row shifted.
;;   ;;   (noxrcp-define-kbd "C-v ~" "C-~")
;;   ;;   (noxrcp-define-kbd "C-v !" "C-!")
;;   ;;   (noxrcp-define-kbd "C-v @" "C-@")
;;   ;;   (noxrcp-define-kbd "C-v #" "C-#")
;;   ;;   (noxrcp-define-kbd "C-v $" "C-$")
;;   ;;   (noxrcp-define-kbd "C-v %" "C-%")
;;   ;;   (noxrcp-define-kbd "C-v ^" "C-^")
;;   ;;   (noxrcp-define-kbd "C-v &" "C-&")
;;   ;;   (noxrcp-define-kbd "C-v *" "C-*")
;;   ;;   (noxrcp-define-kbd "C-v (" "C-(")
;;   ;;   (noxrcp-define-kbd "C-v )" "C-)")
;;   ;;   (noxrcp-define-kbd "C-v _" "C-_")
;;   ;;   (noxrcp-define-kbd "C-v +" "C-+")

;;   ;;   ;; Second row.
;;   ;;   (noxrcp-define-kbd "C-v [" "C-[")
;;   ;;   (noxrcp-define-kbd "C-v ]" "C-]")
;;   ;;   (noxrcp-define-kbd "C-v \\" "C-\\")

;;   ;;   ;; Second row shifted.
;;   ;;   (noxrcp-define-kbd "C-v {" "C-{")
;;   ;;   (noxrcp-define-kbd "C-v }" "C-}")
;;   ;;   (noxrcp-define-kbd "C-v |" "C-|")

;;   ;;   ;; Third row.
;;   ;;   (noxrcp-define-kbd "C-v ;" "C-;")
;;   ;;   (noxrcp-define-kbd "C-v '" "C-'")

;;   ;;   ;; Third row shifted.
;;   ;;   (noxrcp-define-kbd "C-v :" "C-:")
;;   ;;   (noxrcp-define-kbd "C-v \"" "C-\"")

;;   ;;   ;; Fourth row.
;;   ;;   (noxrcp-define-kbd "C-v ," "C-,")
;;   ;;   (noxrcp-define-kbd "C-v ." "C-.")
;;   ;;   (noxrcp-define-kbd "C-v /" "C-/")

;;   ;;   ;; Fourth row shifted.
;;   ;;   (noxrcp-define-kbd "C-v <" "C-<")
;;   ;;   (noxrcp-define-kbd "C-v >" "C->")
;;   ;;   (noxrcp-define-kbd "C-v ?" "C-?")

;;   ;;   ;; Alphabet. Prefix keymaps `x' and `c' is an exception case.
;;   ;;   ;; `z' not used in Emacs.
;;   ;;   (noxrcp-define-kbd "C-v a" "C-a")
;;   ;;   (noxrcp-define-kbd "C-v b" "C-b")
;;   ;;   (noxrcp-define-kbd "C-v d" "C-d")
;;   ;;   (noxrcp-define-kbd "C-v e" "C-e")
;;   ;;   (noxrcp-define-kbd "C-v h" "C-h")
;;   ;;   (noxrcp-define-kbd "C-v i" "C-i")
;;   ;;   (noxrcp-define-kbd "C-v j" "C-j")
;;   ;;   (noxrcp-define-kbd "C-v k" "C-k")
;;   ;;   (noxrcp-define-kbd "C-v l" "C-l")
;;   ;;   (noxrcp-define-kbd "C-v m" "C-m")
;;   ;;   (noxrcp-define-kbd "C-v n" "C-n")
;;   ;;   (noxrcp-define-kbd "C-v o" "C-o")
;;   ;;   (noxrcp-define-kbd "C-v p" "C-p")
;;   ;;   (noxrcp-define-kbd "C-v q" "C-q")
;;   ;;   (noxrcp-define-kbd "C-v r" "C-r")
;;   ;;   (noxrcp-define-kbd "C-v s" "C-s")
;;   ;;   (noxrcp-define-kbd "C-v t" "C-t")
;;   ;;   (noxrcp-define-kbd "C-v u" "C-u")
;;   ;;   (noxrcp-define-kbd "C-v v" "C-v")
;;   ;;   (noxrcp-define-kbd "C-v w" "C-w")
;;   ;;   (noxrcp-define-kbd "C-v y" "C-y")

;;   ;;   ;; Alphabet shifted. Prefix keymaps `X' and `C' is an exception case.
;;   ;;   ;; `Z' not used in Emacs.
;;   ;;   (noxrcp-define-kbd "C-v A" "C-S-a")
;;   ;;   (noxrcp-define-kbd "C-v B" "C-S-b")
;;   ;;   (noxrcp-define-kbd "C-v D" "C-S-d")
;;   ;;   (noxrcp-define-kbd "C-v E" "C-S-e")
;;   ;;   (noxrcp-define-kbd "C-v F" "C-S-f")
;;   ;;   (noxrcp-define-kbd "C-v G" "C-S-g")
;;   ;;   (noxrcp-define-kbd "C-v H" "C-S-h")
;;   ;;   (noxrcp-define-kbd "C-v I" "C-S-i")
;;   ;;   (noxrcp-define-kbd "C-v J" "C-S-j")
;;   ;;   (noxrcp-define-kbd "C-v K" "C-S-k")
;;   ;;   (noxrcp-define-kbd "C-v L" "C-S-l")
;;   ;;   (noxrcp-define-kbd "C-v M" "C-S-m")
;;   ;;   (noxrcp-define-kbd "C-v N" "C-S-n")
;;   ;;   (noxrcp-define-kbd "C-v O" "C-S-o")
;;   ;;   (noxrcp-define-kbd "C-v P" "C-S-p")
;;   ;;   (noxrcp-define-kbd "C-v Q" "C-S-q")
;;   ;;   (noxrcp-define-kbd "C-v R" "C-S-r")
;;   ;;   (noxrcp-define-kbd "C-v S" "C-S-s")
;;   ;;   (noxrcp-define-kbd "C-v T" "C-S-t")
;;   ;;   (noxrcp-define-kbd "C-v U" "C-S-u")
;;   ;;   (noxrcp-define-kbd "C-v V" "C-S-v")
;;   ;;   (noxrcp-define-kbd "C-v W" "C-S-w")
;;   ;;   (noxrcp-define-kbd "C-v Y" "C-S-y"))
;;   )

;;; init-noxrcp.el ends here
