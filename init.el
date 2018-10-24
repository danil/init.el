;;; init.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2017 Danil <danil@kutkevich.org>.
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

;; ;; Added by Package.el.  This must come before configurations of
;; ;; installed packages.  Don't delete this line.  If you don't want it,
;; ;; just comment it out by adding a semicolon to the start of the line.
;; ;; You may delete these explanatory comments.
;; (package-initialize)

;;; <https://emacs.stackexchange.com/questions/3447/cannot-set-terminal-process-group-error-when-running-bash-script>,
;;; <https://stackoverflow.com/questions/12224909/is-there-a-way-to-get-my-emacs-to-recognize-my-bash-aliases-and-custom-functions>.
(setq shell-file-name "bash")

;;; Move deletd files into "trash"
;;; <http://emacs-fu.blogspot.ru/2009/05/using-systems-trash-when-deleting-files.html>.
;; (setq delete-by-moving-to-trash t)

;;; Truncation of Lines (toggle-truncate-lines)
;;; <http://emacswiki.org/emacs/TruncateLines>.
(set-default 'truncate-lines t) ;wrap long lines
(setq truncate-partial-width-windows nil) ;wrap long lines in buffers of any width

(setq system-time-locale "C")

;; Number of bytes of consing between garbage collections.
(setq gc-cons-threshold 4000000) ;4 megabyte

;;; Put <http://www.gnu.org/software/emacs/manual/html_node/elisp/Symbol-Plists.html>.
;; Horizontal Scrolling
;; <http://gnu.org/software/emacs/manual/html_node/emacs/Horizontal-Scrolling.html#Horizontal-Scrolling>.
(put 'scroll-left 'disabled nil)
(put 'upcase-region 'disabled nil)

;;; My custom variables.
(setq custom-file "~/.emacs.d/my-custom-variables.el")
(load custom-file)

;;; ElDoc annoying in all buffers/modes.
(global-eldoc-mode -1)

;;; Cask.
;;; Initialize Elpa packages via Cask
;;; <http://cask.readthedocs.org/en/latest/guide/usage.html#usage>.
(require 'cask "~/.cask/cask.el")
(cask-initialize)

(require 'myinit "~/.emacs.d/myinit.el")

(defvar myinit-map (make-sparse-keymap)
  "Default keymap for myinit commands.")

(defvar myinit-exec-map (make-sparse-keymap)
  "Exec keymap for myinit commands.")

(custom-set-variables
 '(myinit-safe-modes
   '(
     ;; mail-mode
     ;; whitespace-mode
     autoconf-mode
     awk-mode
     c-mode
     cask-mode
     change-log-mode
     coffee-mode
     conf-colon-mode
     conf-mode
     conf-space-mode
     conf-unix-mode
     conf-xdefaults-mode
     crontab-mode
     csharp-mode
     css-mode
     diff-mode
     dockerfile-mode
     ebuild-mode
     enh-ruby-mode
     ferm-mode
     fish-mode
     git-commit-mode
     gitconfig-mode
     gitignore-mode
     go-mode
     haml-mode
     haskell-mode
     hcl-mode
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

 '(myinit-programming-modes
   (append myinit-safe-modes
           '(clojure-mode
             emacs-lisp-mode)))

 '(myinit-auto-completion-modes
   (append myinit-programming-modes
           '(
             redis-cli-mode
             shell-mode
             telnet-mode
             wdired-mode
             )))

 '(myinit-read-only-modes
   (append myinit-safe-modes
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

 '(myinit-toggle-quotes-modes
   '(
     awk-mode
     cask-mode
     coffee-mode
     conf-mode
     conf-space-mode
     conf-xdefaults-mode
     csharp-mode
     css-mode
     emacs-lisp-mode
     enh-ruby-mode
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

 '(myinit-highlighted-digits-modes
   (append myinit-programming-modes
           '(shell-mode)))

 '(myinit-modal-modes (append myinit-programming-modes
                              '(
                                ;; shell-mode
                                ;; sql-interactive-mode
                                )))

 '(myinit-default-idle-timer-seconds 1))

(dolist (mode myinit-safe-modes)
  (add-to-list 'myinit-safe-modes-hooks
               (intern (concat (symbol-name mode) "-hook"))))

(dolist (mode myinit-programming-modes)
  (add-to-list 'myinit-programming-modes-hooks
               (intern (concat (symbol-name mode) "-hook"))))

(dolist (mode myinit-auto-completion-modes)
  (add-to-list 'myinit-auto-completion-modes-hooks
               (intern (concat (symbol-name mode) "-hook"))))

(dolist (mode myinit-read-only-modes)
  (add-to-list 'myinit-read-only-modes-hooks
               (intern (concat (symbol-name mode) "-hook"))))

(dolist (mode myinit-toggle-quotes-modes)
  (add-to-list 'myinit-toggle-quotes-modes-hooks
               (intern (concat (symbol-name mode) "-hook"))))

