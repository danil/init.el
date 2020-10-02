;;; init-auto-complete.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2018 Danil <danil@kutkevich.org>.
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

(defcustom noxrcp-auto-complete--modes '()
  "Modes associated with `auto-complete-mode'."
  :group 'noxrcp)

;; The common sources for all modes
;; <https://github.com/gorakhargosh/emacs.d/blob/master/config-completion.el>.
(custom-set-variables
 '(noxrcp-auto-complete--modes '( ;<http://stackoverflow.com/questions/10779636/emacs-auto-complete-key-binding-didnt-work>
                                 autoconf-mode
                                 awk-mode
                                 c-mode
                                 cask-mode
                                 change-log-mode
                                 cider-mode
                                 cider-repl-mode
                                 clojure-mode
                                 coffee-mode
                                 conf-colon-mode
                                 conf-mode
                                 conf-space-mode
                                 conf-unix-mode
                                 conf-windows-mode
                                 conf-xdefaults-mode
                                 crontab-mode
                                 csharp-mode
                                 css-mode
                                 diff-mode
                                 dired-mode
                                 dockerfile-mode
                                 ebuild-mode
                                 elixir-mode
                                 emacs-lisp-mode
                                 enh-ruby-mode
                                 ferm-mode
                                 fish-mode
                                 git-commit-mode
                                 gitconfig-mode
                                 gitignore-mode
                                 go-mode
                                 haml-mode
                                 haskell-mode
                                 html-mode
                                 inf-mongo-mode
                                 inf-ruby-mode
                                 jade-mode
                                 java-mode
                                 js-mode
                                 js2-mode
                                 json-mode
                                 less-css-mode
                                 lisp-mode
                                 litcoffee-mode
                                 lua-mode
                                 magit-log-edit-mode
                                 makefile-gmake-mode
                                 markdown-mode
                                 mediawiki-mode
                                 mustache-mode
                                 nginx-mode
                                 nodejs-repl-mode
                                 nroff-mode
                                 nxml-mode
                                 org-mode
                                 perl-mode
                                 php-mode
                                 protobuf-mode
                                 python-mode
                                 redis-cli-mode
                                 restclient-mode
                                 rhtml-mode
                                 ruby-mode
                                 rust-mode
                                 sass-mode
                                 scss-mode
                                 sgml-mode
                                 sh-mode
                                 shell-mode
                                 sieve-mode
                                 slim-mode
                                 snippet-mode
                                 sql-interactive-mode
                                 sql-mode
                                 telnet-mode
                                 text-mode
                                 toml-mode
                                 wdired-mode
                                 web-mode
                                 xml-mode
                                 yaml-mode
                                 ))
 ;; '(ac-candidate-limit nil)
 ;; '(ac-candidate-menu-min 1)
 ;; '(ac-compatible-packages-regexp)
 ;; '(ac-comphist-threshold 0.7)
 ;; '(ac-dictionary-files '("~/.dict"))
 ;; '(ac-disable-inline nil)
 ;; '(ac-dwim t)
 ;; '(ac-expand-on-auto-complete t)
 ;; '(ac-flycheck-poll-completion-end-interval 1.1) ;; 0.5
 ;; '(ac-fuzzy-cursor-color "red")
 ;; '(ac-non-trigger-commands)
 ;; '(ac-quick-help-delay 1.5)
 ;; '(ac-show-menu-immediately-on-auto-complete t)
 ;; '(ac-stop-words nil)
 ;; '(ac-trigger-commands)
 ;; '(ac-trigger-commands-on-completing)
 ;; '(ac-trigger-key nil)
 ;; '(ac-use-comphist t)
 ;; '(ac-use-dictionary-as-stop-words t)
 ;; '(ac-use-fuzzy (and (locate-library "fuzzy") t))
 ;; '(ac-use-menu-map nil)
 ;; '(ac-use-overriding-local-map nil)
 ;; '(ac-use-quick-help t)
 ;; '(ac-user-dictionary nil)
 '(ac-auto-show-menu nil) ;; 0.8
 '(ac-auto-start nil)
 '(ac-comphist-file (expand-file-name (concat "~/.emacs.var" "/ac-comphist.dat"))) ;; (expand-file-name (concat (if (boundp 'user-emacs-directory) user-emacs-directory "~/.emacs.d/") "/ac-comphist.dat"))
 '(ac-delay 0) ;; 0.7 0.1 tradeoff between typing speed and performance
 '(ac-disable-faces '(font-lock-doc-face)) ;; font-lock-comment-face font-lock-string-face font-lock-doc-face
 '(ac-ignore-case nil) ;; 'smart preserve capitalization <http://stackoverflow.com/questions/15637536/how-do-i-preserve-capitalization-when-using-autocomplete-in-emacs>
 '(ac-sources
   '(ac-source-abbrev
     ac-source-words-in-buffer
     ac-source-words-in-same-mode-buffers
     ac-source-files-in-current-dir
     ac-source-filename
     ac-source-dictionary
     ac-source-yasnippet))
 )

(add-hook 'after-init-hook 'noxrcp-auto-complete)
(defun noxrcp-auto-complete ()
  "No X recipe init."
  ;; <http://stackoverflow.com/questions/23232982/emacs-cannot-load-auto-complete-package#23234880>.
  (if (boundp 'auto-complete-mode) (noxrcp-auto-complete--setup)
    (with-eval-after-load 'auto-complete (noxrcp-auto-complete--setup)))
  (dolist (hook '(
                  less-css-mode-hook
                  sass-mode-hook
                  scss-mode-hook
                  ))
    (add-hook hook 'noxrcp-auto-complete--setup-css))
  (ac-config-default))

(defun noxrcp-auto-complete--setup ()
  (add-to-list 'ac-dictionary-directories
               (expand-file-name (concat user-emacs-directory
                                         "my-auto-complete/dict")
                                 default-directory))
  (dolist (mode noxrcp-auto-complete--modes)
    (add-to-list 'ac-modes mode))
  (ac-linum-workaround) ;<https://github.com/auto-complete/auto-complete/blob/da864398a96805a2c79ac61fadeebd420ccb3cdc/doc/manual.md#linum-mode-tries-to-display-the-line-numbers-even-for-the-comletion-menu--linum-mode-bug>

  ;; (define-key ac-complete-mode-map "\C-n" 'ac-next)
  ;; (define-key ac-complete-mode-map "\C-p" 'ac-previous)
  (define-key ac-completing-map "\r" nil) ;; Remove auto-complet from enter/return keys <http://stackoverflow.com/questions/18461584/emacs-autocomplete-disable-ret-to-enter#18462502>.
  (define-key ac-completing-map [return] nil) ;; Remove auto-complet from enter/return keys <http://stackoverflow.com/questions/18461584/emacs-autocomplete-disable-ret-to-enter#18462502>.
  )

(defun noxrcp-auto-complete--setup-css ()
  (add-to-list 'ac-sources 'ac-source-css-property))

;; (defun noxrcp-auto-complete--grab-symbol ()
;;   "If point is at the end of a symbol, return it.
;; Otherwise, if point is not inside a symbol, return an empty string."
;;   (buffer-substring (point)
;;                     (save-excursion (skip-syntax-backward "w_") (point))))

;;; init-auto-complete.el ends here
