;;; init.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2018 Danil <danil@kutkevich.org>.
;; Author: Danil <danil@kutkevich.org>
;; Version: 0.0.1
;; Package-Requires: ((cask) (noxrcp))
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

;; Narrowing <https://www.emacswiki.org/emacs/BasicNarrowing>,
;; <https://stackoverflow.com/questions/1893795/emacs-newbie-question-how-to-search-within-a-region#1893817>.
;; (put 'narrow-to-defun 'disabled nil)
;; (put 'narrow-to-page 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;;; My custom variables.
(setq custom-file "~/.emacs.d/my-custom-variables.el")
(load custom-file)

;;; counsel-yank-pop (swiper/ivy) in minibuffer.
(setq enable-recursive-minibuffers t)

;;; ElDoc annoying in all buffers/modes.
(global-eldoc-mode -1)

;;; Cask.
;;; Initialize Elpa packages via Cask
;;; <http://cask.readthedocs.org/en/latest/guide/usage.html#usage>.
(require 'cask "~/.cask/cask.el")
(cask-initialize)

(require 'noxrcp "~/.emacs.d/noxrcp.el")

(defvar noxrcp-map (make-sparse-keymap)
  "Default keymap for noxrcp commands.")

(defvar noxrcp-exec-map (make-sparse-keymap)
  "Exec keymap for noxrcp commands.")

(custom-set-variables
 '(noxrcp-safe-modes
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
     elixir-mode
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
     protobuf-mode
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

 '(noxrcp-programming-modes
   (append noxrcp-safe-modes
           '(
             clojure-mode
             emacs-lisp-mode
             )))

 '(noxrcp-auto-completion-modes
   (append noxrcp-programming-modes
           '(
             redis-cli-mode
             shell-mode
             telnet-mode
             wdired-mode
             )))

 '(noxrcp-read-only-modes
   (append noxrcp-safe-modes
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

 '(noxrcp-toggle-quotes-modes
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

 '(noxrcp-highlighted-digits-modes
   (append noxrcp-programming-modes
           '(shell-mode)))

 '(noxrcp-modal-modes (append noxrcp-programming-modes
                              '(
                                ;; shell-mode
                                ;; sql-interactive-mode
                                )))

 '(noxrcp-highlighted-digits-modes
   (append noxrcp-programming-modes
           '(shell-mode)))

 '(noxrcp-default-idle-timer-seconds 1))

(dolist (mode noxrcp-safe-modes)
  (add-to-list 'noxrcp-safe-modes-hooks
               (intern (concat (symbol-name mode) "-hook"))))

(dolist (mode noxrcp-programming-modes)
  (add-to-list 'noxrcp-programming-modes-hooks
               (intern (concat (symbol-name mode) "-hook"))))

(dolist (mode noxrcp-auto-completion-modes)
  (add-to-list 'noxrcp-auto-completion-modes-hooks
               (intern (concat (symbol-name mode) "-hook"))))

(dolist (mode noxrcp-read-only-modes)
  (add-to-list 'noxrcp-read-only-modes-hooks
               (intern (concat (symbol-name mode) "-hook"))))

(dolist (mode noxrcp-toggle-quotes-modes)
  (add-to-list 'noxrcp-toggle-quotes-modes-hooks
               (intern (concat (symbol-name mode) "-hook"))))

(dolist (mode noxrcp-highlighted-digits-modes)
  (add-to-list 'noxrcp-highlighted-digits-modes-hooks
               (intern (concat (symbol-name mode) "-hook"))))

(dolist (mode noxrcp-modal-modes)
  (add-to-list 'noxrcp-modal-modes-hooks
               (intern (concat (symbol-name mode) "-hook"))))

(defvar nox-recipes ())

(defun nox-recipe (recipes)
  (dolist (recipe recipes) (add-to-list 'nox-recipes recipe)))

;; (nox-recipe '(erise))
;; (nox-recipe '(mmm-mode))
;; (nox-recipe '(flycheck-rust)) ;buggy(

;; (require 'non-ascii-identifiers "~/.emacs.d/recipes/non-ascii-identifiers.el")
;; (nox-recipe '(non-ascii-identifiers))

(nox-recipe '(abbrev))
(nox-recipe '(align))
(nox-recipe '(ansi-color))
(nox-recipe '(anzu))

;; Company mode auto complete.
;; (nox-recipe '(company-ansible))
;; (nox-recipe '(company-edbi))
;; (nox-recipe '(company-ispell)) ;; very slow, see `noxrcp-counsel--company' function
;; (nox-recipe '(company-statistics))
;; (nox-recipe '(company-go)) ; error( Company: backend (company-go company-dabbrev-code company-gtags company-etags company-keywords) error "GOCODE PANIC: Please check your code by "go build"" with args (candidates keyword-i-type-now)
(nox-recipe '(company))
(nox-recipe '(company-css))
(nox-recipe '(company-dabbrev))
(nox-recipe '(company-dabbrev-code))
(nox-recipe '(company-elisp))
(nox-recipe '(company-erlang))
(nox-recipe '(company-inf-ruby))
(nox-recipe '(company-lua))
(nox-recipe '(company-nginx))
(nox-recipe '(company-shell))
(nox-recipe '(company-web))

(nox-recipe '(bash-completion))
(nox-recipe '(bindings))
(nox-recipe '(bookmark))
(nox-recipe '(browse-url))
(nox-recipe '(bytecomp))
(nox-recipe '(calendar))
(nox-recipe '(cc-mode))
(nox-recipe '(cc-vars))
(nox-recipe '(csharp-mode))

(nox-recipe '(cider))
(nox-recipe '(clojure-mode))

;; (nox-recipe '(dim))
(nox-recipe '(column-marker))
(nox-recipe '(comint))
(nox-recipe '(compile))
(nox-recipe '(completion-ignored-extensions))
(nox-recipe '(conf-mode))
(nox-recipe '(corral)) ;smartparens replacement (quotes/parentheses/delimiters manager)
(nox-recipe '(crontab-mode))
(nox-recipe '(css))
(nox-recipe '(cua))
(nox-recipe '(cus-face))
(nox-recipe '(custom))
(nox-recipe '(cycle-quotes))
(nox-recipe '(deft))
(nox-recipe '(desktop))
(nox-recipe '(diff-mode))
(nox-recipe '(diffview))
(nox-recipe '(digit-groups))

;; (nox-recipe '(dired-dups))
(nox-recipe '(dired))
(nox-recipe '(dired-aux))
(nox-recipe '(dired-details))
(nox-recipe '(diredfl))
(nox-recipe '(direx))
(nox-recipe '(pack))
(nox-recipe '(wdired))

(nox-recipe '(disp-table-line-wrap-and-truncation))
(nox-recipe '(disp-table-vertical-border))
(nox-recipe '(dockerfile-mode))
(nox-recipe '(dumb-jump))
(nox-recipe '(ediff))
(nox-recipe '(elisp-slime-nav))
(nox-recipe '(elixir-mode))
(nox-recipe '(elpa-mirror))
(nox-recipe '(emacs-lisp-mode))
(nox-recipe '(env))
(nox-recipe '(etags-select))
(nox-recipe '(ethan-wspace))
(nox-recipe '(expand-region))
(nox-recipe '(faces))
(nox-recipe '(ferm-mode))
(nox-recipe '(files))
(nox-recipe '(fill))
(nox-recipe '(find-temp-file))
(nox-recipe '(fish-mode))
(nox-recipe '(font-core))

;; fd a-la find replacement https://github.com/sharkdp/fd
(nox-recipe '(counsel-fd))
(nox-recipe '(fd-dired))

;; (nox-recipe '(flycheck-gometalinter))
;; (nox-recipe '(flycheck-bashate))
(nox-recipe '(flycheck))
(nox-recipe '(flycheck-golangci-lint))

(nox-recipe '(go-expr-completion))
(nox-recipe '(go-mode))
(nox-recipe '(go-stacktracer))
(nox-recipe '(godoctor))
(nox-recipe '(gotest))

;;; Fringe <https://www.emacswiki.org/emacs/TheFringe>.
;; (nox-recipe '(git-gutter))
(nox-recipe '(diff-hl))
(nox-recipe '(fringe))
(nox-recipe '(linum))
(nox-recipe '(linum-format))

(nox-recipe '(git-timemachine))
(nox-recipe '(gitignore-mode))
(nox-recipe '(go-translate)) ; google translate
(nox-recipe '(haproxy-mode))
(nox-recipe '(hcl-mode))
(nox-recipe '(help))
(nox-recipe '(hi-lock))
(nox-recipe '(hideshow))
(nox-recipe '(highlight-static-regexps))
(nox-recipe '(highlight-static-regexps-tmp))
(nox-recipe '(highlight-symbol)) ;(nox-recipe '(idle-highlight-global-mode highlight-global))
(nox-recipe '(hl-line))
(nox-recipe '(hl-todo))
(nox-recipe '(hydra))

;; doom emacs.
(require 'core-lib "~/.emacs.d/doom-core-lib.el") ; provide `add-hook!' which fixes `ivy's `ivy-truncate-lines'
;; (autoload 'doom-modeline-set-modeline "~/.emacs.d/doom-modeline.el" nil t)

;; doom todo ivy.a
(require 'doom-todo-ivy "~/.emacs.d/doom-todo-ivy.el")
;; (autoload 'doom-todo-ivy "~/.emacs.d/doom-todo-ivy.el" nil t)
(nox-recipe '(doom-todo-ivy))

;; mode-line
;; (nox-recipe '(cyphejor))
;; (nox-recipe '(doom-modeline))
(nox-recipe '(rich-minority))
(nox-recipe '(smart-mode-line))
(nox-recipe '(mode-line))

;; Ivy (is an ido replacement).
;; (nox-recipe '(colir))
;; (nox-recipe '(counsel-auto-complete))
(nox-recipe '(counsel))
(nox-recipe '(historian))
(nox-recipe '(ivy))
(nox-recipe '(ivy-historian))
(nox-recipe '(swiper)) ; a-la ido-occur

;; (nox-recipe '(iedit)) ;isearch + edit is an a-la multiple-cursors-mode
(nox-recipe '(ibuffer))
(nox-recipe '(ielm))
(nox-recipe '(indent))
(nox-recipe '(inf-mongo))
(nox-recipe '(info))
(nox-recipe '(interprogram))
(nox-recipe '(isearch))
(nox-recipe '(ispell))

;; JavaScript.
(nox-recipe '(coffee-mode))
(nox-recipe '(js-mode))
(nox-recipe '(js2-mode))
(nox-recipe '(json-mode))
(nox-recipe '(json-reformat))

(nox-recipe '(kill-emacs))
(nox-recipe '(kill-ring))

;; (nox-recipe '(lsp-mode))
(nox-recipe '(lisp-mode))
(nox-recipe '(logview))
(nox-recipe '(lua-mode))

(nox-recipe '(magit))
(nox-recipe '(magit-blame))

(nox-recipe '(markdown-mode))
(nox-recipe '(markdownfmt))

(nox-recipe '(make-mode))
(nox-recipe '(mediawiki))
(nox-recipe '(menu-bar))
(nox-recipe '(mouse))
(nox-recipe '(multi-compile))
(nox-recipe '(my-backspace-fix))
(nox-recipe '(my-beginning-of-line))
(nox-recipe '(my-color-theme))
(nox-recipe '(my-current-local-map))
(nox-recipe '(my-project))
(nox-recipe '(my-shell-command-on-current-file))
(nox-recipe '(my-sort))
(nox-recipe '(my-string-inflections))
(nox-recipe '(my-sum-numbers-in-region))
(nox-recipe '(my-tags))
(nox-recipe '(my-uniquify-lines))
(nox-recipe '(narrow-indirect))
(nox-recipe '(newcomment))
(nox-recipe '(nginx-mode))
(nox-recipe '(noccur))
(nox-recipe '(nodejs))
(nox-recipe '(nodejs-repl))
(nox-recipe '(noxrcp))
(nox-recipe '(nxml-mode))
(nox-recipe '(org-mode org-ac))
(nox-recipe '(org-mode))
(nox-recipe '(origami))

(nox-recipe '(projectile))
(nox-recipe '(projectile-rails))

(nox-recipe '(paren))
(nox-recipe '(password-cache))
(nox-recipe '(php-mode))
(nox-recipe '(pinentry)) ;gnupg password in minibuffer prompt instead of graphical dialog <https://unix.stackexchange.com/questions/55638/can-emacs-use-gpg-agent-in-a-terminal-at-all/278875#278875>
(nox-recipe '(protobuf-mode))
(nox-recipe '(python))
(nox-recipe '(quickrun))
(nox-recipe '(rainbow-delimiters))
(nox-recipe '(rainbow-identifiers))
(nox-recipe '(rainbow-mode))
(nox-recipe '(re-builder))
(nox-recipe '(recentf))
(nox-recipe '(recentf))
(nox-recipe '(recentf-ext))
(nox-recipe '(redis))
(nox-recipe '(replace))
(nox-recipe '(restclient))
(nox-recipe '(rust-mode))

;; (nox-recipe '(rbenv))
(nox-recipe '(enh-ruby-mode))
(nox-recipe '(haml-mode)) ;depends from ruby-mode due to ruby-toggle-hash-syntax
(nox-recipe '(inf-ruby))
(nox-recipe '(robe))
(nox-recipe '(rspec-compilation-mode))
(nox-recipe '(rspec-mode))
(nox-recipe '(ruby-hash-syntax))
(nox-recipe '(ruby-mode))
(nox-recipe '(ruby-pry))
(nox-recipe '(ruby-refactor))
(nox-recipe '(ruby-tools))

;; Selectrum <https://github.com/raxod502/selectrum>.
(nox-recipe '(selectrum)) ; a-la ido/ivy/counsel
(nox-recipe '(selectrum-prescient)) ; selectrum sorting/filtering
(nox-recipe '(prescient))
(nox-recipe '(ctrlf)) ;a-la isearch replacement?
(nox-recipe '(amx)) ;a-la smex is a m-x enhancement

(nox-recipe '(savehist))
(nox-recipe '(saveplace))
(nox-recipe '(scroll-bar))
(nox-recipe '(scss-mode))
(nox-recipe '(sgml-mode))
(nox-recipe '(sh-script))
(nox-recipe '(shell))
(nox-recipe '(simp))
(nox-recipe '(simple))
(nox-recipe '(slim-mode))
(nox-recipe '(sort))
(nox-recipe '(su))
(nox-recipe '(subr))
(nox-recipe '(subword-mode))
(nox-recipe '(systemd))

(nox-recipe '(sql))
(nox-recipe '(sql-mode))
(nox-recipe '(sql-mysql))
(nox-recipe '(sql-postgres))

(nox-recipe '(telnet))
(nox-recipe '(text-mode))
(nox-recipe '(tldr))
(nox-recipe '(toml-mode))
(nox-recipe '(transpose-frame))
(nox-recipe '(two-column)) ;disable fucking two-column mode
(nox-recipe '(undo-tree))
(nox-recipe '(uniquify)) ; uniquify buffer name
(nox-recipe '(vc-hooks))
(nox-recipe '(vlf))
(nox-recipe '(web-mode))
(nox-recipe '(window))
(nox-recipe '(window-numbering))
(nox-recipe '(winner-mode))
(nox-recipe '(xref))
(nox-recipe '(yaml-mode))
(nox-recipe '(yasnippet))
;; (nox-recipe '(yafolding))
;; (nox-recipe '(yascroll))
;; (nox-recipe '(yasnippets))

;; <https://stackoverflow.com/questions/10639429/emacs-linux-and-international-keyboard-layouts>
;; (define-key function-key-map [?\M-ф] [?\M-a])
;; (global-set-key [?\M-а] [?\M-f])
;; (define-key function-key-map [?\C-ь] [?\C-x])
;; (global-set-key (kbd "M-а") forward-word)
;; (define-key function-key-map [?\C-ь] [?\C-x])
;; backward-word

;;; Load my recipes.
(autoload '-difference "dash" nil t)
(dolist (recipe nox-recipes)
  (let ((recipe-file (format "%srecipes/init-%s.el" user-emacs-directory recipe)))
    (if (file-readable-p recipe-file)
        (load-file recipe-file)
      (display-warning :warning
                       (format "Recipe file not found: %s" recipe-file)))))

(noxrcp-global-mode 1)

(add-hook 'after-init-hook 'noxrcp-init)

(defun noxrcp-init ()
  "Init."

  (define-key noxrcp-map (kbd "x") noxrcp-exec-map)

  (global-set-key (kbd "C-v") noxrcp-map))

;;; init.el ends here
(put 'magit-diff-edit-hunk-commit 'disabled nil)
