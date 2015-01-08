;;; This file is part of Danil <danil@kutkevich.org> home.

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

(setq my-safe-modes-hooks '(
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
                            sql-mode-hook
                            text-mode-hook
                            web-mode-hook
                            xml-mode-hook
                            yaml-mode-hook
                            ))

(setq my-programming-modes-hooks (append my-safe-modes-hooks
                                         '(clojure-mode-hook
                                           emacs-lisp-mode-hook)))

(setq my-read-only-modes-hooks (append my-safe-modes-hooks
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

;;; My packages (el-get <http://github.com/dimitri/el-get>).
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
(add-to-list 'el-get-recipe-path
             (concat user-emacs-directory "my-el-get/recipes"))
;; (setq el-get-user-package-directory
;;       (concat user-emacs-directory "my-el-get/init-files"))
(setq my-packages (append (mapcar 'el-get-source-name el-get-sources)))

(autoload '-difference "dash" nil t)

(defun my-add-to-packages (&rest packages)
  (dolist (package packages)
    (add-to-list 'my-packages package)))

(my-add-to-packages 'dash)

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
  "Autoload `file-name' if one of the given `functions' called."
  (dolist (function-name functions)
    (autoload function-name file-name nil t)))

(setq sico-recipes-directory (concat user-emacs-directory "my-recipes"))

(load-file (concat user-emacs-directory "el-get/dash/dash.el"))
(require 'dash)

(defun sico-load (recipes)
  "(sico-load '((ac-html auto-complite) (el-get ac-html))"

  (let* ((more-than-one-recipe-type (listp (first recipes)))

         (el-get-recipes (when (and more-than-one-recipe-type
                                    (> (length recipes) 1))
                           (cdr (--first (equal (first it) 'el-get)
                                         recipes))))

         (my-recipes (if more-than-one-recipe-type (first recipes) recipes)))

    (dolist (recipe my-recipes)
      (load-file (format "%s/%s.rcp" sico-recipes-directory recipe)))

    (dolist (recipe el-get-recipes) (my-add-to-packages recipe))))

(my-add-to-packages 'apache-mode)
(my-add-to-packages 'auto-complete-emacs-lisp)
(my-add-to-packages 'auto-complete-etags)
(my-add-to-packages 'auto-complete-nxml)
(my-add-to-packages 'browse-kill-ring)
(my-add-to-packages 'crontab-mode)
(my-add-to-packages 'csv-mode)
(my-add-to-packages 'ebuild-mode)
(my-add-to-packages 'findr)
(my-add-to-packages 'jade-mode)
(my-add-to-packages 'less-css-mode)
(my-add-to-packages 'sass-mode)

(sico-load '((ag) (el-get ag)))
(sico-load '((auto-complete ac-html) (el-get ac-html)))
(sico-load '((auto-complete auto-complete-chunk) (el-get auto-complete-chunk)))
(sico-load '((bash-completion) (el-get bash-completion)))
(sico-load '((calendar)))
(sico-load '((cc-vars)))
(sico-load '((clojure-mode cider smartparens) (el-get clojure-mode cider smartparens)))
(sico-load '((coffee-mode) (el-get coffee-mode)))
(sico-load '((column-marker) (el-get column-marker)))
(sico-load '((compile)))
(sico-load '((conf-mode)))
(sico-load '((css)))
(sico-load '((deft) (el-get deft)))
(sico-load '((desktop)))
(sico-load '((diff-mode)))
(sico-load '((dired dired-reuse-directory-buffer)))
(sico-load '((dired direx) (el-get direx)))
(sico-load '((discover-my-major) (el-get discover-my-major)))
(sico-load '((disp-table)))
(sico-load '((dockerfile-mode) (el-get dockerfile-mode)))
(sico-load '((ediff)))
(sico-load '((emacs-lisp-mode)))
(sico-load '((env)))
(sico-load '((erise) (el-get erise)))
(sico-load '((etags-select) (el-get etags-select)))
(sico-load '((ethan-wspace) (el-get ethan-wspace)))
(sico-load '((expand-region) (el-get expand-region)))
(sico-load '((ferm-mode) (el-get ferm-mode)))
(sico-load '((files)))
(sico-load '((files-backup)))
(sico-load '((fill)))
(sico-load '((fiplr) (el-get fiplr)))
(sico-load '((fish-mode) (el-get fish-mode)))
(sico-load '((git-gutter) (el-get git-gutter)))
(sico-load '((git-timemachine) (el-get git-timemachine)))
(sico-load '((gitignore-mode) (el-get git-modes)))
(sico-load '((haml-mode) (el-get haml-mode))) ;depends from ruby-mode due to ruby-toggle-hash-syntax
(sico-load '((helm helm-ag) (el-get helm-ag)))
(sico-load '((helm helm-descbinds) (el-get helm-descbinds)))
(sico-load '((helm helm-git-grep) (el-get helm-git-grep)))
(sico-load '((helm helm-ls-git) (el-get helm-ls-git)))
(sico-load '((helm helm-swoop) (el-get helm-swoop)))
(sico-load '((help)))
(sico-load '((help-mode)))
(sico-load '((hi-lock)))
(sico-load '((hideshow)))
(sico-load '((highlight-current-line)))
(sico-load '((highlight-symbol) (el-get highlight-symbol)))
(sico-load '((ibuffer)))
(sico-load '((ido ido-preview) (el-get ido-preview)))
(sico-load '((ido ido-ubiquitous) (el-get ido-ubiquitous)))
(sico-load '((ido ido-vertical-mode) (el-get ido-vertical-mode)))
(sico-load '((ido ido-yes-or-no) (el-get ido-yes-or-no)))
(sico-load '((ido kill-ring-ido) (el-get kill-ring-ido)))
(sico-load '((ido recentf recentf-ido-find-file)))
(sico-load '((ielm)))
(sico-load '((indent)))
(sico-load '((indent-guide) (el-get indent-guide)))
(sico-load '((info)))
(sico-load '((interprogram)))
(sico-load '((isearch)))
(sico-load '((js-mode js2-mode) (el-get js2-mode)))
(sico-load '((json-mode json-reformat) (el-get json-mode json-reformat)))
(sico-load '((kill-emacs)))
(sico-load '((kill-ring)))
(sico-load '((linum linum-format)))
(sico-load '((lisp-mode)))
(sico-load '((lua-mode) (el-get lua-mode)))
(sico-load '((magit magit-blame) (el-get magit)))
(sico-load '((make-mode)))
(sico-load '((markdown-mode) (el-get markdown-mode)))
(sico-load '((multiple-cursors) (el-get multiple-cursors)))
(sico-load '((my-backspace-fix)))
(sico-load '((my-beginning-of-line)))
(sico-load '((my-color-theme)))
(sico-load '((my-project)))
(sico-load '((my-tags)))
(sico-load '((nginx-mode) (el-get nginx-mode)))
(sico-load '((nodejs-repl) (el-get nodejs-repl)))
(sico-load '((nvm) (el-get nvm)))
(sico-load '((occur-mode)))
(sico-load '((org-mode org-reveal) (el-get org-reveal)))
(sico-load '((org-mode) (el-get org-mode)))
(sico-load '((paren)))
(sico-load '((password-cache)))
(sico-load '((point-stack) (el-get point-stack)))
(sico-load '((pomohist)))
(sico-load '((pretty-lambdada) (el-get pretty-lambdada)))
(sico-load '((quickrun) (el-get quickrun)))
(sico-load '((rainbow-delimiters) (el-get rainbow-delimiters)))
(sico-load '((rainbow-mode) (el-get rainbow-mode)))
(sico-load '((rbenv) (el-get rbenv)))
(sico-load '((re-builder)))
(sico-load '((recentf)))
(sico-load '((ruby-mode rinari) (el-get rinari)))
(sico-load '((ruby-mode rspec-mode rspec-compilation-mode) (el-get ruby-hash-syntax rspec-mode)))
(sico-load '((ruby-mode ruby-pry) (el-get ruby-pry)))
(sico-load '((ruby-mode ruby-refactor) (el-get ruby-refactor)))
(sico-load '((ruby-mode ruby-tools) (el-get ruby-tools)))
(sico-load '((ruby-mode) (el-get ruby-hash-syntax)))
(sico-load '((savehist)))
(sico-load '((saveplace)))
(sico-load '((scss-mode) (el-get scss-mode)))
(sico-load '((sgml-mode)))
(sico-load '((sh-script)))
(sico-load '((shell)))
(sico-load '((simp) (el-get simp)))
(sico-load '((simple)))
(sico-load '((smart-mode-line rich-minority) (el-get smart-mode-line rich-minority)))
(sico-load '((smex) (el-get smex)))
(sico-load '((sort)))
(sico-load '((sql-postgres)))
(sico-load '((subword-mode)))
(sico-load '((undo-tree) (el-get undo-tree)))
(sico-load '((uniquify)))
(sico-load '((web-mode) (el-get web-mode)))
(sico-load '((window)))
(sico-load '((window-numbering) (el-get window-numbering)))
(sico-load '((winner-mode)))
(sico-load '((yaless-mode)))
(sico-load '((yaml-mode) (el-get yaml-mode)))
(sico-load '((yascroll) (el-get yascroll)))
(sico-load '((yasnippet yasnippets) (el-get yasnippet yasnippets)))

;;; Install/remove my packages (see above).
(el-get-cleanup my-packages) ;remove all packages absent from `my-packages'
(el-get 'sync my-packages)

;;; Setting key with repeat
;;; <http://stackoverflow.com/questions/7560094/two-key-shortcut-in-emacs-without-repressing-the-first-key#7560416>.
(defmacro my-with-repeat-while-press-last-key (&rest body)
  "Execute BODY and repeat while the user presses the last key."
  (declare (indent 0))
  `(let* ((repeat-key (and (> (length (this-single-command-keys)) 1)
                           last-input-event))
          (repeat-key-str (format-kbd-macro (vector repeat-key) nil)))
     ,@body
     (while repeat-key
       (message "Type %s to repeat again" repeat-key-str)
       (let ((event (read-event)))
         (clear-this-command-keys t)
         (if (equal event repeat-key)
             (progn ,@body
                    (setq last-input-event nil))
           (setq repeat-key nil)
           (push last-input-event unread-command-events))))))

(transient-mark-mode 1) ;Transient Mark mode <http://emacswiki.org/TransientMarkMode>
;(set-keyboard-coding-system 'mule-utf-8)
;(set-default-coding-systems 'utf-8)
;(set-terminal-coding-system 'utf-8)
;(modify-coding-system-alist 'file "/home/danil/src/vendor/prohq/avers/" 'utf-8)
;(set-language-environment 'cyrillic-koi8)

(menu-bar-mode -1) ;Menu Bar <http://gnu.org/software/emacs/manual/html_node/emacs/Menu-Bars.html>, <http://emacswiki.org/MenuBar>

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

;;; Browse Url with Epiphany.
;; (setq browse-url-browser-function 'browse-url-epiphany)

;; (setq browse-url-browser-function 'browse-url-generic
;;   browse-url-generic-program "epiphany"
;;   browse-url-generic-args '("--new-tab"))
(setq browse-url-browser-function 'browse-url-generic
  browse-url-generic-program "google-chrome")

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

;;; CamleCase and underscore inflection toggle
;;; <http://superuser.com/questions/126431/is-there-any-way-to-convert-camel-cased-names-to-use-underscores-in-emacs/126473#300048>,
;;; <https://bunkus.org/blog/2009/12/switching-identifier-naming-style-between-camel-case-and-c-style-in-emacs>,
;;; <http://api.rubyonrails.org/classes/ActiveSupport/Inflector.html>.
(global-set-key (my-kbd "s i c") 'my-toggle-camelcase-and-underscore-with-repeat)
(defun my-toggle-camelcase-and-underscore-with-repeat ()
  (interactive)
  (my-with-repeat-while-press-last-key
    (my-toggle-camelcase-and-underscore)))
(defun my-toggle-camelcase-and-underscore ()
  "Toggles the symbol at point between C-style naming,
e.g. `hello_world_string', and camel case,
e.g. `HelloWorldString'."
  (interactive)
  (let* ((symbol-pos (bounds-of-thing-at-point 'symbol))
         case-fold-search symbol-at-point cstyle regexp func)
    (unless symbol-pos
      (error "No symbol at point"))
    (save-excursion
      (narrow-to-region (car symbol-pos) (cdr symbol-pos))
      (setq cstyle (string-match-p "_" (buffer-string))
            regexp (if cstyle "\\(?:\\_<\\|_\\)\\(\\w\\)" "\\([A-Z]\\)")
            func (if cstyle
                     'capitalize
                   (lambda (s)
                     (concat (if (= (match-beginning 1)
                                    (car symbol-pos))
                                 ""
                               "_")
                             (downcase s)))))
      (goto-char (point-min))
      (while (re-search-forward regexp nil t)
        (replace-match (funcall func (match-string 1))
                       t nil))
      (widen))))

(global-set-key (my-kbd "s i h") 'my-humanize-symbol-with-repeat)
(defun my-humanize-symbol-with-repeat ()
  (interactive)
  (my-with-repeat-while-press-last-key
    (my-humanize-symbol)))
(defun my-humanize-symbol ()
  "Humanize the symbol at point from
C-style naming, e.g. `hello_world_string',
and camel case, e.g. `HelloWorldString',
and Lisp-style nameing, e.g. `hello-world-string'."
  (interactive)
  (let* ((symbol-pos (bounds-of-thing-at-point 'symbol))
         case-fold-search symbol-at-point cstyle regexp func)
    (unless symbol-pos
      (error "No symbol at point"))
    (save-excursion
      (narrow-to-region (car symbol-pos) (cdr symbol-pos))
      (setq cstyle (string-match-p "_" (buffer-string))
            lisp-style (string-match-p "-" (buffer-string))
            regexp (cond (cstyle "\\(?:\\_<\\|_\\)\\(\\w\\)")
                         (lisp-style "\\(?:\\-<\\|-\\)\\(\\w\\)")
                         (t "\\([A-Z]\\)"))
            func (lambda (s)
                     (concat (if (= (match-beginning 1)
                                    (car symbol-pos))
                                 ""
                               " ")
                             (downcase s))))
      (goto-char (point-min))
      (while (re-search-forward regexp nil t)
        (replace-match (funcall func (match-string 1))
                       t nil))
      (widen))))

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
