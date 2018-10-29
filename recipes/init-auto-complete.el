;;; init-auto-complete.el --- This file is part of Danil <danil@kutkevich.org> home.

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

;; The common sources for all modes
;; <https://github.com/gorakhargosh/emacs.d/blob/master/config-completion.el>.
(custom-set-variables
 '(ac-auto-show-menu nil)
 '(ac-comphist-file (expand-file-name (concat "~/.emacs.var"
                                              "/ac-comphist.dat")))
 '(ac-delay 0.7) ;tradeoff between typing speed and performance
 ;; '(ac-flycheck-poll-completion-end-interval 1.1)
 '(ac-sources
   '(ac-source-abbrev
     ac-source-words-in-buffer
     ac-source-words-in-same-mode-buffers
     ac-source-files-in-current-dir
     ac-source-filename
     ac-source-dictionary
     ac-source-yasnippet)))

(add-hook 'after-init-hook 'myinit-auto-complete)

(defun myinit-auto-complete ()
  "My init."

  ;; <http://stackoverflow.com/questions/23232982/emacs-cannot-load-auto-complete-package#23234880>.
  (ac-config-default)

  (myinit-after-load 'auto-complete-config
    (add-to-list 'ac-dictionary-directories
                 (expand-file-name (concat user-emacs-directory
                                           "my-auto-complete/dict")
                                   default-directory))
    (dolist (mode '( ;<http://stackoverflow.com/questions/10779636/emacs-auto-complete-key-binding-didnt-work>
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
      (add-to-list 'ac-modes mode))
    (ac-linum-workaround) ;<https://github.com/auto-complete/auto-complete/blob/da864398a96805a2c79ac61fadeebd420ccb3cdc/doc/manual.md#linum-mode-tries-to-display-the-line-numbers-even-for-the-comletion-menu--linum-mode-bug>
    (setq ac-ignore-case nil) ;preserve capitalization <http://stackoverflow.com/questions/15637536/how-do-i-preserve-capitalization-when-using-autocomplete-in-emacs>
    (setq ac-disable-faces (quote (font-lock-doc-face))))

  (myinit-after-load 'auto-complete
    ;; (define-key ac-complete-mode-map "\C-n" 'ac-next)
    ;; (define-key ac-complete-mode-map "\C-p" 'ac-previous)

    ;; Remove auto-complet from enter/return keys
    ;; <http://stackoverflow.com/questions/18461584/emacs-autocomplete-disable-ret-to-enter#18462502>.
    (define-key ac-completing-map "\r" nil)
    (define-key ac-completing-map [return] nil))

  (myinit-add-mode-to-hooks (lambda ()
                              (add-to-list 'ac-sources
                                           'ac-source-css-property))
                            '(less-css-mode-hook
                              sass-mode-hook
                              scss-mode-hook)))

;;; init-auto-complete.el ends here
