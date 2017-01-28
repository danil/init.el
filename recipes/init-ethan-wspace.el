;;; init-ethan-wspace.el --- This file is part of Danil <danil@kutkevich.org> home.

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

(defcustom myinit-ethan-wspace-modes-hooks '()
  "Major modes hooks associated with `ethan-wspace-mode'."
  :group 'myinit)

(defcustom myinit-modes-disallows-no-nl-eof '()
  "Major modes disallows no-nl-eof."
  :group 'myinit)

(defcustom myinit-modes-disallows-many-nls-eof '()
  "Major modes disallows many-nls-eof."
  :group 'myinit)

(defcustom myinit-modes-disallows-tabs '()
  "Major modes disallows tabs."
  :group 'myinit)

(defcustom myinit-modes-disallows-eol '()
  "Major modes disallows trailing whitespace at end of line."
  :group 'myinit)

(custom-set-variables
 '(myinit-ethan-wspace-modes-hooks myinit-programming-modes-hooks)
 '(myinit-modes-disallows-no-nl-eof myinit-programming-modes)
 '(myinit-modes-disallows-many-nls-eof myinit-programming-modes)
 '(myinit-modes-disallows-tabs '(
                                 autoconf-mode
                                 awk-mode
                                 cask-mode
                                 change-log-mode
                                 clojure-mode
                                 coffee-mode
                                 conf-colon-mode
                                 conf-mode
                                 conf-space-mode
                                 conf-unix-mode
                                 conf-xdefaults-mode
                                 csharp-mode
                                 css-mode
                                 dockerfile-mode
                                 emacs-lisp-mode
                                 ferm-mode
                                 fish-mode
                                 git-commit-mode
                                 gitconfig-mode
                                 gitignore-mode
                                 haml-mode
                                 haskell-mode
                                 html-mode
                                 inf-mongo-mode
                                 jade-mode
                                 java-mode
                                 js-mode
                                 js2-mode
                                 json-mode
                                 less-css-mode
                                 lisp-mode
                                 litcoffee-mode
                                 lua-mode
                                 markdown-mode
                                 mediawiki-mode
                                 nginx-mode
                                 nodejs-repl-mode
                                 nroff-mode
                                 nxml-mode
                                 org-mode
                                 pascal-mode
                                 perl-mode
                                 php-mode
                                 python-mode
                                 restclient-mode
                                 rhtml-mode
                                 ruby-mode
                                 rust-mode
                                 sass-mode
                                 sed-mode
                                 sgml-mode
                                 sh-mode
                                 sieve-mode
                                 slim-mode
                                 sql-mode
                                 systemd-mode
                                 text-mode
                                 toml-mode
                                 web-mode
                                 xml-mode
                                 yaml-mode
                                 ))
 '(myinit-modes-disallows-eol '(
                                autoconf-mode
                                awk-mode
                                c-mode
                                cask-mode
                                change-log-mode
                                clojure-mode
                                coffee-mode
                                conf-colon-mode
                                conf-mode
                                conf-space-mode
                                conf-unix-mode
                                conf-xdefaults-mode
                                crontab-mode
                                csharp-mode
                                css-mode
                                dockerfile-mode
                                ebuild-mode
                                emacs-lisp-mode
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
                                jade-mode
                                java-mode
                                js-mode
                                js2-mode
                                json-mode
                                less-css-mode
                                lisp-mode
                                litcoffee-mode
                                lua-mode
                                makefile-gmake-mode
                                mediawiki-mode
                                nginx-mode
                                nodejs-repl-mode
                                nroff-mode
                                nxml-mode
                                org-mode
                                pascal-mode
                                perl-mode
                                php-mode
                                python-mode
                                restclient-mode
                                rhtml-mode
                                ruby-mode
                                rust-mode
                                sass-mode
                                sed-mode
                                sgml-mode
                                sh-mode
                                sieve-mode
                                slim-mode
                                sql-mode
                                systemd-mode
                                text-mode
                                toml-mode
                                web-mode
                                xml-mode
                                yaml-mode
                               )))

(add-hook 'after-init-hook 'myinit-ethan-wspace)

(defun myinit-ethan-wspace ()
  "My init."

  (dolist (hook myinit-ethan-wspace-modes-hooks)
    (add-hook hook 'myinit-ethan-wspace--lazyinit))

  (myinit-after-load 'ethan-wspace
    (setq ethan-wspace-face-customized t) ;<http://github.com/glasserc/ethan-wspace/blob/master/lisp/ethan-wspace.el#L714>
    ;; (setq  ethan-wspace-mode-line-element nil) ;typically looks like: ew:tLNm
    (cond ((equal frame-background-mode 'dark)
           (set-face-background 'ethan-wspace-face "gray15")))))

(defun myinit-ethan-wspace--lazyinit ()
  "Run `ethan-wspace'."

  (myinit-run-with-idle-timer-in-current-buffer
   myinit-default-idle-timer-seconds nil
   (lambda ()
     (unless (boundp 'ethan-wspace-errors) (load "ethan-wspace"))
     (setq ethan-wspace-errors '())
     (make-local-variable 'ethan-wspace-errors)

     (when (member major-mode myinit-modes-disallows-no-nl-eof)
       (setq ethan-wspace-errors (push 'no-nl-eof ethan-wspace-errors)))

     (when (member major-mode myinit-modes-disallows-many-nls-eof)
       (setq ethan-wspace-errors (push 'many-nls-eof ethan-wspace-errors)))

     (when (member major-mode myinit-modes-disallows-tabs)
       (setq ethan-wspace-errors (push 'tabs ethan-wspace-errors)))

     (when (member major-mode myinit-modes-disallows-eol)
       (setq ethan-wspace-errors (push 'eol ethan-wspace-errors)))

     (ethan-wspace-mode))))

;;; init-ethan-wspace.el ends here
