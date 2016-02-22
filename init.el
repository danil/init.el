;;; init.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2016 Danil <danil@kutkevich.org>.
;; Author: Danil <danil@kutkevich.org>
;; Version: 0.0.1
;; Package-Requires: ((cask) (my-init))
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

(require 'my-init "~/.emacs.d/my-init.el")

(custom-set-variables
 '(my-init--safe-modes-hooks
   '(
     ;; mail-mode-hook
     ;; whitespace-mode-hook
     autoconf-mode-hook
     awk-mode-hook
     c-mode-hook
     change-log-mode-hook
     coffee-mode-hook
     conf-mode-hook
     css-mode-hook
     dockerfile-mode-hook
     ferm-mode-hook
     fish-mode-hook
     git-commit-mode-hook
     go-mode-hook
     haml-mode-hook
     haskell-mode-hook
     html-mode-hook
     jade-mode-hook
     java-mode-hook
     js-mode-hook
     js2-mode-hook
     less-css-mode-hook
     lisp-mode-hook
     lua-mode-hook
     makefile-gmake-mode-hook
     markdown-mode-hook
     mediawiki-mode-hook
     nginx-mode-hook
     nroff-mode-hook
     nxml-mode-hook
     org-mode-hook
     pascal-mode-hook
     perl-mode-hook
     php-mode-hook
     python-mode-hook
     rhtml-mode-hook
     ruby-mode-hook
     rust-mode-hook
     sass-mode-hook
     sgml-mode-hook
     sh-mode-hook
     sieve-mode-hook
     slim-mode-hook
     sql-mode-hook
     text-mode-hook
     toml-mode-hook
     web-mode-hook
     xml-mode-hook
     yaml-mode-hook
     ))

 '(my-init--programming-modes-hooks
   (append my-init--safe-modes-hooks
           '(clojure-mode-hook
             emacs-lisp-mode-hook)))

 '(my-init--auto-completion-modes-hooks
   (append my-init--programming-modes-hooks
           '(shell-mode-hook)))

 '(my-init--read-only-modes-hooks
   (append my-init--safe-modes-hooks
           '(
             Info-mode-hook
             Man-mode-hook
             ag-mode-hook
             cider-stacktrace-mode-hook
             compilation-mode-hook
             dired-mode-hook
             help-mode-hook
             ibuffer-mode-hook
             magit-branch-manager-mode-hook
             magit-commit-mode-hook
             magit-diff-mode-hook
             magit-log-mode-hook
             magit-process-mode-hook
             magit-status-mode-hook
             occur-mode-hook
             )))

 '(my-init--ruby-tools-hooks
   '(
     awk-mode-hook
     coffee-mode-hook
     conf-mode-hook
     conf-space-mode-hook
     conf-xdefaults-mode-hook
     css-mode-hook
     emacs-lisp-mode-hook
     haml-mode-hook
     haskell-mode-hook
     html-mode-hook
     java-mode-hook
     js-mode-hook
     js2-mode-hook
     lisp-mode-hook
     lua-mode-hook
     makefile-gmake-mode-hook
     markdown-mode-hook
     nxml-mode-hook
     org-mode-hook
     perl-mode-hook
     php-mode-hook
     rhtml-mode-hook
     ruby-mode-hook
     sass-mode-hook
     scss-mode-hook
     sgml-mode-hook
     sh-mode-hook
     shell-mode-hook
     slim-mode-hook
     sql-mode-hook
     xml-mode-hook
     yaml-mode-hook
     )))

(defvar my-recipes ())

(defun my-recipe (recipes)
  (dolist (recipe recipes) (add-to-list 'my-recipes recipe)))

;; (my-recipe '(erise))
;; (my-recipe '(mmm-mode))
;; (my-recipe '(flycheck-rust)) ;buggy(

(my-recipe '(abbrev))
(my-recipe '(add-log))
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
(my-recipe '(calendar))
(my-recipe '(cc-mode))
(my-recipe '(cc-vars))

(my-recipe '(cider))
(my-recipe '(clojure-mode))
(my-recipe '(smartparens))

(my-recipe '(coffee-mode))
(my-recipe '(column-marker))
(my-recipe '(comint))
(my-recipe '(compile))
(my-recipe '(completion-ignored-extensions))
(my-recipe '(conf-mode))
(my-recipe '(css))
(my-recipe '(cua))
(my-recipe '(deft))
(my-recipe '(desktop))
(my-recipe '(diff-mode))
(my-recipe '(diffview))

(my-recipe '(dired))
(my-recipe '(dired-reuse-directory-buffer))
(my-recipe '(direx))

(my-recipe '(discover-my-major))
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
(my-recipe '(git-gutter))
(my-recipe '(git-timemachine))
(my-recipe '(gitignore-mode))
(my-recipe '(go-autocomplete))
(my-recipe '(go-mode))
(my-recipe '(gotest))
(my-recipe '(grep))
(my-recipe '(haml-mode)) ;depends from ruby-mode due to ruby-toggle-hash-syntax
(my-recipe '(help))
(my-recipe '(help-mode))
(my-recipe '(hi-lock))
(my-recipe '(hideshow))
(my-recipe '(highlight-symbol)) ;(my-recipe '(idle-highlight-global-mode highlight-global))
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
(my-recipe '(magit-log))

(my-recipe '(make-mode))
(my-recipe '(markdown-mode))
(my-recipe '(mediawiki))
(my-recipe '(menu-bar))
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
(my-recipe '(narrow-indirect))
(my-recipe '(nginx-mode))
(my-recipe '(nodejs))
(my-recipe '(nodejs-repl))
(my-recipe '(nxml-mode))
(my-recipe '(occur-edit-mode))
(my-recipe '(occur-mode))
(my-recipe '(org-mode org-ac))
(my-recipe '(org-mode))
(my-recipe '(paren))
(my-recipe '(php-mode))
(my-recipe '(point-stack))

(my-recipe '(projectile))
(my-recipe '(projectile-rails))

(my-recipe '(python))
(my-recipe '(quickrun))
(my-recipe '(rainbow-delimiters))
(my-recipe '(rainbow-mode))
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
(my-recipe '(slim-mode))

(my-recipe '(rich-minority))
(my-recipe '(smart-mode-line))

(my-recipe '(sort))
(my-recipe '(sql))
(my-recipe '(sql-mode))
(my-recipe '(sql-postgres))
(my-recipe '(subword-mode))
(my-recipe '(toml-mode))
(my-recipe '(transpose-frame))
(my-recipe '(twittering-mode))
(my-recipe '(undo-tree))
(my-recipe '(uniquify))
(my-recipe '(vlf))
(my-recipe '(web-mode))
(my-recipe '(window))
(my-recipe '(window-numbering))
(my-recipe '(winner-mode))
(my-recipe '(woman))
(my-recipe '(yaless-mode))
(my-recipe '(yaml-mode))
(my-recipe '(yascroll))
(my-recipe '(yasnippet))
;; (my-recipe '(yasnippets))

;;; Load my recipes.
(autoload '-difference "dash" nil t)
(dolist (recipe my-recipes)
  (load-file (format "%s/recipes/init-%s.el" user-emacs-directory recipe)))

;;; init.el ends here
