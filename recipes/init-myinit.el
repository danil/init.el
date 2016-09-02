;;; init-myinit.el --- This file is part of Danil <danil@kutkevich.org> home.

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

;; (add-hook 'after-init-hook 'init-myinit)

;; (defun init-myinit ()
;;   "Init."

;;   (myinit-global-mode 1)

;;   ;; (myinit--after-load 'myinit
;;   ;;   ;; Nested prefixed namespaces.
;;   ;;   (define-key myinit-mode-map (kbd "C-v c") mode-specific-map)
;;   ;;   (define-key myinit-mode-map (kbd "C-v x") ctl-x-map)

;;   ;;   ;; First row.
;;   ;;   (myinit-define-kbd "C-v `" "C-`")
;;   ;;   (myinit-define-kbd "C-v 1" "C-1")
;;   ;;   (myinit-define-kbd "C-v 2" "C-2")
;;   ;;   (myinit-define-kbd "C-v 3" "C-3")
;;   ;;   (myinit-define-kbd "C-v 4" "C-4")
;;   ;;   (myinit-define-kbd "C-v 5" "C-5")
;;   ;;   (myinit-define-kbd "C-v 6" "C-6")
;;   ;;   (myinit-define-kbd "C-v 7" "C-7")
;;   ;;   (myinit-define-kbd "C-v 8" "C-8")
;;   ;;   (myinit-define-kbd "C-v 9" "C-9")
;;   ;;   (myinit-define-kbd "C-v 0" "C-0")
;;   ;;   (myinit-define-kbd "C-v -" "C--")
;;   ;;   (myinit-define-kbd "C-v =" "C-=")

;;   ;;   ;; First row shifted.
;;   ;;   (myinit-define-kbd "C-v ~" "C-~")
;;   ;;   (myinit-define-kbd "C-v !" "C-!")
;;   ;;   (myinit-define-kbd "C-v @" "C-@")
;;   ;;   (myinit-define-kbd "C-v #" "C-#")
;;   ;;   (myinit-define-kbd "C-v $" "C-$")
;;   ;;   (myinit-define-kbd "C-v %" "C-%")
;;   ;;   (myinit-define-kbd "C-v ^" "C-^")
;;   ;;   (myinit-define-kbd "C-v &" "C-&")
;;   ;;   (myinit-define-kbd "C-v *" "C-*")
;;   ;;   (myinit-define-kbd "C-v (" "C-(")
;;   ;;   (myinit-define-kbd "C-v )" "C-)")
;;   ;;   (myinit-define-kbd "C-v _" "C-_")
;;   ;;   (myinit-define-kbd "C-v +" "C-+")

;;   ;;   ;; Second row.
;;   ;;   (myinit-define-kbd "C-v [" "C-[")
;;   ;;   (myinit-define-kbd "C-v ]" "C-]")
;;   ;;   (myinit-define-kbd "C-v \\" "C-\\")

;;   ;;   ;; Second row shifted.
;;   ;;   (myinit-define-kbd "C-v {" "C-{")
;;   ;;   (myinit-define-kbd "C-v }" "C-}")
;;   ;;   (myinit-define-kbd "C-v |" "C-|")

;;   ;;   ;; Third row.
;;   ;;   (myinit-define-kbd "C-v ;" "C-;")
;;   ;;   (myinit-define-kbd "C-v '" "C-'")

;;   ;;   ;; Third row shifted.
;;   ;;   (myinit-define-kbd "C-v :" "C-:")
;;   ;;   (myinit-define-kbd "C-v \"" "C-\"")

;;   ;;   ;; Fourth row.
;;   ;;   (myinit-define-kbd "C-v ," "C-,")
;;   ;;   (myinit-define-kbd "C-v ." "C-.")
;;   ;;   (myinit-define-kbd "C-v /" "C-/")

;;   ;;   ;; Fourth row shifted.
;;   ;;   (myinit-define-kbd "C-v <" "C-<")
;;   ;;   (myinit-define-kbd "C-v >" "C->")
;;   ;;   (myinit-define-kbd "C-v ?" "C-?")

;;   ;;   ;; Alphabet. Prefix keymaps `x' and `c' is an exception case.
;;   ;;   ;; `z' not used in Emacs.
;;   ;;   (myinit-define-kbd "C-v a" "C-a")
;;   ;;   (myinit-define-kbd "C-v b" "C-b")
;;   ;;   (myinit-define-kbd "C-v d" "C-d")
;;   ;;   (myinit-define-kbd "C-v e" "C-e")
;;   ;;   (myinit-define-kbd "C-v h" "C-h")
;;   ;;   (myinit-define-kbd "C-v i" "C-i")
;;   ;;   (myinit-define-kbd "C-v j" "C-j")
;;   ;;   (myinit-define-kbd "C-v k" "C-k")
;;   ;;   (myinit-define-kbd "C-v l" "C-l")
;;   ;;   (myinit-define-kbd "C-v m" "C-m")
;;   ;;   (myinit-define-kbd "C-v n" "C-n")
;;   ;;   (myinit-define-kbd "C-v o" "C-o")
;;   ;;   (myinit-define-kbd "C-v p" "C-p")
;;   ;;   (myinit-define-kbd "C-v q" "C-q")
;;   ;;   (myinit-define-kbd "C-v r" "C-r")
;;   ;;   (myinit-define-kbd "C-v s" "C-s")
;;   ;;   (myinit-define-kbd "C-v t" "C-t")
;;   ;;   (myinit-define-kbd "C-v u" "C-u")
;;   ;;   (myinit-define-kbd "C-v v" "C-v")
;;   ;;   (myinit-define-kbd "C-v w" "C-w")
;;   ;;   (myinit-define-kbd "C-v y" "C-y")

;;   ;;   ;; Alphabet shifted. Prefix keymaps `X' and `C' is an exception case.
;;   ;;   ;; `Z' not used in Emacs.
;;   ;;   (myinit-define-kbd "C-v A" "C-S-a")
;;   ;;   (myinit-define-kbd "C-v B" "C-S-b")
;;   ;;   (myinit-define-kbd "C-v D" "C-S-d")
;;   ;;   (myinit-define-kbd "C-v E" "C-S-e")
;;   ;;   (myinit-define-kbd "C-v F" "C-S-f")
;;   ;;   (myinit-define-kbd "C-v G" "C-S-g")
;;   ;;   (myinit-define-kbd "C-v H" "C-S-h")
;;   ;;   (myinit-define-kbd "C-v I" "C-S-i")
;;   ;;   (myinit-define-kbd "C-v J" "C-S-j")
;;   ;;   (myinit-define-kbd "C-v K" "C-S-k")
;;   ;;   (myinit-define-kbd "C-v L" "C-S-l")
;;   ;;   (myinit-define-kbd "C-v M" "C-S-m")
;;   ;;   (myinit-define-kbd "C-v N" "C-S-n")
;;   ;;   (myinit-define-kbd "C-v O" "C-S-o")
;;   ;;   (myinit-define-kbd "C-v P" "C-S-p")
;;   ;;   (myinit-define-kbd "C-v Q" "C-S-q")
;;   ;;   (myinit-define-kbd "C-v R" "C-S-r")
;;   ;;   (myinit-define-kbd "C-v S" "C-S-s")
;;   ;;   (myinit-define-kbd "C-v T" "C-S-t")
;;   ;;   (myinit-define-kbd "C-v U" "C-S-u")
;;   ;;   (myinit-define-kbd "C-v V" "C-S-v")
;;   ;;   (myinit-define-kbd "C-v W" "C-S-w")
;;   ;;   (myinit-define-kbd "C-v Y" "C-S-y"))
;;   )

;;; init-myinit.el ends here
