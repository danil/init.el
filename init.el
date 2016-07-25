;;; init.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2016 Danil <danil@kutkevich.org>.
;; Author: Danil <danil@kutkevich.org>
;; Version: 0.0.1
;; Package-Requires: ((cask) (myinit))
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

;;; Files without extension.
;;; Use regexp "\\`[^.]+\\'" and `auto-mode-alist` function to
;;; associate mode with file without extension.
;;; For example `/path/to/file`.
;;; <https://www.reddit.com/r/emacs/comments/41sazw/associate_major_mode_with_files_without_extensions/#thing_t1_cz6kxgi>.

;; Danil <http://emacswiki.org/DotEmacsDotD>,
;; <http://emacs.stackexchange.com/questions/1/are-there-any-advantages-to-using-emacs-d-init-el-instead-of-emacs>.

;;; Truncation of Lines (toggle-truncate-lines)
;;; <http://emacswiki.org/emacs/TruncateLines>.
(set-default 'truncate-lines t) ;wrap long lines

(setq calendar-week-start-day t)
(setq system-time-locale "C")

;; Number of bytes of consing between garbage collections.
(setq gc-cons-threshold 4000000) ;4 megabyte

(global-font-lock-mode t)

;;; Put <http://www.gnu.org/software/emacs/manual/html_node/elisp/Symbol-Plists.html>.
;; Horizontal Scrolling
;; <http://gnu.org/software/emacs/manual/html_node/emacs/Horizontal-Scrolling.html#Horizontal-Scrolling>.
(put 'scroll-left 'disabled nil)
(put 'upcase-region 'disabled nil)

;;; My custom variables.
(setq custom-file "~/.emacs.d/my-custom-variables.el")
(load custom-file)

;;; Cask.
;;; Initialize Elpa packages via Cask
;;; <http://cask.readthedocs.org/en/latest/guide/usage.html#usage>.
(require 'cask "~/.cask/cask.el")
(cask-initialize)

(require 'myinit "~/.emacs.d/myinit.el")

(defvar myinit-map (make-sparse-keymap)
  "Default keymap for myinit commands.")

(custom-set-variables
 '(my-init--safe-modes
   '(
     ;; mail-mode
     ;; whitespace-mode
     autoconf-mode
     awk-mode
     c-mode
     change-log-mode
     coffee-mode
     conf-mode
     conf-space-mode
     css-mode
     dockerfile-mode
     ebuild-mode
     ferm-mode
     fish-mode
     git-commit-mode
     gitconfig-mode
     gitignore-mode
     go-mode
     haml-mode
     haskell-mode
     html-mode
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

 '(my-init--programming-modes
   (append my-init--safe-modes
           '(clojure-mode
             emacs-lisp-mode)))

 '(my-init--auto-completion-modes
   (append my-init--programming-modes
           '(shell-mode)))

 '(my-init--read-only-modes
   (append my-init--safe-modes
           '(
             Info-mode
             Man-mode
             ag-mode
             cider-stacktrace-mode
             compilation-mode
             dired-mode
             help-mode
             ibuffer-mode
             magit-branch-manager-mode
             magit-commit-mode
             magit-diff-mode
             magit-log-mode
             magit-process-mode
             magit-status-mode
             occur-mode
             )))

 '(my-init--toggle-quotes-modes
   '(
     awk-mode
     coffee-mode
     conf-mode
     conf-space-mode
     conf-xdefaults-mode
     css-mode
     emacs-lisp-mode
     haml-mode
     haskell-mode
     html-mode
     java-mode
     js-mode
     js2-mode
     lisp-mode
     lua-mode
     makefile-gmake-mode
     markdown-mode
     nxml-mode
     org-mode
     perl-mode
     php-mode
     rhtml-mode
     ruby-mode
     sass-mode
     scss-mode
     sgml-mode
     sh-mode
     shell-mode
     slim-mode
     sql-mode
     xml-mode
     yaml-mode
     ))

 '(my-init--modal-modes (append my-init--programming-modes
                                '(
                                  ;; shell-mode
                                  ;; sql-interactive-mode
                                  ))))

(dolist (mode my-init--safe-modes)
  (add-to-list 'my-init--safe-modes-hooks
               (intern (concat (symbol-name mode) "-hook"))))