(dolist (mode myinit-highlighted-digits-modes)
  (add-to-list 'myinit-highlighted-digits-modes-hooks
               (intern (concat (symbol-name mode) "-hook"))))

(dolist (mode myinit-modal-modes)
  (add-to-list 'myinit-modal-modes-hooks
               (intern (concat (symbol-name mode) "-hook"))))

(defvar my-recipes ())

(defun my-recipe (recipes)
  (dolist (recipe recipes) (add-to-list 'my-recipes recipe)))

;; (my-recipe '(erise))
;; (my-recipe '(mmm-mode))
;; (my-recipe '(flycheck-rust)) ;buggy(

;; (require 'non-ascii-identifiers "~/.emacs.d/recipes/non-ascii-identifiers.el")
;; (my-recipe '(non-ascii-identifiers))

(my-recipe '(ag)) ;the silver searcher (ack replacement) <https://github.com/ggreer/the_silver_searcher>
(my-recipe '(pt)) ;the platinum searcher (ag and ack replacement) <https://github.com/monochromegane/the_platinum_searcher>

(my-recipe '(abbrev))
(my-recipe '(align))
(my-recipe '(ansi-color))
(my-recipe '(anzu))

;; (my-recipe '(ac-html-bootstrap))
(my-recipe '(ac-html))
(my-recipe '(ac-ispell))
(my-recipe '(auto-complete))
(my-recipe '(auto-complete-chunk))

(my-recipe '(bash-completion))
(my-recipe '(bookmark))
(my-recipe '(bytecomp))
(my-recipe '(calendar))
(my-recipe '(cc-mode))
(my-recipe '(cc-vars))
(my-recipe '(csharp-mode))

(my-recipe '(cider))
(my-recipe '(clojure-mode))

;; (my-recipe '(dim))
(my-recipe '(column-marker))
(my-recipe '(comint))
(my-recipe '(compile))
(my-recipe '(completion-ignored-extensions))
(my-recipe '(conf-mode))
(my-recipe '(corral)) ;smartparens replacement (quotes/parentheses/delimiters manager)
(my-recipe '(crontab-mode))
(my-recipe '(css))
(my-recipe '(cua))
(my-recipe '(cus-face))
(my-recipe '(custom))
(my-recipe '(cycle-quotes))
(my-recipe '(cyphejor))
(my-recipe '(deft))
(my-recipe '(desktop))
(my-recipe '(diff-mode))
(my-recipe '(diffview))
(my-recipe '(digit-groups))

;; (my-recipe '(dired-dups))
(my-recipe '(dired))
(my-recipe '(dired-aux))
(my-recipe '(dired-details))
(my-recipe '(diredfl))
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
(my-recipe '(font-core))

(my-recipe '(flycheck))
(my-recipe '(flycheck-bashate))

(my-recipe '(flycheck-gometalinter))
(my-recipe '(go-autocomplete))
(my-recipe '(go-mode))
(my-recipe '(godoctor))
(my-recipe '(gotest))

;;; Fringe <https://www.emacswiki.org/emacs/TheFringe>.
;; (my-recipe '(git-gutter))
(my-recipe '(diff-hl))
(my-recipe '(fringe))
(my-recipe '(linum))
(my-recipe '(linum-format))

(my-recipe '(git-timemachine))
(my-recipe '(gitignore-mode))
(my-recipe '(google-translate))
(my-recipe '(haproxy-mode))
(my-recipe '(hcl-mode))
(my-recipe '(help))
(my-recipe '(hi-lock))
(my-recipe '(hideshow))
(my-recipe '(highlight-static-regexps))
(my-recipe '(highlight-static-regexps-tmp))
(my-recipe '(highlight-symbol)) ;(my-recipe '(idle-highlight-global-mode highlight-global))
(my-recipe '(hl-line))
(my-recipe '(hl-todo))
(my-recipe '(hydra))

;; Ido.
;; (my-recipe '(flx-ido)) ; incompatible with `kill-ring-ido` from `browse-kill-ring` (ido fuzzy matching)
;; (my-recipe '(ido-describe-bindings))
;; (my-recipe '(ido-occur)) ; use swiper instead
;; (my-recipe '(recentf-ido-find-file))
;; (my-recipe '(smex))
(my-recipe '(ido-ubiquitous))
(my-recipe '(crm-custom))
(my-recipe '(ido))
(my-recipe '(ido-clever-match)) ; ido fuzzy matching
(my-recipe '(ido-vertical-mode))
(my-recipe '(ido-yes-or-no))
(my-recipe '(kill-ring-ido))

;; Ivy (is an ido replacement).
;; (my-recipe '(colir))
(require 'core-lib "~/.emacs.d/doom-emacs-core-lib.el") ; provide `add-hook!' which fixes `ivy's `ivy-truncate-lines'
(my-recipe '(counsel))
(my-recipe '(historian))
(my-recipe '(ivy))
(my-recipe '(ivy-historian))
(my-recipe '(swiper)) ; a-la ido-occur

(my-recipe '(ibuffer))
(my-recipe '(iedit)) ;isearch + edit is an a-la multiple-cursors-mode
(my-recipe '(ielm))
(my-recipe '(indent))
(my-recipe '(inf-mongo))
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

(my-recipe '(lisp-mode))
(my-recipe '(lua-mode))

(my-recipe '(magit))
(my-recipe '(magit-blame))

(my-recipe '(markdown-mode))
(my-recipe '(markdownfmt))

(my-recipe '(make-mode))
(my-recipe '(mediawiki))
(my-recipe '(menu-bar))
(my-recipe '(mouse))
(my-recipe '(multi-compile))
(my-recipe '(my-backspace-fix))
(my-recipe '(my-beginning-of-line))
(my-recipe '(my-color-theme))
(my-recipe '(my-project))
(my-recipe '(my-shell-command-on-current-file))
(my-recipe '(my-sort))
(my-recipe '(my-string-inflections))
(my-recipe '(my-sum-numbers-in-region))
(my-recipe '(my-tags))
(my-recipe '(my-uniquify-lines))
(my-recipe '(myinit))
(my-recipe '(narrow-indirect))
(my-recipe '(newcomment))
(my-recipe '(nginx-mode))
(my-recipe '(nodejs))
(my-recipe '(nodejs-repl))
(my-recipe '(occur-mode))
(my-recipe '(org-mode org-ac))
(my-recipe '(org-mode))
(my-recipe '(origami))

(my-recipe '(projectile))
(my-recipe '(projectile-rails))

(my-recipe '(paren))
(my-recipe '(php-mode))
(my-recipe '(python))
(my-recipe '(quickrun))
(my-recipe '(rainbow-delimiters))
(my-recipe '(rainbow-identifiers))
(my-recipe '(rainbow-mode))
(my-recipe '(re-builder))
(my-recipe '(recentf))
(my-recipe '(recentf))
(my-recipe '(recentf-ext))
(my-recipe '(redis))
(my-recipe '(replace))
(my-recipe '(restclient))
(my-recipe '(rg))
(my-recipe '(rust-mode))

;; (my-recipe '(rbenv))
(my-recipe '(enh-ruby-mode))
(my-recipe '(haml-mode)) ;depends from ruby-mode due to ruby-toggle-hash-syntax
(my-recipe '(inf-ruby))
(my-recipe '(robe))
(my-recipe '(rspec-compilation-mode))
(my-recipe '(rspec-mode))
(my-recipe '(ruby-hash-syntax))
(my-recipe '(ruby-mode))
(my-recipe '(ruby-pry))
(my-recipe '(ruby-refactor))
(my-recipe '(ruby-tools))

(my-recipe '(savehist))
(my-recipe '(saveplace))
(my-recipe '(scroll-bar))
(my-recipe '(scss-mode))
(my-recipe '(sgml-mode))
(my-recipe '(sh-script))
(my-recipe '(shell))
(my-recipe '(simp))
(my-recipe '(simple))
(my-recipe '(sort))
(my-recipe '(subword-mode))

(my-recipe '(mode-line))
(my-recipe '(rich-minority))
(my-recipe '(smart-mode-line))

(my-recipe '(sql))
(my-recipe '(sql-mode))
(my-recipe '(sql-mysql))
(my-recipe '(sql-postgres))

(my-recipe '(telnet))
(my-recipe '(tldr))
(my-recipe '(toml-mode))
(my-recipe '(transpose-frame))
(my-recipe '(undo-tree))
(my-recipe '(uniquify))
(my-recipe '(vc-hooks))
(my-recipe '(vlf))
(my-recipe '(web-mode))
(my-recipe '(window))
(my-recipe '(window-numbering))
(my-recipe '(winner-mode))
(my-recipe '(yaml-mode))
(my-recipe '(yasnippet))
;; (my-recipe '(yafolding))
;; (my-recipe '(yascroll))
;; (my-recipe '(yasnippets))

;;; Load my recipes.
(autoload '-difference "dash" nil t)
(dolist (recipe my-recipes)
  (let ((recipe-file (format "%srecipes/init-%s.el" user-emacs-directory recipe)))
    (if (file-readable-p recipe-file)
        (load-file recipe-file)
      (display-warning :warning
                       (format "Recipe file not found: %s" recipe-file)))))

(myinit-global-mode 1)

(add-hook 'after-init-hook 'myinit-init)

(defun myinit-init ()
  "Init."

  (define-key myinit-map (kbd "x") myinit-exec-map)

  (global-set-key (kbd "C-v") myinit-map))

;;; init.el ends here
