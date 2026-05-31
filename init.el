;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

;; (setq c-x-c-x-prefix "C-x C-x") ;; "C-x C-x" ; FIXME: Maybe use the `c-x-c-x-prefix` custom hot key prefix?~~~~<danil@kutkevich.org>

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; vvv↓vvv User Emacs directory below this line.

;;; <https://gnu.org/software/emacs/manual/html_node/emacs/Init-File.html>
(setq user-emacs-directory (file-truename "~/.config/emacs")) ; "~/.emacs.d"
(setq init-emacs-var (file-name-concat user-emacs-directory "var")) ; "~/.emacs.d/var" ; "~/.config/emacs/var"

;;; ^^^↑^^^ User Emacs directory above this line.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; <https://emacs.stackexchange.com/questions/3447/cannot-set-terminal-process-group-error-when-running-bash-script>,
;;; <https://stackoverflow.com/questions/12224909/is-there-a-way-to-get-my-emacs-to-recognize-my-bash-aliases-and-custom-functions>.
(setq shell-file-name "bash")

;;; Move deletd files into "trash"
;;; <http://emacs-fu.blogspot.ru/2009/05/using-systems-trash-when-deleting-files.html>.
;; (setq delete-by-moving-to-trash t)

;;; Truncation of Lines (toggle-truncate-lines)
;;; <http://emacswiki.org/emacs/TruncateLines>.
(set-default 'truncate-lines nil) ;wrap long lines
(setq truncate-partial-width-windows nil) ;wrap long lines in buffers of any width

(setq system-time-locale "C")

;; Number of bytes of consing between garbage collections,
;; <https://www.reddit.com/r/emacs/comments/4j828f/til_setq_gcconsthreshold_100000000>.
(setq gc-cons-threshold 100000000) ;; 100kk byte

(defun init-gc-cons-threshold ()
  "Set garbage collection threshold to 800k bytes."
  (setq gc-cons-threshold 800000))

(add-hook 'after-init-hook 'init-gc-cons-threshold)

;;; Put <http://www.gnu.org/software/emacs/manual/html_node/elisp/Symbol-Plists.html>.
;; Horizontal Scrolling
;; <http://gnu.org/software/emacs/manual/html_node/emacs/Horizontal-Scrolling.html#Horizontal-Scrolling>.
(put 'scroll-left 'disabled nil)
(put 'upcase-region 'disabled nil)

(setq cua-enable-cua-keys nil) ;; cua mode: change case of a rectangle <http://stackoverflow.com/questions/6154545/emacs-change-case-of-a-rectangle#comment-7167904>, <https://emacswiki.org/emacs/CuaMode>

;; Narrowing <https://www.emacswiki.org/emacs/BasicNarrowing>,
;; <https://stackoverflow.com/questions/1893795/emacs-newbie-question-how-to-search-within-a-region#1893817>.
;; (put 'narrow-to-defun 'disabled nil)
;; (put 'narrow-to-page 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;;; counsel-yank-pop (swiper/ivy) in minibuffer.
(setq enable-recursive-minibuffers t)

;;; Undo Limits <https://github.com/emacsmirror/undo-fu#undo-limits>, <https://github.com/emacsmirror/undo-tree/blob/master/undo-tree.el#L798>.
(setq undo-limit 67108864) ; 64mb.
(setq undo-strong-limit 100663296) ; 96mb.
(setq undo-outer-limit 1006632960) ; 960mb.

;;; ElDoc annoying in all buffers/modes.
(global-eldoc-mode -1)

;; (setenv "ESHELL" (expand-file-name "/bin/zsh")) ;; terminal <http://stackoverflow.com/questions/1568987/getting-emacs-to-respect-my-default-shell-options#1570246>
(setenv "GIT_PAGER" "")
(setenv "RIPGREP_CONFIG_PATH" "/home/kutkevich.danil/.config/ripgrep/config")

;; Seconds to wait for lazy timer.
(setq init-lazy-seconds 1)

;; <http://emacs.stackexchange.com/questions/12532/buffer-local-idle-timer#13275>.
;; TODO: Seconds/repeat via named argument.~~~~<danil@kutkevich.org>
(defun init-lazy (delay-secs with-repeat fn &rest args)
  "After `DELAY-SECS' with `WITH-REPEAT' run some `FN' with `ARGS'.
Like `run-with-idle-timer' but always in the `current-buffer'.
Cancels itself, if this buffer was killed."
  (let* (;; Chicken and egg problem.
         (fns (make-symbol "local-idle-timer"))
         (timer (apply 'run-with-idle-timer delay-secs with-repeat fns args))
         (fn `(lambda (&rest args)
                (if (not (buffer-live-p ,(current-buffer)))
                    (cancel-timer ,timer)
                  (with-current-buffer ,(current-buffer)
                    (apply (function ,fn) args))))))
    (fset fns fn) fn))

;; Modes with many minor modes enabled.
(setq init-base-modes '(
                        autoconf-mode
                        awk-mode
                        c++-mode
                        c-mode
                        caddyfile-mode
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
                        dart-mode
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
                        go-dot-mod-mode
                        go-mode
                        graphql-mode
                        haml-mode
                        handlebars-mode
                        haskell-mode
                        hcl-mode
                        html-mode
                        inf-mongo-mode
                        jade-mode
                        java-mode
                        js-mode
                        js2-mode
                        json-mode
                        jsonnet-mode
                        less-css-mode
                        lisp-mode
                        litcoffee-mode
                        lua-mode
                        makefile-gmake-mode
                        markdown-mode
                        md-ts-mode
                        mediawiki-mode
                        mustache-mode
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
                        zig-mode
                        )) ;; whitespace-mode mail-mode

;; ;; Hooks with many minor modes enabled.
;; (setq init-base-modes-hooks '())
;; (dolist (mode init-base-modes)
;;   (add-to-list 'init-base-modes-hooks
;;                (intern (concat (symbol-name mode) "-hook"))))

;; Programming modes.
(setq init-programming-modes
      (append init-base-modes '(
                                clojure-mode
                                emacs-lisp-mode
                                )))

;; Programming modes hooks.
(setq init-programming-modes-hooks '())
(dolist (mode init-programming-modes)
  (add-to-list 'init-programming-modes-hooks
               (intern (concat (symbol-name mode) "-hook"))))

;; Overview modes (used by display line numbers mode and leerzeichen mode).
(setq init-overview-modes
      (append init-programming-modes
              '(
                Buffer-menu-mode
                Man-mode
                compilation-mode
                dired-mode
                flycheck-error-list-mode
                go-test-mode
                help-mode
                ibuffer-mode
                ivy-occur-grep-mode
                logview-mode
                magit-diff-mode
                magit-log-mode
                magit-process-mode
                magit-status-mode
                messages-buffer-mode
                occur-mode
                shell-mode
                )))

;; Overview mode hooks (used by display line numbers mode and leerzeichen mode).
(setq init-overview-mode-hooks '())
(dolist (mode init-overview-modes)
  (add-to-list 'init-overview-mode-hooks
               (intern (concat (symbol-name mode) "-hook"))))

;; My custom variables
;; <https://emacs.stackexchange.com/questions/55018/init-el-and-trampling-of-custom-set-variables>,
;; <https://emacs.stackexchange.com/questions/102/advantages-of-setting-variables-with-setq-instead-of-custom-el/106>.
(setq custom-file (file-name-concat user-emacs-directory "custom.el"))
(load custom-file)

(require 'package)
;;; Cask
;;; <https://github.com/cask/cask>.
(setq package-user-dir (file-name-concat user-emacs-directory "cask")) ;; symling to the some cask version, for example ~/.config/emacs/.cask/12.3/elpa
(package-initialize)

(add-to-list 'load-path (file-name-concat user-emacs-directory "init"))

(message "Initializing align") (require 'init-align "init-align")
(message "Initializing ansi-color") (require 'init-ansi-color "init-ansi-color") (add-hook 'after-init-hook 'init-ansi-color) ; FIXME: Maybe rename the `init-ansi-color.el` file to the `c-x-c-x-ansi-color.el` and the `init-ansi-color` function to the `c-x-c-x-ansi-color`?~~~~<danil@kutkevich.org>
(message "Initializing anzu") (require 'init-anzu "init-anzu") (init-anzu) (add-hook 'after-init-hook 'init-global-anzu-mode)
(message "Initializing back-button") (require 'init-back-button "init-back-button") (add-hook 'after-init-hook 'init-global-back-button-mode-on)
(message "Initializing bash-completion") (require 'init-bash-completion "init-bash-completion") (add-hook 'after-init-hook 'init-bash-completion)
(message "Initializing buff-menu") (require 'init-buff-menu "init-buff-menu") (add-hook 'after-init-hook 'init-buff-menu)
(message "Initializing built-in-src") (autoload 'init-kill-emacs "init-built-in-src.el" nil t)
(message "Initializing bytecomp") (require 'init-bytecomp "init-bytecomp") (add-hook 'after-init-hook 'init-bytecomp)
(message "Initializing caddyfile-mode") (require 'init-caddyfile-mode "init-caddyfile-mode") (add-hook 'after-init-hook 'init-global-caddyfile-mode-on)
(message "Initializing calendar") (require 'init-calendar "init-calendar") (add-hook 'after-init-hook 'init-calendar)
(message "Initializing cc-mode") (require 'init-cc-mode "init-cc-mode") (add-hook 'after-init-hook 'init-cc-mode)
(message "Initializing clojure-mode") (require 'init-clojure-mode "init-clojure-mode") (add-hook 'after-init-hook 'init-clojure-mode)
(message "Initializing column-marker") (require 'init-column-marker "init-column-marker") (add-hook 'after-init-hook 'init-column-marker)
(message "Initializing csharp-mode") (require 'init-csharp-mode "init-csharp-mode") ; TODO: Autoload.~~~~<danil@kutkevich.org>
(message "Initializing comint") (require 'init-comint "init-comint") (add-hook 'after-init-hook 'init-comint)
(message "Initializing compile") (require 'init-compile "init-compile") (add-hook 'after-init-hook 'init-compile) (add-hook 'after-init-hook 'init-global-compile-mode)
(message "Initializing conf-mode") (require 'init-conf-mode "init-conf-mode") (add-hook 'after-init-hook 'init-conf-mode)
(message "Initializing corral") (require 'init-corral "init-corral") (add-hook 'after-init-hook 'init-global-corral-mode) ;; smartparens replacement (quotes/parentheses/delimiters manager)
(message "Initializing crontab-mode") (require 'init-crontab-mode "init-crontab-mode") (add-hook 'after-init-hook 'init-crontab-mode)
(message "Initializing init-css") (autoload 'init-css-mode-rainbow-identifiers-init "init-css" nil t)
(message "Initializing cycle-quotes") (require 'init-cycle-quotes "init-cycle-quotes") (add-hook 'after-init-hook 'init-global-cycle-quotes-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; vvv↓vvv Company mode <https://github.com/company-mode/company-mode> below this line.

;; Company mode auto complete.
;; (message "Initializing company-elisp") (require 'init-company-elisp "init-company-elisp") (add-hook 'after-init-hook 'init-company-elisp) ; FAIL: Company backend ’company-elisp’ could not be initialized: Symbol’s function definition is void: company-elisp
(message "Initializing company") (require 'init-company "init-company") (add-hook 'after-init-hook 'init-company) (add-hook 'after-init-hook 'init-global-company-mode)
(message "Initializing company-css") (require 'init-company-css "init-company-css") (add-hook 'after-init-hook 'init-company-css)
(message "Initializing company-erlang") (require 'init-company-erlang "init-company-erlang") (add-hook 'after-init-hook 'init-company-erlang)
(message "Initializing company-inf-ruby") (require 'init-company-inf-ruby "init-company-inf-ruby") (add-hook 'after-init-hook 'init-company-inf-ruby)
(message "Initializing company-lua") (require 'init-company-lua "init-company-lua") (add-hook 'after-init-hook 'init-company-lua)
(message "Initializing company-nginx") (require 'init-company-nginx "init-company-nginx") (add-hook 'after-init-hook 'init-company-nginx)
(message "Initializing company-shell") (require 'init-company-shell "init-company-shell") (add-hook 'after-init-hook 'init-company-shell)
(message "Initializing company-web") (require 'init-company-web "init-company-web") (add-hook 'after-init-hook 'init-company-web)

;;; ^^^↑^^^ Company mode <https://github.com/company-mode/company-mode> above this line.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; vvv↓vvv Counsel/Ivy <https://github.com/emacsmirror/ivy> below this line.

;; Counsel/Ivy/Swiper (is an ido replacement).
(message "Initializing counsel") (require 'init-counsel "init-counsel") ;; (add-hook 'after-init-hook 'init-counsel)
(message "Initializing ivy-historian") (require 'init-ivy-historian "init-ivy-historian") (add-hook 'after-init-hook 'init-ivy-historian)

;;; ^^^↑^^^ Counsel/Ivy <https://github.com/emacsmirror/ivy> above this line.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; vvv↓vvv Fringe line <https://www.emacswiki.org/emacs/TheFringe> below this line.

(message "Initializing diff-hl") (require 'init-diff-hl "init-diff-hl") ; TODO: Autoload.~~~~<danil@kutkevich.org>

;;; ^^^↑^^^ Fringe line <https://www.emacswiki.org/emacs/TheFringe> above this line.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (message "Initializing dart-mode") (require 'init-dart-mode "init-dart-mode") (add-hook 'after-init-hook 'init-global-dart-mode-on)
(message "Initializing deft") (autoload 'init-deft-init "init-deft" nil t)
(message "Initializing diff-mode") (require 'init-diff-mode "init-diff-mode") (add-hook 'after-init-hook 'init-diff-mode)
(message "Initializing digit-groups") (require 'init-digit-groups "init-digit-groups") (add-hook 'after-init-hook 'init-digit-groups)
(message "Initializing disp-table-line-wrap-and-truncation") (require 'init-disp-table-line-wrap-and-truncation "init-disp-table-line-wrap-and-truncation") (add-hook 'after-init-hook 'init-disp-table-line-wrap-and-truncation)
(message "Initializing disp-table-vertical-border") (require 'init-disp-table-vertical-border "init-disp-table-vertical-border") (add-hook 'after-init-hook 'init-disp-table-vertical-border)
(message "Initializing dockerfile-mode") (require 'init-dockerfile-mode "init-dockerfile-mode") (add-hook 'after-init-hook 'init-dockerfile-mode)
(message "Initializing dumb-jump") (require 'init-dumb-jump "init-dumb-jump") (add-hook 'after-init-hook 'init-dumb-jump)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; vvv↓vvv Dired mode below this line.

(message "Initializing dired") (require 'init-dired "init-dired") (add-hook 'after-init-hook 'init-dired)
(message "Initializing dired-aux") (require 'init-dired-aux "init-dired-aux") (add-hook 'after-init-hook 'init-dired-aux)
(message "Initializing dired-details") (require 'init-dired-details "init-dired-details") (add-hook 'after-init-hook 'init-dired-details)
(message "Initializing diredfl") (require 'init-diredfl "init-diredfl") (add-hook 'after-init-hook 'init-diredfl)
(message "Initializing wdired") (require 'init-wdired "init-wdired") (add-hook 'after-init-hook 'init-wdired)

;;; ^^^↑^^^ Dired mode above this line.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (message "Initializing dotenv") (require 'dotenv "init-dotenv")
(message "Initializing elisp-slime-nav") (require 'init-elisp-slime-nav "init-elisp-slime-nav") (add-hook 'after-init-hook 'init-elisp-slime-nav)
(message "Initializing elixir-mode") (autoload 'init-elixir-mode-rainbow-identifiers-init "init-elixir-mode" nil t)
(message "Initializing emacs-lisp-mode") (require 'init-emacs-lisp-mode "init-emacs-lisp-mode") (add-hook 'after-init-hook 'init-emacs-lisp-mode)
(message "Initializing emacs-lisp-mode-rainbow-identifiers") (require 'init-emacs-lisp-mode-rainbow-identifiers "init-emacs-lisp-mode-rainbow-identifiers")
(message "Initializing etags-select") (require 'init-etags-select "init-etags-select") (add-hook 'after-init-hook 'init-etags-select)
(message "Initializing etags-select") (require 'init-etags-select "init-etags-select") (add-hook 'after-init-hook 'init-etags-select)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; vvv↓vvv Evil mode <https://github.com/emacs-evil/evil> below this line.

(message "Initializing evil") (require 'init-evil "init-evil") (add-hook 'after-init-hook 'init-evil)
(message "Initializing evil-collection") (require 'init-evil-collection "init-evil-collection") (add-hook 'after-init-hook 'init-evil-collection)
(message "Initializing evil-repeat") (require 'init-evil-repeat "init-evil-repeat") (add-hook 'after-init-hook 'init-evil-repeat) ; (autoload 'init--evil-repeat "init-evil-repeat" nil t)

;;; ^^^↑^^^ Evil mode <https://github.com/emacs-evil/evil> above this line.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(message "Initializing expand-region") (require 'init-expand-region "init-expand-region") (add-hook 'after-init-hook 'init-expand-region)
(message "Initializing faces") (require 'init-faces "init-faces") ; TODO: Autoload.~~~~<danil@kutkevich.org>
(message "Initializing ferm-mode") (require 'init-ferm-mode "init-ferm-mode") (add-hook 'after-init-hook 'init-ferm-mode)
(message "Initializing files") (autoload 'init-files-list "init-files" nil t) (autoload 'init-files-find-file "init-files" nil t)
(message "Initializing find-temp-file") (require 'init-find-temp-file-mode "init-find-temp-file-mode") (add-hook 'after-init-hook 'init-global-find-temp-file-mode-on)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (message "Initializing xt-mouse") (require 'init-xt-mouse "init-xt-mouse") (add-hook 'after-init-hook 'init-xt-mouse)
(message "Initializing consult") (require 'init-consult "init-consult") (add-hook 'after-init-hook 'init-consult)
(message "Initializing display-line-numbers-mode") (require 'init-display-line-numbers-mode "init-display-line-numbers-mode") (add-hook 'after-init-hook 'init-global-display-line-numbers-mode-on)
(message "Initializing help") (require 'init-help "init-help") (add-hook 'after-init-hook 'init-help)
(message "Initializing highlight-thing") (require 'init-highlight-thing "init-highlight-thing") (add-hook 'after-init-hook 'init-global-highlight-thing-mode-on)
(message "Initializing leerzeichen-mode") (require 'init-leerzeichen-mode "init-leerzeichen-mode") (add-hook 'after-init-hook 'init-global-leerzeichen-mode-on) (add-hook 'after-init-hook 'init-leerzeichen-mode-customize) ; `leerzeichen-mode` is a minor mode to display whitespace characters <https://github.com/fgeller/leerzeichen.el>.
(message "Initializing minibuffer") (require 'init-minibuffer "init-minibuffer") (add-hook 'after-init-hook 'init-minibuffer)
(message "Initializing overview-mode") (require 'init-overview-mode "init-overview-mode")
(message "Initializing quickrun") (require 'init-quickrun "init-quickrun") (add-hook 'after-init-hook 'init-quickrun)
(message "Initializing replace") (require 'init-replace "init-replace-occur") (add-hook 'after-init-hook 'init-replace) ; Is a multi-occur on dired files a-la find/grep <https://github.com/nicolaspetton/noccur.el>.
(message "Initializing sh-mode") (require 'init-sh-mode "init-sh-script") (add-hook 'after-init-hook 'init-global-sh-mode-on)
(message "Initializing shell") (require 'init-shell "init-shell") (add-hook 'after-init-hook 'init-shell)
(message "Initializing subr") (require 'init-subr "init-subr") (add-hook 'after-init-hook 'init-subr)
(message "Initializing tramp-cache") (require 'init-tramp-cache "init-tramp-cache") (add-hook 'after-init-hook 'init-tramp-cache)
(message "Initializing unique-lines") (autoload 'init-unique-lines-region "init-unique-lines" nil t) (autoload 'init-unique-lines-buffer "init-unique-lines" nil t)
(message "Initializing window") (autoload 'init-window-delete-other-windows "init-window" nil t) (autoload 'init-window-bury-buffer-maybe-delete-window "init-window" nil t) (autoload 'init-window-maybe-delete-window-maybe-kill-buffer-open-dired "init-window" nil t) (autoload 'init-window-maybe-delete-window-maybe-kill-buffer "init-window" nil t)
(message "Initializing zig-mode") (require 'init-zig-mode "init-zig-mode") (add-hook 'after-init-hook 'init-global-zig-mode-on)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(message "Initializing flycheck") (require 'init-flycheck-mode "init-flycheck-mode") (add-hook 'after-init-hook 'init-global-flycheck-mode-on)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; vvv↓vvv Go programming language <https://github.com/dominikh/go-mode.el> below this line.

(message "Initializing go-mode") (require 'init-go-mode "init-go-mode") (add-hook 'after-init-hook 'init-global-go-mode-on)

;;; ^^^↑^^^ Go programming language <https://github.com/dominikh/go-mode.el> above this line.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(message "Initializing gitconfig-mode") (require 'init-gitconfig-mode "init-gitconfig-mode") (add-hook 'after-init-hook 'init-gitconfig-mode)
(message "Initializing graphql-mode") (require 'init-graphql-mode "init-graphql-mode") (add-hook 'after-init-hook 'init-global-graphql-mode-on)
(message "Initializing handlebars-mode") (require 'init-handlebars-mode "init-handlebars-mode") (add-hook 'after-init-hook 'init-global-handlebars-mode-on)
(message "Initializing hi-lock") (autoload 'init-hi-lock "init-highlight-regexp" nil t)
(message "Initializing hl-line") (require 'init-hl-line "init-hl-line") (add-hook 'after-init-hook 'init-hl-line)
(message "Initializing less-scroll-mode") (autoload 'less-scroll-stub "init-less-scroll-mode" nil t)
(message "Initializing lsp-mode") (autoload 'lsp-find-definition "lsp-mode" nil t) (autoload 'lsp-format-buffer "lsp-mode" nil t) (require 'init-lsp-mode "init-lsp-mode") (add-hook 'after-init-hook 'init-lsp-mode)
(message "Initializing rails") (require 'init-rails "init-rails") (add-hook 'after-init-hook 'init-rails)
(message "Initializing sort") (require 'init-sort "init-sort")

(message "Initializing rainbow-delimiters") (require 'init-rainbow-delimiters "init-rainbow-delimiters") (add-hook 'after-init-hook 'init-rainbow-delimiters)
(message "Initializing rainbow-identifiers") (require 'init-rainbow-identifiers "init-rainbow-identifiers") (add-hook 'after-init-hook 'init-rainbow-identifiers)
(message "Initializing rainbow-mode") (require 'init-rainbow-mode "init-rainbow-mode") (add-hook 'after-init-hook 'init-rainbow-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; vvv↓vvv Selectrum mode <https://github.com/radian-software/selectrum> below this line.

;;; DEPRECATED: The original author of Selectrum, @raxod502, now uses Vertico mode <https://github.com/minad/vertico>!~~~~<danil@kutkevich.org>

;; Selectrum a-la ido/ivy/counsel <https://github.com/raxod502/selectrum>.
(message "Initializing selectrum") (require 'init-selectrum "init-selectrum") (add-hook 'after-init-hook 'init-selectrum) (add-hook 'after-init-hook 'init-global-selectrum-mode) ;; a-la ido/ivy/counsel
(message "Initializing selectrum-prescient") (require 'init-selectrum-prescient "init-selectrum-prescient") (add-hook 'after-init-hook 'init-selectrum-prescient)
(message "Initializing prescient") (require 'init-prescient "init-prescient") (add-hook 'after-init-hook 'init-prescient)
(message "Initializing amx-mode") (amx-mode +1)

;;; ^^^↑^^^ Selectrum mode <https://github.com/radian-software/selectrum> above this line.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; vvv↓vvv Mode line below this line.

(message "Initializing smart-mode-line") (require 'init-smart-mode-line "init-smart-mode-line") (add-hook 'after-init-hook 'init-smart-mode-line)
(message "Initializing window-numbering") (require 'init-window-numbering "init-window-numbering") (add-hook 'after-init-hook 'init-window-numbering)

;;; ^^^↑^^^ Mode line above this line.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(message "Initializing make-mode") (require 'init-make-mode "init-make-mode") (add-hook 'after-init-hook 'init-global-make-mode-on)

;;; vvv↓vvv Projectile mode below this line.

(message "Initializing projectile") (require 'init-projectile "init-projectile") (add-hook 'after-init-hook 'init-projectile)
;; (message "Initializing projectile-rails") (require 'init-projectile-rails "init-projectile-rails") (add-hook 'after-init-hook 'init-projectile-rails) ; FAIL: Eager macro-expansion failure: (error "Shortdoc f function ‘f-older-p’: bad keyword ‘:noeval’")

;;; ^^^↑^^^ Projectile mode above this line.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(message "Initializing simple") (require 'init-simple "init-simple") (add-hook 'after-init-hook 'init-simple) (add-hook 'after-init-hook 'init-global-simple-mode)

;;; FIXME: nox recipe is DEPRECATED!~~~~<danil@kutkevich.org>

(require 'noxrcp (file-name-concat user-emacs-directory "noxrcp.el"))

(defvar noxel-map (make-sparse-keymap) "Default keymap for noxel commands.") ; TODO: Remove me!~~~~<danil@kutkevich.org>

(defun noxel-kbd-fn (key) (kbd (concat "C-x C-x " key))) ; TODO: Remove me!~~~~<danil@kutkevich.org>

(defvar nox-recipes ())

(defun nox-recipe (recipes)
  (dolist (recipe recipes) (add-to-list 'nox-recipes recipe)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(nox-recipe '(fish-mode))
(nox-recipe '(font-core))

;; (nox-recipe '(flycheck-gometalinter))
;; (nox-recipe '(flycheck-bashate))
;; (nox-recipe '(flycheck-golangci-lint))

(nox-recipe '(go-stacktracer))
(nox-recipe '(godoctor))
(nox-recipe '(gotest))

(nox-recipe '(git-timemachine))
(nox-recipe '(gitignore-mode))
(nox-recipe '(haproxy-mode))
(nox-recipe '(hcl-mode))
(nox-recipe '(hideshow))
(nox-recipe '(highlight-static-regexps))
(nox-recipe '(highlight-static-regexps-tmp))
(nox-recipe '(hl-todo))
(nox-recipe '(hydra))

;; doom emacs.
(let ((f (file-name-concat user-emacs-directory "doom-core-lib.el")))
  (if (file-readable-p f)
      (require 'core-lib f) ; provide `add-hook!' which fixes `ivy's `ivy-truncate-lines'
    (display-warning :doom-core-lib (format "Doom Emacs core lib not found: %s" f))))
;; (autoload 'doom-modeline-set-modeline (file-name-concat user-emacs-directory "doom-modeline.el") nil t)

;; doom todo ivy.a
(autoload 'doom/ivy-todos (file-name-concat user-emacs-directory "doom-todo-ivy") nil t)
;; (let ((f (file-name-concat user-emacs-directory "doom-todo-ivy.el")))
;;   (if (file-readable-p f)
;;       (require 'doom-todo-ivy f)
;;     (display-warning :doom-todo-ivy.el (format "Doom Emacs TODO ivy not found: %s" f))))

(autoload 'dotenv-eval-region (file-name-concat user-emacs-directory "dotenv") nil t)

(autoload 'go-mod-mode (file-name-concat user-emacs-directory "go-mod-mode") nil t)

;; (nox-recipe '(iedit)) ;isearch + edit is an a-la multiple-cursors-mode
;; (nox-recipe '(inf-mongo)) ; FAIL: Some dependencies were not available: inf-mongo
(nox-recipe '(ibuffer))
(nox-recipe '(ielm))
(nox-recipe '(indent))
(nox-recipe '(info))
(nox-recipe '(interprogram))
(nox-recipe '(isearch))
(nox-recipe '(ispell))

;; JavaScript.
(nox-recipe '(coffee-mode))
(nox-recipe '(js-mode))
(nox-recipe '(js2-mode))
(nox-recipe '(json-mode))
(nox-recipe '(typescript-mode))

(nox-recipe '(kill-ring))

(nox-recipe '(lisp-mode))
(nox-recipe '(logview))
(nox-recipe '(lua-mode))

(nox-recipe '(magit))
(nox-recipe '(magit-blame))

(nox-recipe '(markdown-mode))
(nox-recipe '(markdown-toc))
(nox-recipe '(markdownfmt))

(nox-recipe '(mediawiki))
(nox-recipe '(menu-bar))
(nox-recipe '(multi-compile))
(nox-recipe '(my-backspace-fix))
(nox-recipe '(my-beginning-of-line))
(nox-recipe '(my-color-theme))
(nox-recipe '(my-current-local-map))
(nox-recipe '(my-project))
(nox-recipe '(my-shell-command-on-current-file))
(nox-recipe '(my-sum-numbers-in-region))
(nox-recipe '(my-tags))
(nox-recipe '(narrow-indirect))
(nox-recipe '(newcomment))
(nox-recipe '(nginx-mode))
(nox-recipe '(nodejs))
(nox-recipe '(nodejs-repl))
(nox-recipe '(nxml-mode))
(nox-recipe '(org-mode org-ac))
(nox-recipe '(org-mode))
(nox-recipe '(origami))

(nox-recipe '(paren))
(nox-recipe '(password-cache))
(nox-recipe '(php-mode))
(nox-recipe '(pinentry)) ;gnupg password in minibuffer prompt instead of graphical dialog <https://unix.stackexchange.com/questions/55638/can-emacs-use-gpg-agent-in-a-terminal-at-all/278875#278875>
(nox-recipe '(protobuf-mode))
(nox-recipe '(python))
(nox-recipe '(re-builder))
(nox-recipe '(recentf))
(nox-recipe '(recentf))
(nox-recipe '(recentf-ext))
(nox-recipe '(redis))
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

(nox-recipe '(savehist))
(nox-recipe '(saveplace))
(nox-recipe '(scroll-bar))
(nox-recipe '(scss-mode))
(nox-recipe '(sgml-mode))
(nox-recipe '(string-inflection))
(nox-recipe '(simp))
(nox-recipe '(slim-mode))
(nox-recipe '(su))
(nox-recipe '(subword-mode))
(nox-recipe '(systemd))

(nox-recipe '(sql))
(nox-recipe '(sql-mode))
(nox-recipe '(sql-mysql))
(nox-recipe '(sql-postgres))

(nox-recipe '(telnet))
(nox-recipe '(text-mode))
;; (nox-recipe '(tldr))
(nox-recipe '(toml-mode))
(nox-recipe '(transpose-frame))
(nox-recipe '(two-column)) ;disable fucking two-column mode
(nox-recipe '(uniquify)) ; uniquify buffer name
(nox-recipe '(vc-hooks))
(nox-recipe '(visual-regexp))
(nox-recipe '(vlf))
(nox-recipe '(web-mode))
(nox-recipe '(winner-mode))
(nox-recipe '(yaml-mode))
(nox-recipe '(yasnippet))
;; (nox-recipe '(yafolding))
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
  (let* ((file (format "init-%s.el" recipe))
         (path (file-name-concat user-emacs-directory "recipes" file)))

    (if (file-readable-p path)
        (load-file path)
      (display-warning :noxrcp (format "Recipe file not found: %s" path)))))

(noxrcp-global-mode 1)

(add-hook 'after-init-hook 'noxrcp-init)

(defun noxrcp-init ()
  "Init."

  (global-set-key (kbd "C-x C-x") noxel-map))

(let ((f (file-name-concat user-emacs-directory "noxrcp.el")))
  (if (file-readable-p f)
      (require 'noxrcp f)
    (display-warning :noxrcp (format "nox rcp not found: %s" f))))

(custom-set-variables

;;  '(init-programming-modes
;;    (append init-base-modes
;;            '(
;;              clojure-mode
;;              emacs-lisp-mode
;;              )))

;;  '(noxrcp-auto-completion-modes
;;    (append init-programming-modes
;;            '(
;;              redis-cli-mode
;;              shell-mode
;;              telnet-mode
;;              wdired-mode
;;              )))

;;  '(noxrcp-toggle-quotes-modes
;;    '(
;;      awk-mode
;;      cask-mode
;;      coffee-mode
;;      conf-mode
;;      conf-space-mode
;;      conf-xdefaults-mode
;;      csharp-mode
;;      css-mode
;;      emacs-lisp-mode
;;      enh-ruby-mode
;;      haml-mode
;;      haskell-mode
;;      html-mode
;;      java-mode
;;      js-mode
;;      js2-mode
;;      lisp-mode
;;      lua-mode
;;      makefile-gmake-mode
;;      markdown-mode
;;      md-ts-mode
;;      nxml-mode
;;      org-mode
;;      perl-mode
;;      php-mode
;;      rhtml-mode
;;      ruby-mode
;;      sass-mode
;;      scss-mode
;;      sgml-mode
;;      sh-mode
;;      shell-mode
;;      slim-mode
;;      sql-mode
;;      xml-mode
;;      yaml-mode
;;      ))

;; (dolist (mode noxrcp-auto-completion-modes)
;;   (add-to-list 'noxrcp-auto-completion-modes-hooks
;;                (intern (concat (symbol-name mode) "-hook"))))

;; (dolist (mode noxrcp-toggle-quotes-modes)
;;   (add-to-list 'noxrcp-toggle-quotes-modes-hooks
;;                (intern (concat (symbol-name mode) "-hook"))))

)

(defun my-terminal-cursor-color (color)
  "Sets the terminal cursor colour by sending the appropriate escape sequence."
  (interactive
   (list (read-color "Color (white): " nil :allow-empty)))
  (when (string= color "")
    (setq color "white"))
  (send-string-to-terminal
   (concat "\033]12;" color "\007")))

;; (put 'magit-diff-edit-hunk-commit 'disabled nil)
