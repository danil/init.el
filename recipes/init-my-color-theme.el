;;; init-my-color-theme.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2016 Danil <danil@kutkevich.org>.
;; Author: Danil <danil@kutkevich.org>
;; Version: 0.0.1
;; Package-Requires: ((my-init))
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

;;; My color theme.
;;; Color light and dark themes toggle
;;; <http://www.gnu.org/software/emacs/manual/html_node/emacs/Faces.html>.

;; (setq frame-background-mode 'light)
(setq frame-background-mode 'dark)

(defface my-default '((t :inherit default))
  "Face name to use for my customization."
  :group 'my-default)

(set-face-attribute 'header-line nil :inherit nil)
;; (set-face-background 'region nil)
;; (set-background-color "#0.0.1f")

(set-cursor-color "red") ;#aa0000

(defface ido-only-match
  '((t (:inherit ido-first-match)))
  "Face used by Ido for highlighting only match."
  :group 'ido)

(defface sh-heredoc
  '((t (:inherit font-lock-doc-face)))
  "Face to show a here-document"
  :group 'sh-indentation)

(defface helm-selection
  '((((background dark)) :background nil :underline t)
    (((background light)) :background nil :underline t))
  "Face for currently selected item in the helm buffer."
  :group 'helm)

(defface helm-source-header
  '((((background dark))
     :background nil
     :foreground "RoyalBlue1"
     :weight bold :height 1.3 :family "Monospace")
    (((background light))
     :background nil
     :foreground nil
     :weight bold :height 1.3 :family "Monospace"))
  "Face for source header in the helm buffer."
  :group 'helm)

(defface helm-ff-directory
  '((t (:inherit dired-directory)))
  "Face used for directories in `helm-find-files'."
  :group 'helm-files)

(defface helm-buffer-directory
  '((t (:inherit dired-directory)))
  "Face used for directories in `helm-buffers-list'."
  :group 'helm-buffers)

(defface ace-jump-face-foreground
  '((t (:inherit lazy-highlight)))
  "Face for foreground of AceJump motion"
  :group 'ace-jump)

(cond ((equal frame-background-mode 'light)
       (set-face-attribute 'my-default nil :foreground nil :background nil)
       (setq my-lazy-highlight-background "yellow1") ;lightgoldenrod2
       (setq my-match-foreground "lightskyblue1")

       (setq my-line-numbers-foreground "black")
       (setq my-line-numbers-background "gray90")
       (set-face-attribute 'lazy-highlight nil
                           :foreground my-match-foreground
                           :background "magenta3");"orchid3");"VioletRed")
       )
      ((equal frame-background-mode 'dark)
       (setq my-line-numbers-foreground "DarkGray") ;DimGray
       (setq my-line-numbers-background "gray25")
       ;; Region.
       ;; (setq my-face-reginon-background "#002b36") ;#2E3436 ;set selection background color
       (set-face-attribute 'region nil :inverse-video t)
       ;; (set-face-attribute 'region nil
       ;;                     :foreground "black"
       ;;                     :background "yellow2")

       ;; Matches other than the current one by Isearch and Query Replace
       ;; <http://www.gnu.org/software/emacs/manual/html_node/emacs/Standard-Faces.html>.
       ;; (set-face-background 'lazy-highlight "#002b36")
       (set-face-attribute 'lazy-highlight nil
                           :foreground "black"
                           :background "yellow1") ;OrangeRed3 ;brown4 ;indianRed4 ;SaddleBrown ;maroon4 ;red ;OrangeRed3 ;gray20 ;gray40

       (set-face-attribute 'match nil
                           :foreground "black"
                           :background "maroon3")
       (set-face-background 'highlight "#002b36")
       ;; (set-face-attribute 'isearch-fail nil :foreground "black")
       (set-face-foreground 'success "Green4") ;Green1
       (set-face-foreground 'warning "red") ;DarkOrange
       ))

;;; init-my-color-theme.el ends here
