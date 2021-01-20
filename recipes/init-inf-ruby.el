;;; init-inf-ruby.el --- This file is part of Danil <https://danil.kutkevich.org> home.

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

;;; Comint mode (which shell mode and sql mode based on)
;;; <http://www.emacswiki.org/emacs/ComintMode#toc3>.

(add-hook 'after-init-hook 'noxrcp-inf-ruby)
(defun noxrcp-inf-ruby ()
  "No X recipe init."
  (if (boundp 'inf-ruby-mode-map) (noxrcp-inf-ruby--setup)
    (with-eval-after-load 'inf-ruby (noxrcp-inf-ruby--setup))))

(defun noxrcp-inf-ruby--setup ()
  (define-key inf-ruby-mode-map (kbd "TAB") nil)
  (noxrcp-comint--create-history-fn "noxrcp-inf-ruby--turn-on-history"
                                    "~/.irb-history")
  (add-hook 'inf-ruby-mode-hook 'noxrcp-inf-ruby--turn-on-history))

;; a-la inf-ruby-console-rails
(defun noxrcp-inf-ruby--projectile-rails-console (dir)
  "Run Rails console in DIR."
  (interactive (list (inf-ruby-console-read-directory 'rails)))
  (let* ((default-directory (file-name-as-directory dir))
         (env (inf-ruby-console-rails-env))
         (with-bundler (file-exists-p "Gemfile")))
    (inf-ruby-console-run
     (concat (when with-bundler "bundle exec ")
             "rails console -e "
             env
             ;; Note: this only has effect in Rails < 5.0 or >= 5.1.4
             ;; https://github.com/rails/rails/pull/29010
             (when (inf-ruby--irb-needs-nomultiline-p)
               " -- --nomultiline"))
     "rails")))

;;; init-inf-ruby.el ends here
