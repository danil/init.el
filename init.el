;;; init.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2014-2015 Danil <danil@kutkevich.org>.
;; Author: Danil <danil@kutkevich.org>
;; Version: 0.0.0
;; Package-Requires: ()
;; Keywords: convenience
;; URL: http://danil.kutkevich.org/p/el/init.el

;;; Commentary:

;; Please see README.md for documentation, or read it online at
;; http://danil.kutkevich.org/p/el/init.el

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

;; Danil <http://emacswiki.org/DotEmacsDotD>,
;; <http://emacs.stackexchange.com/questions/1/are-there-any-advantages-to-using-emacs-d-init-el-instead-of-emacs>.

;;; Truncation of Lines (toggle-truncate-lines)
;;; <http://emacswiki.org/emacs/TruncateLines>.
(set-default 'truncate-lines t) ;wrap long lines

(setq calendar-week-start-day t)
(setq system-time-locale "C")

(global-font-lock-mode t)

;;; Put <http://www.gnu.org/software/emacs/manual/html_node/elisp/Symbol-Plists.html>.
;; Horizontal Scrolling
;; <http://gnu.org/software/emacs/manual/html_node/emacs/Horizontal-Scrolling.html#Horizontal-Scrolling>.
(put 'scroll-left 'disabled nil)
(put 'upcase-region 'disabled nil)

;;; My custom variables.
(setq custom-file "~/.emacs.d/my-custom-variables.el")
(load custom-file)

(defvar my-safe-modes-hooks '(
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

(defvar my-programming-modes-hooks (append my-safe-modes-hooks
                                           '(clojure-mode-hook
                                             emacs-lisp-mode-hook)))

(defvar my-read-only-modes-hooks (append my-safe-modes-hooks
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

(defvar my-ruby-tools-hooks '(
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
                              ))

(defun my-kbd (key) (kbd (concat "C-c C-f " key)))

;; <http://blog.puercopop.com/post/56050999061/improving-emacss-startup-time>.
(defmacro my-after-init (&rest body)
  "After loading all the init files, evaluate BODY."
  (declare (indent defun))
  `(add-hook 'after-init-hook
             '(lambda () ,@body)))

(defmacro my-eval-after-load (feature &rest body)
  "After FEATURE is loaded, evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,feature
     '(progn ,@body)))

;; (defmacro my-eval-if-defined-or-after-load (symbol feature &rest body)
;;   "If function SYMBOL definded or variable SYMBOL defined or after
;;  FEATURE is loaded, evaluate BODY."
;;   (declare (indent defun))
;;   ;; (if (or (fboundp 'js-mode-map) (boundp 'js-mode-map))
;;   ;;     (define-key js-mode-map (kbd "C-c C-z") 'nodejs-repl)
;;   ;;   (with-eval-after-load 'js
;;   ;;     (define-key js-mode-map (kbd "C-c C-z") 'nodejs-repl)))
;; )

(defun my-add-auto-mode-to-patterns (mode &rest patterns)
  "Add entries to `auto-mode-alist' to use `MODE' for all given file `PATTERNS'."
  (dolist (pattern patterns)
    (add-to-list 'auto-mode-alist (cons pattern mode))))

(defun my-add-pattern-to-auto-modes (pattern &rest modes)
  "Add entries to `auto-mode-alist' to use `MODE' for all given file `PATTERNS'."
  (dolist (mode modes)
    (add-to-list 'auto-mode-alist (cons pattern mode))))

(defun my-add-mode-to-hooks (mode hooks)
  "Add `MODE' to all given `HOOKS'."
  (dolist (hook hooks) (add-hook hook mode)))

(defun my-autoload-file-on-functions (file-name &rest functions)
  "Autoload `FILE-NAME' if one of the given `FUNCTIONS' called."
  (dolist (function-name functions)
    (autoload function-name file-name nil t)))

(defvar my-elpa-packages ())

(defun my-elpa (packages)
  (dolist (package packages) (add-to-list 'my-elpa-packages package)))

(my-elpa '(ac-etags))
(my-elpa '(apache-mode))
(my-elpa '(auto-complete-nxml))
(my-elpa '(browse-kill-ring))
(my-elpa '(crontab-mode))
(my-elpa '(csv-mode))
(my-elpa '(dash))
(my-elpa '(findr))
(my-elpa '(gitconfig-mode))
(my-elpa '(go-mode))
(my-elpa '(jade-mode))
(my-elpa '(jsfmt)) ; javascript formater
(my-elpa '(less-css-mode))
(my-elpa '(list-unicode-display))
(my-elpa '(pt))
(my-elpa '(ruby-guard))
(my-elpa '(rust-mode))
(my-elpa '(sass-mode))
(my-elpa '(speed-type))
(my-elpa '(systemd))
(my-elpa '(toml-mode))
(my-elpa '(ztree))

(defvar my-el-get-packages ())

(defun my-el-get (packages)
  (dolist (package packages) (add-to-list 'my-el-get-packages package)))

(my-el-get '(auto-complete-emacs-lisp))
(my-el-get '(ebuild-mode))

(defvar my-recipes ())

(defun my-recipes (recipes)
  (dolist (recipe recipes) (add-to-list 'my-recipes recipe)))

;; (my-recipes '(auto-complete ac-html ac-html-bootstrap)) (my-elpa '(ac-html-bootstrap))
(my-recipes '(add-log))
(my-recipes '(ag)) (my-elpa '(ag))
(my-recipes '(anzu)) (my-elpa '(anzu))
(my-recipes '(auto-complete ac-html)) (my-elpa '(ac-html))
(my-recipes '(auto-complete auto-complete-chunk)) (my-elpa '(auto-complete-chunk))
(my-recipes '(bash-completion)) (my-elpa '(bash-completion))
(my-recipes '(calendar))
(my-recipes '(cc-mode))
(my-recipes '(cc-vars))
(my-recipes '(clojure-mode cider smartparens)) (my-elpa '(clojure-mode cider smartparens))
(my-recipes '(coffee-mode)) (my-elpa '(coffee-mode))
(my-recipes '(column-marker)) (my-elpa '(column-marker))
(my-recipes '(compile))
(my-recipes '(conf-mode))
(my-recipes '(css))
(my-recipes '(deft)) (my-elpa '(deft))
(my-recipes '(desktop))
(my-recipes '(diff-mode))
(my-recipes '(dired dired-reuse-directory-buffer))
(my-recipes '(dired direx)) (my-elpa '(direx))
(my-recipes '(discover-my-major)) (my-elpa '(discover-my-major))
(my-recipes '(disp-table-line-wrap-and-truncation))
(my-recipes '(disp-table-vertical-border))
(my-recipes '(dockerfile-mode)) (my-elpa '(dockerfile-mode))
(my-recipes '(ediff))
(my-recipes '(elpa-mirror)) (my-elpa '(elpa-mirror))
(my-recipes '(emacs-lisp-mode))
(my-recipes '(env))
(my-recipes '(erise)) (my-el-get '(erise))
(my-recipes '(etags-select)) (my-elpa '(etags-select))
(my-recipes '(ethan-wspace)) (my-elpa '(ethan-wspace))
(my-recipes '(expand-region)) (my-elpa '(expand-region))
(my-recipes '(ferm-mode)) (my-el-get '(ferm-mode))
(my-recipes '(files))
(my-recipes '(flycheck)) (my-elpa '(flycheck))
(my-recipes '(files-backup))
(my-recipes '(fill))
(my-recipes '(fish-mode)) (my-elpa '(fish-mode))
(my-recipes '(git-gutter)) (my-elpa '(git-gutter))
(my-recipes '(git-timemachine)) (my-elpa '(git-timemachine))
(my-recipes '(gitignore-mode)) (my-elpa '(gitignore-mode))
(my-recipes '(haml-mode)) (my-elpa '(haml-mode)) ;depends from ruby-mode due to ruby-toggle-hash-syntax
(my-recipes '(help))
(my-recipes '(help-mode))
(my-recipes '(hi-lock))
(my-recipes '(hideshow))
(my-recipes '(highlight-current-line))
(my-recipes '(highlight-symbol)) (my-elpa '(highlight-symbol)) ;(my-recipes '(idle-highlight-global-mode highlight-global)) (my-el-get '(idle-highlight-global-mode highlight-global))
(my-recipes '(ibuffer))
(my-recipes '(ido ido-preview)) (my-el-get '(ido-preview))
(my-recipes '(ido ido-ubiquitous)) (my-elpa '(ido-ubiquitous))
(my-recipes '(ido ido-vertical-mode)) (my-elpa '(ido-vertical-mode))
(my-recipes '(ido ido-yes-or-no)) (my-el-get '(ido-yes-or-no))
(my-recipes '(ido kill-ring-ido)) (my-elpa '(kill-ring-ido))
(my-recipes '(ido recentf recentf-ido-find-file))
(my-recipes '(ido-describe-bindings))
(my-recipes '(ielm))
(my-recipes '(indent))
(my-recipes '(info))
(my-recipes '(interprogram))
(my-recipes '(isearch))
(my-recipes '(js-mode js2-mode)) (my-elpa '(js2-mode))
(my-recipes '(json-mode json-reformat)) (my-elpa '(json-mode json-reformat))
(my-recipes '(kill-emacs))
(my-recipes '(kill-ring))
(my-recipes '(linum linum-format))
(my-recipes '(lisp-mode))
(my-recipes '(lua-mode)) (my-elpa '(lua-mode))
(my-recipes '(magit magit-blame)) (my-elpa '(magit))
(my-recipes '(make-mode))
(my-recipes '(markdown-mode)) (my-elpa '(markdown-mode))
(my-recipes '(menu-bar))
(my-recipes '(multiple-cursors)) (my-elpa '(multiple-cursors))
(my-recipes '(my-backspace-fix))
(my-recipes '(my-beginning-of-line))
(my-recipes '(my-color-theme))
(my-recipes '(my-project))
(my-recipes '(my-repeat-last-key-command))
(my-recipes '(my-shell-command-on-current-file))
(my-recipes '(my-string-inflections))
(my-recipes '(my-sum-numbers-in-region))
(my-recipes '(my-tags))
(my-recipes '(nginx-mode)) (my-elpa '(nginx-mode))
(my-recipes '(nodejs-repl)) (my-elpa '(nodejs-repl))
(my-recipes '(nvm)) (my-el-get '(nvm))
(my-recipes '(nxml-mode))
(my-recipes '(occur-edit-mode))
(my-recipes '(occur-mode))
(my-recipes '(org-mode org-reveal)) (my-el-get '(org-reveal))
(my-recipes '(org-mode)) (my-elpa '(org))
(my-recipes '(paren))
(my-recipes '(php-mode)) (my-elpa '(php-mode))
(my-recipes '(point-stack)) (my-elpa '(point-stack))
(my-recipes '(pretty-lambdada)) (my-elpa '(pretty-lambdada))
(my-recipes '(projectile projectile-rails)) (my-elpa '(projectile-rails))
(my-recipes '(python))
(my-recipes '(quickrun)) (my-elpa '(quickrun))
(my-recipes '(rainbow-delimiters)) (my-elpa '(rainbow-delimiters))
(my-recipes '(rainbow-mode)) (my-elpa '(rainbow-mode))
(my-recipes '(rbenv)) (my-elpa '(rbenv))
(my-recipes '(re-builder))
(my-recipes '(recentf))
(my-recipes '(ruby-hash-syntax)) (my-elpa '(ruby-hash-syntax))
(my-recipes '(ruby-mode rspec-mode rspec-compilation-mode)) (my-elpa '(rspec-mode))
(my-recipes '(ruby-mode ruby-pry)) (my-el-get '(ruby-pry))
(my-recipes '(ruby-mode ruby-refactor)) (my-elpa '(ruby-refactor))
(my-recipes '(ruby-mode ruby-tools)) (my-elpa '(ruby-tools))
(my-recipes '(ruby-mode))
(my-recipes '(savehist))
(my-recipes '(saveplace))
(my-recipes '(scss-mode)) (my-elpa '(scss-mode))
(my-recipes '(sgml-mode))
(my-recipes '(sh-script))
(my-recipes '(shell))
(my-recipes '(simp)) (my-elpa '(simp))
(my-recipes '(simple))
(my-recipes '(slim-mode)) (my-elpa '(slim-mode))
(my-recipes '(smart-mode-line rich-minority)) (my-elpa '(smart-mode-line rich-minority))
(my-recipes '(smex)) (my-elpa '(smex))
(my-recipes '(sort))
(my-recipes '(sql-mode))
(my-recipes '(sql-postgres))
(my-recipes '(subword-mode))
(my-recipes '(swiper)) (my-elpa '(swiper))
(my-recipes '(twittering-mode)) (my-elpa '(twittering-mode))
(my-recipes '(undo-tree)) (my-elpa '(undo-tree))
(my-recipes '(uniquify))
(my-recipes '(web-mode)) (my-elpa '(web-mode))
(my-recipes '(window))
(my-recipes '(window-numbering)) (my-elpa '(window-numbering))
(my-recipes '(winner-mode))
(my-recipes '(woman))
(my-recipes '(yaless-mode))
(my-recipes '(yaml-mode)) (my-elpa '(yaml-mode))
(my-recipes '(yascroll)) (my-elpa '(yascroll))
(my-recipes '(yasnippet yasnippets)) (my-elpa '(yasnippet)) (my-el-get '(yasnippets))

;;; Install/remove El-get packages <http://github.com/dimitri/el-get>.
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(setq el-get-recipe-path)
(add-to-list 'el-get-recipe-path
             (concat user-emacs-directory "my-el-get/recipes"))
;; (setq el-get-user-package-directory
;;       (concat user-emacs-directory "my-el-get/init-files"))

(setq el-get-sources)
(let ((packages (append (mapcar 'el-get-source-name el-get-sources)
                        my-el-get-packages)))
  (el-get-cleanup packages) ;remove all packages absent from `packages'
  (el-get 'sync packages))

;;; ELPA packages.
(setq package-archives '(("kutkevich" . "http://elpa.kutkevich.org/mirror/")))
;; (setq package-archives '(("ELPA" . "http://tromey.com/elpa/")
;;                          ("melpa-stable" . "http://stable.melpa.org/packages/")
;;                          ("melpa" . "http://melpa.org/packages/")
;;                          ("gnu" . "http://elpa.gnu.org/packages/")
;;                          ("marmalade" . "http://marmalade-repo.org/packages/")
;;                          ("SC" . "http://joseito.republika.pl/sunrise-commander/")))

(package-initialize) ;activate all the packages (in particular autoloads)

(or (file-exists-p package-user-dir)
    (package-refresh-contents)) ;fetch the list of packages available

;;; Install/remove ELPA packages
;;; <http://stackoverflow.com/questions/10092322/how-to-automatically-install-emacs-packages-by-specifying-a-list-of-package-name#10093312http://stackoverflow.com/questions/10092322/how-to-automatically-install-emacs-packages-by-specifying-a-list-of-package-name#10093312>,
;;; <http://wikemacs.org/wiki/Package.el#How_to_use_it_with_a_custom_build>.
(dolist (package my-elpa-packages)
  (unless (package-installed-p package)
    (package-install package))) ;install the missing packages

;;; Load my recipes.
(autoload '-difference "dash" nil t)
(dolist (recipe my-recipes)
  (load-file (format "%s/my-recipes/%s.rcp" user-emacs-directory recipe)))

;; ;;; <http://emacswiki.org/ScrollBar>.
;; (scroll-bar-mode -1)
;; <http://stackoverflow.com/questions/3155451/emacs-scrollbar-customize#3159618>.
(cond ((equal frame-background-mode 'dark)
       (set-face-background 'scroll-bar "white")
       (set-face-foreground 'scroll-bar "gray")
       ))

;;; AnsiColor (Emacs terminal related stuff)
;;; <http://emacswiki.org/AnsiColor>.
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;; (add-hook 'shell-mode-hook 'compilation-shell-minor-mode) ;filenames with line numbers linkable

;;; Comint mode (which shell mode and sql mode based on)
;;; <http://www.emacswiki.org/emacs/ComintMode#toc3>.
(setq comint-input-ring-size 10000)
;; (add-hook 'sql-interactive-mode-hook
;;           (function (lambda () (setq comint-input-ring-size 10000))))

;;; IswitchB <http://emacswiki.org/IswitchBuffers>.
;; (iswitchb-mode 1)
;; (setq iswitchb-buffer-ignore '("^ " "*scratch*" "*Messages*"
;;                                "*Completions*" "*Ibuffer*"))
;(setq iswitchb-default-method 'samewindow)

;;; Server <http://shreevatsa.wordpress.com/tag/emacs/>.
;; (remove-hook 'kill-buffer-query-functions
;;              'server-kill-buffer-query-function)

;;; Spelling.
;(setq-default ispell-program-name "/usr/bin/aspell")
;(setq-default ispell-program-name "/usr/bin/hunspell")
(setq ispell-dictionary "ru")

;;; InteractiveSpell.
;(setq ispell-dictionary "german")

;;; TRAMP.
;;; <http://emacswiki.org/TrampMode>.
;(setq tramp-default-method "ssh")

;;; Cua mode <http://www.emacswiki.org/emacs/CuaMode>.
(setq cua-enable-cua-keys nil) ;change case of a rectangle <http://stackoverflow.com/questions/6154545/emacs-change-case-of-a-rectangle#comment-7167904>.

;;; ANSI SGR (Select Graphic Rendition) escape sequences
;;; <http://www.emacswiki.org/emacs/AnsiColor>
(require 'ansi-color)
(defun my-show-ansi-color ()
  "Process ANSI color codes in region."
  (interactive)
  (ansi-color-apply-on-region (region-beginning) (region-end)))
;;; ANSI SRG in shell command output
;:; <http://stackoverflow.com/questions/5819719/emacs-shell-command-output-not-showing-ansi-colors-but-the-code#5821668
(defadvice display-message-or-buffer (before ansi-color activate)
  "Process ANSI color codes in shell output."
  (let ((buf (ad-get-arg 0)))
    (and (bufferp buf)
         (string= (buffer-name buf) "*Shell Command Output*")
         (with-current-buffer buf
           (ansi-color-apply-on-region (point-min) (point-max))))))

;;; Duplicate lines <http://www.emacswiki.org/emacs/DuplicateLines#toc2>.
(global-set-key (my-kbd "s u") 'uniquify-all-lines-region)
(defun uniquify-all-lines-region (start end)
  "Find duplicate lines in region START to END keeping first occurrence."
  (interactive "*r")
  (save-excursion
    (let ((end (copy-marker end)))
      (while
          (progn
            (goto-char start)
            (re-search-forward "^\\(.*\\)\n\\(\\(.*\n\\)*\\)\\1\n" end t))
        (replace-match "\\1\n\\2")))))
(defun uniquify-all-lines-buffer ()
  "Delete duplicate lines in buffer and keep first occurrence."
  (interactive "*")
  (uniquify-all-lines-region (point-min) (point-max)))

;;; Sql mode history <http://www.emacswiki.org/emacs/SqlMode#toc3>.
(defun my-sql-save-history-hook ()
  (let ((lval 'sql-input-ring-file-name)
        (rval 'sql-product))
    (if (symbol-value rval)
        (let ((filename
               (concat "~/.emacs.d/sql/"
                       (symbol-name (symbol-value rval))
                       "-history.sql")))
          (set (make-local-variable lval) filename))
      (error
       (format "SQL history will not be saved because %s is nil"
               (symbol-name rval))))))
(add-hook 'sql-interactive-mode-hook 'my-sql-save-history-hook)

;;; Mew is a mail reader for Emacs <http://mew.org>, <http://emacswiki.org/Mew>.
(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)
;; ;; Optional setup (e.g. C-xm for sending a message):
;; (autoload 'mew-user-agent-compose "mew" nil t)
;; (if (boundp 'mail-user-agent)
;;     (setq mail-user-agent 'mew-user-agent))
;; (if (fboundp 'define-mail-user-agent)
;;     (define-mail-user-agent
;;       'mew-user-agent
;;       'mew-user-agent-compose
;;       'mew-draft-send-message
;;       'mew-draft-kill
;;       'mew-send-hook))


;;; Auto Fill Mode
;;; <http://gnu.org/software/emacs/manual/html_node/emacs/Auto-Fill.html>.
;(add-hook 'mail-mode-hook (lambda () (auto-fill-mode t)))

;;; DVC.
;(add-to-list 'load-path "~/share/emacs/site-lisp/dvc")
;(autoload 'dvc-status "dvc-load" nil t)
;(setq dvc-tips-enabled nil)

;;; psvn.
; Set up autoloads for psvn (svn directory edit mode for emacs)
;(autoload 'svn-status "psvn" nil t)

;;; Icicles -- enhances minibuffer completion
;;; <http://emacsmirror.org/package/icicles.html>,
;;; <http://emacswiki.org/emacs/Icicles>.
;; (add-to-list 'load-path "~/share/emacs/site-lisp/icicles")
;; (autoload 'icicle-mode "icicles" "Enhances minibuffer completion" t)

;; ;;; Viper.
;; ;;; Changing viper-toggle-key <http://emacswiki.org/ViperMode#toc14>
;; (setq viper-toggle-key "\C-q")
;; ;;; Deactivate Viper for a single buffers
;; ;;; <http://emacswiki.org/emacs/ViperMode#toc9>.
;; ;;(viper-change-state-to-emacs)
;; (setq viper-mode t)
;; (require 'viper)

;;; jabber.el
;; Set up autoloads for jabber.el
;(require 'jabber)
;; (autoload 'jabber-connect "jabber" nil t)
;; (setq jabber-account-list (quote (("danilkutkevich@jabber.org"))))
;; (setq jabber-history-enabled t)

;; Flymake <http://emacswiki.org/FlyMake>.
;; Don't want flymake mode for ruby regions in rhtml files and also on
;; read only files.
;; (add-hook 'ruby-mode-hook
;;   '(lambda () (if (and (not (null buffer-file-name))
;;                        (file-writable-p buffer-file-name))
;;                   (flymake-mode))))

;; (setq interpreter-mode-alist
;;      (cons '("ruby" . ruby-mode) interpreter-mode-alist))
;; (autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
;; (autoload 'inf-ruby-keys "inf-ruby"
;;  "Set local key defs for inf-ruby in ruby-mode")
;; (add-hook 'ruby-mode-hook
;;          '(lambda ()
;;             (inf-ruby-keys)
;;             ))

;; ;; Redefining the make-auto-save-file-name function in order to get
;; ;; autosave files sent to a single directory.  Note that this function
;; ;; looks first to determine if you have a ~/.autosaves/ directory.  If
;; ;; you do not it proceeds with the standard auto-save procedure.
;; (defun make-auto-save-file-name ()
;;   "Return file name to use for auto-saves of current buffer.."
;;   (if buffer-file-name
;;       (if (file-exists-p "~/.autosaves/")
;;           (concat (expand-file-name "~/.autosaves/") "#"
;;                   (replace-regexp-in-string "/" "!" buffer-file-name)
;;                   "#")
;;          (concat
;;           (file-name-directory buffer-file-name)
;;           "#"
;;           (file-name-nondirectory buffer-file-name)
;;           "#"))
;;     (expand-file-name
;;      (concat "#%" (buffer-name) "#"))))

;;; init.el ends here