(dolist (mode my-init--programming-modes)
  (add-to-list 'my-init--programming-modes-hooks
               (intern (concat (symbol-name mode) "-hook"))))

(dolist (mode my-init--auto-completion-modes)
  (add-to-list 'my-init--auto-completion-modes-hooks
               (intern (concat (symbol-name mode) "-hook"))))

(dolist (mode my-init--read-only-modes)
  (add-to-list 'my-init--read-only-modes-hooks
               (intern (concat (symbol-name mode) "-hook"))))

(dolist (mode my-init--toggle-quotes-modes)
  (add-to-list 'my-init--toggle-quotes-modes-hooks
               (intern (concat (symbol-name mode) "-hook"))))

(dolist (mode my-init--modal-modes)
  (add-to-list 'my-init--modal-modes-hooks
               (intern (concat (symbol-name mode) "-hook"))))

(defvar my-recipes ())

(defun my-recipe (recipes)
  (dolist (recipe recipes) (add-to-list 'my-recipes recipe)))

;; (my-recipe '(erise))
;; (my-recipe '(mmm-mode))
;; (my-recipe '(flycheck-rust)) ;buggy(

(my-recipe '(abbrev))
(my-recipe '(ag))
(my-recipe '(align))
(my-recipe '(ansi-color))
(my-recipe '(anzu))

(my-recipe '(auto-complete))
(my-recipe '(auto-complete-chunk))
;; (my-recipe '(ac-html-bootstrap))
(my-recipe '(ac-html))
(my-recipe '(ac-ispell))

(my-recipe '(bash-completion))
(my-recipe '(bytecomp))
(my-recipe '(calendar))
(my-recipe '(cc-mode))
(my-recipe '(cc-vars))

(my-recipe '(cider))
(my-recipe '(clojure-mode))

(my-recipe '(column-marker))
(my-recipe '(comint))
(my-recipe '(compile))
(my-recipe '(completion-ignored-extensions))
(my-recipe '(conf-mode))
(my-recipe '(corral)) ;smartparens replacement (quotes/parentheses/delimiters manager)
(my-recipe '(css))
(my-recipe '(cua))
(my-recipe '(cycle-quotes))
(my-recipe '(deft))
(my-recipe '(desktop))
(my-recipe '(diff-mode))
(my-recipe '(diffview))
(my-recipe '(dim))

(my-recipe '(dired))
(my-recipe '(dired-reuse-directory-buffer))
(my-recipe '(direx))
(my-recipe '(wdired))

(my-recipe '(disp-table-line-wrap-and-truncation))
(my-recipe '(disp-table-vertical-border))
(my-recipe '(dockerfile-mode))
(my-recipe '(dumb-jump))
(my-recipe '(ediff))
(my-recipe '(elpa-mirror))
(my-recipe '(emacs-lisp-mode))
(my-recipe '(env))
(my-recipe '(etags-select))
(my-recipe '(ethan-wspace))
(my-recipe '(expand-region))
(my-recipe '(faces))
(my-recipe '(ferm-mode))
(my-recipe '(files))
(my-recipe '(fill))
(my-recipe '(find-temp-file))
(my-recipe '(fish-mode))
(my-recipe '(flycheck))
(my-recipe '(flycheck-bashate))
(my-recipe '(git-gutter))
(my-recipe '(git-timemachine))
(my-recipe '(gitignore-mode))
(my-recipe '(go-autocomplete))
(my-recipe '(go-mode))
(my-recipe '(google-translate))
(my-recipe '(gotest))
(my-recipe '(haml-mode)) ;depends from ruby-mode due to ruby-toggle-hash-syntax
(my-recipe '(help))
(my-recipe '(hi-lock))
(my-recipe '(hideshow))
(my-recipe '(highlight-symbol)) ;(my-recipe '(idle-highlight-global-mode highlight-global))
(my-recipe '(hl-line))
(my-recipe '(ibuffer))

(my-recipe '(crm-custom))
(my-recipe '(ido))
(my-recipe '(ido-clever-match))
(my-recipe '(ido-describe-bindings))
(my-recipe '(ido-occur))
(my-recipe '(ido-ubiquitous))
(my-recipe '(ido-vertical-mode))
(my-recipe '(ido-yes-or-no))
(my-recipe '(smex))

(my-recipe '(kill-ring-ido))
(my-recipe '(recentf))
(my-recipe '(recentf-ido-find-file))

(my-recipe '(ielm))
(my-recipe '(indent))
(my-recipe '(info))
(my-recipe '(interprogram))
(my-recipe '(isearch))
(my-recipe '(ispell))

;; JavaScript.
(my-recipe '(coffee-mode))
(my-recipe '(js-mode))
(my-recipe '(js2-mode))
(my-recipe '(json-mode))
(my-recipe '(json-reformat))

(my-recipe '(kill-emacs))
(my-recipe '(kill-ring))

(my-recipe '(linum))
(my-recipe '(linum-format))

(my-recipe '(lisp-mode))
(my-recipe '(lua-mode))

(my-recipe '(magit))
(my-recipe '(magit-blame))

(my-recipe '(markdown-mode))
(my-recipe '(markdownfmt))

(my-recipe '(make-mode))
(my-recipe '(mediawiki))
(my-recipe '(menu-bar))
(my-recipe '(modalka))
(my-recipe '(multi-compile))
(my-recipe '(multiple-cursors))
(my-recipe '(my-backspace-fix))
(my-recipe '(my-beginning-of-line))
(my-recipe '(my-color-theme))
(my-recipe '(my-project))
(my-recipe '(my-repeat-last-key-command))
(my-recipe '(my-shell-command-on-current-file))
(my-recipe '(my-string-inflections))
(my-recipe '(my-sum-numbers-in-region))
(my-recipe '(my-tags))
(my-recipe '(my-uniquify))
(my-recipe '(myinit))
(my-recipe '(narrow-indirect))
(my-recipe '(nginx-mode))
(my-recipe '(nodejs))
(my-recipe '(nodejs-repl))
(my-recipe '(occur-mode))
(my-recipe '(org-mode org-ac))
(my-recipe '(org-mode))
(my-recipe '(origami))
(my-recipe '(paren))
(my-recipe '(point-stack))

(my-recipe '(projectile))
(my-recipe '(projectile-rails))

(my-recipe '(python))
(my-recipe '(quickrun))
(my-recipe '(rainbow-delimiters))
(my-recipe '(rainbow-mode))
(my-recipe '(restclient))
(my-recipe '(rbenv))
(my-recipe '(re-builder))
(my-recipe '(recentf))
(my-recipe '(replace))

(my-recipe '(rspec-compilation-mode))
(my-recipe '(rspec-mode))
(my-recipe '(ruby-hash-syntax))
(my-recipe '(ruby-mode))
(my-recipe '(ruby-pry))
(my-recipe '(ruby-refactor))
(my-recipe '(ruby-tools))

(my-recipe '(savehist))
(my-recipe '(saveplace))
(my-recipe '(scss-mode))
(my-recipe '(sgml-mode))
(my-recipe '(sh-script))
(my-recipe '(shell))
(my-recipe '(simp))
(my-recipe '(simple))

(my-recipe '(rich-minority))
(my-recipe '(smart-mode-line))

(my-recipe '(sort))
(my-recipe '(sql))
(my-recipe '(sql-mode))
(my-recipe '(sql-postgres))
(my-recipe '(subword-mode))
(my-recipe '(toml-mode))
(my-recipe '(transpose-frame))
(my-recipe '(undo-tree))
(my-recipe '(uniquify))
(my-recipe '(vlf))
(my-recipe '(web-mode))
(my-recipe '(window))
(my-recipe '(window-numbering))
(my-recipe '(winner-mode))
(my-recipe '(yaml-mode))
(my-recipe '(yascroll))
(my-recipe '(yasnippet))
;; (my-recipe '(yasnippets))

;;; Load my recipes.
(autoload '-difference "dash" nil t)
(dolist (recipe my-recipes)
  (load-file (format "%s/recipes/init-%s.el" user-emacs-directory recipe)))

(myinit-global-mode 1)
(add-hook 'after-init-hook (lambda () (global-set-key (kbd "C-v") myinit-map)))

;;; init.el ends here
