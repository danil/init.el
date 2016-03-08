;;; init-myinit.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(my-init--hook
  (myinit-global-mode 1)

  (my-init--after-load 'myinit
    ;; Nested prefixed namespaces.
    (define-key myinit-mode-map (kbd "M-SPC c") mode-specific-map)
    (define-key myinit-mode-map (kbd "M-SPC x") ctl-x-map)

    ;; First row.
    (myinit-define-kbd "M-SPC `" "C-`")
    (myinit-define-kbd "M-SPC 1" "C-1")
    (myinit-define-kbd "M-SPC 2" "C-2")
    (myinit-define-kbd "M-SPC 3" "C-3")
    (myinit-define-kbd "M-SPC 4" "C-4")
    (myinit-define-kbd "M-SPC 5" "C-5")
    (myinit-define-kbd "M-SPC 6" "C-6")
    (myinit-define-kbd "M-SPC 7" "C-7")
    (myinit-define-kbd "M-SPC 8" "C-8")
    (myinit-define-kbd "M-SPC 9" "C-9")
    (myinit-define-kbd "M-SPC 0" "C-0")
    (myinit-define-kbd "M-SPC -" "C--")
    (myinit-define-kbd "M-SPC =" "C-=")

    ;; First row shifted.
    (myinit-define-kbd "M-SPC ~" "C-~")
    (myinit-define-kbd "M-SPC !" "C-!")
    (myinit-define-kbd "M-SPC @" "C-@")
    (myinit-define-kbd "M-SPC #" "C-#")
    (myinit-define-kbd "M-SPC $" "C-$")
    (myinit-define-kbd "M-SPC %" "C-%")
    (myinit-define-kbd "M-SPC ^" "C-^")
    (myinit-define-kbd "M-SPC &" "C-&")
    (myinit-define-kbd "M-SPC *" "C-*")
    (myinit-define-kbd "M-SPC (" "C-(")
    (myinit-define-kbd "M-SPC )" "C-)")
    (myinit-define-kbd "M-SPC _" "C-_")
    (myinit-define-kbd "M-SPC +" "C-+")

    ;; Second row.
    (myinit-define-kbd "M-SPC [" "C-[")
    (myinit-define-kbd "M-SPC ]" "C-]")
    (myinit-define-kbd "M-SPC \\" "C-\\")

    ;; Second row shifted.
    (myinit-define-kbd "M-SPC {" "C-{")
    (myinit-define-kbd "M-SPC }" "C-}")
    (myinit-define-kbd "M-SPC |" "C-|")

    ;; Third row.
    (myinit-define-kbd "M-SPC ;" "C-;")
    (myinit-define-kbd "M-SPC '" "C-'")

    ;; Third row shifted.
    (myinit-define-kbd "M-SPC :" "C-:")
    (myinit-define-kbd "M-SPC \"" "C-\"")

    ;; Fourth row.
    (myinit-define-kbd "M-SPC ," "C-,")
    (myinit-define-kbd "M-SPC ." "C-.")
    (myinit-define-kbd "M-SPC /" "C-/")

    ;; Fourth row shifted.
    (myinit-define-kbd "M-SPC <" "C-<")
    (myinit-define-kbd "M-SPC >" "C->")
    (myinit-define-kbd "M-SPC ?" "C-?")

    ;; Alphabet. Prefix keymaps `x' and `c' is an exception case.
    ;; `z' not used in Emacs.
    (myinit-define-kbd "M-SPC a" "C-a")
    (myinit-define-kbd "M-SPC b" "C-b")
    (myinit-define-kbd "M-SPC d" "C-d")
    (myinit-define-kbd "M-SPC e" "C-e")
    (myinit-define-kbd "M-SPC h" "C-h")
    (myinit-define-kbd "M-SPC i" "C-i")
    (myinit-define-kbd "M-SPC j" "C-j")
    (myinit-define-kbd "M-SPC k" "C-k")
    (myinit-define-kbd "M-SPC l" "C-l")
    (myinit-define-kbd "M-SPC m" "C-m")
    (myinit-define-kbd "M-SPC n" "C-n")
    (myinit-define-kbd "M-SPC o" "C-o")
    (myinit-define-kbd "M-SPC p" "C-p")
    (myinit-define-kbd "M-SPC q" "C-q")
    (myinit-define-kbd "M-SPC r" "C-r")
    (myinit-define-kbd "M-SPC s" "C-s")
    (myinit-define-kbd "M-SPC t" "C-t")
    (myinit-define-kbd "M-SPC u" "C-u")
    (myinit-define-kbd "M-SPC v" "C-v")
    (myinit-define-kbd "M-SPC w" "C-w")
    (myinit-define-kbd "M-SPC y" "C-y")

    ;; Alphabet shifted. Prefix keymaps `X' and `C' is an exception case.
    ;; `Z' not used in Emacs.
    (myinit-define-kbd "M-SPC A" "C-S-a")
    (myinit-define-kbd "M-SPC B" "C-S-b")
    (myinit-define-kbd "M-SPC D" "C-S-d")
    (myinit-define-kbd "M-SPC E" "C-S-e")
    (myinit-define-kbd "M-SPC F" "C-S-f")
    (myinit-define-kbd "M-SPC G" "C-S-g")
    (myinit-define-kbd "M-SPC H" "C-S-h")
    (myinit-define-kbd "M-SPC I" "C-S-i")
    (myinit-define-kbd "M-SPC J" "C-S-j")
    (myinit-define-kbd "M-SPC K" "C-S-k")
    (myinit-define-kbd "M-SPC L" "C-S-l")
    (myinit-define-kbd "M-SPC M" "C-S-m")
    (myinit-define-kbd "M-SPC N" "C-S-n")
    (myinit-define-kbd "M-SPC O" "C-S-o")
    (myinit-define-kbd "M-SPC P" "C-S-p")
    (myinit-define-kbd "M-SPC Q" "C-S-q")
    (myinit-define-kbd "M-SPC R" "C-S-r")
    (myinit-define-kbd "M-SPC S" "C-S-s")
    (myinit-define-kbd "M-SPC T" "C-S-t")
    (myinit-define-kbd "M-SPC U" "C-S-u")
    (myinit-define-kbd "M-SPC V" "C-S-v")
    (myinit-define-kbd "M-SPC W" "C-S-w")
    (myinit-define-kbd "M-SPC Y" "C-S-y")))

;;; init-myinit.el ends here
