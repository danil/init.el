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

;;; ElDoc annoying in all buffers/modes.
(global-eldoc-mode -1)

;; (setenv "ESHELL" (expand-file-name "/bin/zsh")) ;; terminal <http://stackoverflow.com/questions/1568987/getting-emacs-to-respect-my-default-shell-options#1570246>
(setenv "GIT_PAGER" "")

(setq init-key-prefix "C-v ")
(setq init-exec-key-prefix (concat init-key-prefix "x "))

;; Seconds to wait for lazy timer.
(setq init-lazy-seconds 1)

;; <http://emacs.stackexchange.com/questions/12532/buffer-local-idle-timer#13275>.
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
(setq init-base-modes '(autoconf-mode awk-mode c-mode cask-mode change-log-mode coffee-mode conf-colon-mode conf-mode conf-space-mode conf-unix-mode conf-xdefaults-mode crontab-mode csharp-mode css-mode diff-mode dockerfile-mode ebuild-mode elixir-mode enh-ruby-mode ferm-mode fish-mode git-commit-mode gitconfig-mode gitignore-mode go-mode haml-mode haskell-mode hcl-mode html-mode inf-mongo-mode jade-mode java-mode js-mode js2-mode json-mode less-css-mode lisp-mode litcoffee-mode lua-mode makefile-gmake-mode markdown-mode mediawiki-mode nginx-mode nodejs-repl-mode nroff-mode nxml-mode org-mode pascal-mode perl-mode php-mode protobuf-mode python-mode restclient-mode rhtml-mode ruby-mode rust-mode sass-mode sed-mode sgml-mode sh-mode sieve-mode slim-mode sql-mode systemd-mode text-mode toml-mode web-mode xml-mode yaml-mode)) ;; whitespace-mode mail-mode

;; ;; Hooks with many minor modes enabled.
;; (setq init-base-modes-hooks '())
;; (dolist (mode init-base-modes)
;;   (add-to-list 'init-base-modes-hooks
;;                (intern (concat (symbol-name mode) "-hook"))))

;; Programming modes.
(setq init-programming-modes (append init-base-modes '(clojure-mode emacs-lisp-mode)))

;; Programming modes hooks.
(setq init-programming-modes-hooks '())
(dolist (mode init-programming-modes)
  (add-to-list 'init-programming-modes-hooks
               (intern (concat (symbol-name mode) "-hook"))))

;; My custom variables
;; <https://emacs.stackexchange.com/questions/55018/init-el-and-trampling-of-custom-set-variables>,
;; <https://emacs.stackexchange.com/questions/102/advantages-of-setting-variables-with-setq-instead-of-custom-el/106>.
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file)

;;; Cask.
;;; Initialize Elpa packages via Cask
;;; <http://cask.readthedocs.org/en/latest/guide/usage.html#usage>.
(require 'cask "~/.cask/cask.el")
(cask-initialize)

(add-to-list 'load-path (concat user-emacs-directory "init/"))

(message "Initializing align") (require 'init-align "init-align")
(message "Initializing ansi-color") (require 'init-ansi-color "init-ansi-color") (add-hook 'after-init-hook 'init-ansi-color)
(message "Initializing anzu") (require 'init-anzu "init-anzu") (init-anzu) (add-hook 'after-init-hook 'init-global-anzu-mode)
(message "Initializing bash-completion") (require 'init-bash-completion "init-bash-completion") (add-hook 'after-init-hook 'init-bash-completion)
(message "Initializing bindings") (require 'init-bindings "init-bindings") (add-hook 'after-init-hook 'init-global-bindings-mode)
(message "Initializing browse-url") (require 'init-browse-url "init-browse-url") (add-hook 'after-init-hook 'init-global-browse-url-mode)
(message "Initializing bytecomp") (require 'init-bytecomp "init-bytecomp") (add-hook 'after-init-hook 'init-bytecomp)
(message "Initializing calendar") (require 'init-calendar "init-calendar") (add-hook 'after-init-hook 'init-calendar)
(message "Initializing cc-mode") (require 'init-cc-mode "init-cc-mode") (add-hook 'after-init-hook 'init-cc-mode)
(message "Initializing clojure-mode") (require 'init-clojure-mode "init-clojure-mode") (add-hook 'after-init-hook 'init-clojure-mode)
(message "Initializing column-marker") (require 'init-column-marker "init-column-marker") (add-hook 'after-init-hook 'init-column-marker)
(message "Initializing csharp-mode") (require 'init-csharp-mode "init-csharp-mode") ;; TODO: autoload
(message "Initializing comint") (require 'init-comint "init-comint") (add-hook 'after-init-hook 'init-comint)
(message "Initializing compile") (require 'init-compile "init-compile") (add-hook 'after-init-hook 'init-compile) (add-hook 'after-init-hook 'init-global-compile-mode)
(message "Initializing conf-mode") (require 'init-conf-mode "init-conf-mode") (add-hook 'after-init-hook 'init-conf-mode)
(message "Initializing corral") (require 'init-corral "init-corral") (add-hook 'after-init-hook 'init-global-corral-mode) ;; smartparens replacement (quotes/parentheses/delimiters manager)
(message "Initializing crontab-mode") (require 'init-crontab-mode "init-crontab-mode") (add-hook 'after-init-hook 'init-crontab-mode)
(message "Initializing init css") (autoload 'init-css-mode-rainbow-identifiers-setup "init-css" nil t)
(message "Initializing cycle-quotes") (require 'init-cycle-quotes "init-cycle-quotes") (add-hook 'after-init-hook 'init-global-cycle-quotes-mode)

;; Company mode auto complete.
(message "Initializing company") (require 'init-company "init-company") (add-hook 'after-init-hook 'init-company) (add-hook 'after-init-hook 'init-global-company-mode)
(message "Initializing company-css") (require 'init-company-css "init-company-css") (add-hook 'after-init-hook 'init-company-css)
(message "Initializing company-elisp") (require 'init-company-elisp "init-company-elisp") (add-hook 'after-init-hook 'init-company-elisp)
(message "Initializing company-erlang") (require 'init-company-erlang "init-company-erlang") (add-hook 'after-init-hook 'init-company-erlang)
(message "Initializing company-inf-ruby") (require 'init-company-inf-ruby "init-company-inf-ruby") (add-hook 'after-init-hook 'init-company-inf-ruby)
(message "Initializing company-lua") (require 'init-company-lua "init-company-lua") (add-hook 'after-init-hook 'init-company-lua)
(message "Initializing company-nginx") (require 'init-company-nginx "init-company-nginx") (add-hook 'after-init-hook 'init-company-nginx)
(message "Initializing company-shell") (require 'init-company-shell "init-company-shell") (add-hook 'after-init-hook 'init-company-shell)
(message "Initializing company-web") (require 'init-company-web "init-company-web") (add-hook 'after-init-hook 'init-company-web)

;; Counsel/Ivy/Swiper (is an ido replacement).
(message "Initializing counsel") (require 'init-counsel "init-counsel") (add-hook 'after-init-hook 'init-counsel) (add-hook 'after-init-hook 'init-global-counsel-mode)
(message "Initializing ivy-historian") (require 'init-ivy-historian "init-ivy-historian") (add-hook 'after-init-hook 'init-ivy-historian)

;; Fringe <https://www.emacswiki.org/emacs/TheFringe>.
(message "Initializing diff-hl") (require 'init-diff-hl "init-diff-hl") ;; TODO: autoload
(message "Initializing fringe") (require 'init-fringe "init-fringe") (add-hook 'after-init-hook 'init-global-fringe-mode)

(message "Initializing deft") (require 'init-deft "init-deft") (add-hook 'after-init-hook 'init-global-deft-mode)
(message "Initializing desktop") (require 'init-desktop "init-desktop") (add-hook 'after-init-hook 'init-global-desktop-mode)
(message "Initializing diff-mode") (require 'init-diff-mode "init-diff-mode") (add-hook 'after-init-hook 'init-diff-mode)
(message "Initializing digit-groups") (require 'init-digit-groups "init-digit-groups") (add-hook 'after-init-hook 'init-digit-groups)
(message "Initializing disp-table-line-wrap-and-truncation") (require 'init-disp-table-line-wrap-and-truncation "init-disp-table-line-wrap-and-truncation") (add-hook 'after-init-hook 'init-disp-table-line-wrap-and-truncation)
(message "Initializing disp-table-vertical-border") (require 'init-disp-table-vertical-border "init-disp-table-vertical-border") (add-hook 'after-init-hook 'init-disp-table-vertical-border)
(message "Initializing dockerfile-mode") (require 'init-dockerfile-mode "init-dockerfile-mode") (add-hook 'after-init-hook 'init-dockerfile-mode)
(message "Initializing dumb-jump") (require 'init-dumb-jump "init-dumb-jump") (add-hook 'after-init-hook 'init-dumb-jump)

;; Dired.
(message "Initializing dired") (require 'init-dired "init-dired") (add-hook 'after-init-hook 'init-dired)
(message "Initializing dired-aux") (require 'init-dired-aux "init-dired-aux") (add-hook 'after-init-hook 'init-dired-aux)
(message "Initializing dired-details") (require 'init-dired-details "init-dired-details") (add-hook 'after-init-hook 'init-dired-details)
(message "Initializing diredfl") (require 'init-diredfl "init-diredfl") (add-hook 'after-init-hook 'init-diredfl)
(message "Initializing wdired") (require 'init-wdired "init-wdired") (add-hook 'after-init-hook 'init-wdired)

(message "Initializing elisp-slime-nav") (require 'init-elisp-slime-nav "init-elisp-slime-nav") (add-hook 'after-init-hook 'init-elisp-slime-nav)
(message "Initializing elixir-mode") (autoload 'init-elixir-mode-rainbow-identifiers-setup "init-elixir-mode" nil t)
(message "Initializing emacs-lisp-mode") (require 'init-emacs-lisp-mode "init-emacs-lisp-mode") (add-hook 'after-init-hook 'init-emacs-lisp-mode)
(message "Initializing etags-select") (require 'init-etags-select "init-etags-select") (add-hook 'after-init-hook 'init-etags-select)
(message "Initializing ethan-wspace") (require 'init-ethan-wspace "init-ethan-wspace") (add-hook 'after-init-hook 'init-ethan-wspace)
(message "Initializing expand-region") (require 'init-expand-region "init-expand-region") (add-hook 'after-init-hook 'init-expand-region)
(message "Initializing faces") (require 'init-faces "init-faces") ;; TODO: autoload
(message "Initializing ferm-mode") (require 'init-ferm-mode "init-ferm-mode") (add-hook 'after-init-hook 'init-ferm-mode)
(message "Initializing files") (require 'init-files "init-files") (add-hook 'after-init-hook 'init-files)
(message "Initializing fill") (require 'init-fill "init-fill") (add-hook 'after-init-hook 'init-fill)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(message "Initializing rails") (require 'init-rails "init-rails") (add-hook 'after-init-hook 'init-rails)

(message "Initializing rainbow-delimiters") (require 'init-rainbow-delimiters "init-rainbow-delimiters") (add-hook 'after-init-hook 'init-rainbow-delimiters)
(message "Initializing rainbow-identifiers") (require 'init-rainbow-identifiers "init-rainbow-identifiers") (add-hook 'after-init-hook 'init-rainbow-identifiers)
(message "Initializing rainbow-mode") (require 'init-rainbow-mode "init-rainbow-mode") (add-hook 'after-init-hook 'init-rainbow-mode)

;; Selectrum a-la ido/ivy/counsel <https://github.com/raxod502/selectrum>.
(message "Initializing selectrum") (require 'init-selectrum "init-selectrum") (add-hook 'after-init-hook 'init-selectrum) (add-hook 'after-init-hook 'init-global-selectrum-mode) ;; a-la ido/ivy/counsel
(message "Initializing selectrum-prescient") (require 'init-selectrum-prescient "init-selectrum-prescient") (add-hook 'after-init-hook 'init-selectrum-prescient)
(message "Initializing prescient") (require 'init-prescient "init-prescient") (add-hook 'after-init-hook 'init-prescient)
(message "Initializing amx-mode") (amx-mode +1)

;; Mode line.
(message "Initializing smart-mode-line") (require 'init-smart-mode-line "init-smart-mode-line") (add-hook 'after-init-hook 'init-smart-mode-line)
(message "Initializing window-numbering") (require 'init-window-numbering "init-window-numbering") (add-hook 'after-init-hook 'init-window-numbering)

(message "Initializing highlight-symbol") (require 'init-highlight-symbol "init-highlight-symbol") (add-hook 'after-init-hook 'init-highlight-symbol)

;; Projectile.
(message "Initializing projectile") (require 'init-projectile "init-projectile") (add-hook 'after-init-hook 'init-projectile)
(message "Initializing projectile-rails") (require 'init-projectile-rails "init-projectile-rails") (add-hook 'after-init-hook 'init-projectile-rails)



(require 'noxrcp "~/.emacs.d/noxrcp.el")

(defvar noxel-map (make-sparse-keymap) "Default keymap for noxel commands.") ;; TODO: remove me!

(defun noxel-kbd-fn (key) (kbd (concat "C-v " key))) ;; TODO: remove me!

(defvar nox-recipes ())

(defun nox-recipe (recipes)
  (dolist (recipe recipes) (add-to-list 'nox-recipes recipe)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(nox-recipe '(find-temp-file))
(nox-recipe '(fish-mode))
(nox-recipe '(font-core))

;; (nox-recipe '(flycheck-gometalinter))
;; (nox-recipe '(flycheck-bashate))
(nox-recipe '(flycheck))
(nox-recipe '(flycheck-golangci-lint))

(nox-recipe '(go-expr-completion))
(nox-recipe '(go-mode))
(nox-recipe '(go-stacktracer))
(nox-recipe '(godoctor))
(nox-recipe '(gotest))

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
(nox-recipe '(hl-line))
(nox-recipe '(hl-todo))
(nox-recipe '(hydra))

;; doom emacs.
(let ((f (concat user-emacs-directory "doom-core-lib.el")))
  (if (file-readable-p f)
      (require 'core-lib f) ; provide `add-hook!' which fixes `ivy's `ivy-truncate-lines'
    (display-warning :doom-core-lib (format "Doom Emacs core lib not found: %s" f))))
;; (autoload 'doom-modeline-set-modeline (concat user-emacs-directory "doom-modeline.el") nil t)

;; doom todo ivy.a
(autoload 'doom-todo-ivy (concat user-emacs-directory "doom-todo-ivy.el") nil t)
;; (let ((f (concat user-emacs-directory "doom-todo-ivy.el")))
;;   (if (file-readable-p f)
;;       (require 'doom-todo-ivy f)
;;     (display-warning :doom-todo-ivy.el (format "Doom Emacs TODO ivy not found: %s" f))))
(nox-recipe '(doom-todo-ivy))

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
(nox-recipe '(typescript-mode))

(nox-recipe '(kill-emacs))
(nox-recipe '(kill-ring))

;; (nox-recipe '(lsp-mode))
(nox-recipe '(lisp-mode))
(nox-recipe '(logview))
(nox-recipe '(lua-mode))

(nox-recipe '(magit))
(nox-recipe '(magit-blame))

(nox-recipe '(markdown-mode))
(nox-recipe '(markdown-toc))
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
(nox-recipe '(my-sum-numbers-in-region))
(nox-recipe '(my-tags))
(nox-recipe '(my-uniquify-lines))
(nox-recipe '(narrow-indirect))
(nox-recipe '(newcomment))
(nox-recipe '(nginx-mode))
(nox-recipe '(noccur))
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
(nox-recipe '(quickrun))
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

(nox-recipe '(savehist))
(nox-recipe '(saveplace))
(nox-recipe '(scroll-bar))
(nox-recipe '(scss-mode))
(nox-recipe '(sgml-mode))
(nox-recipe '(sh-script))
(nox-recipe '(string-inflection))
(nox-recipe '(shell))
(nox-recipe '(simp))
(nox-recipe '(simple))
(nox-recipe '(skeletor))
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
(nox-recipe '(visual-regexp))
(nox-recipe '(vlf))
(nox-recipe '(web-mode))
(nox-recipe '(window))
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
      (display-warning :noxrcp (format "Recipe file not found: %s" recipe-file)))))

(noxrcp-global-mode 1)

(add-hook 'after-init-hook 'noxrcp-init)

(defun noxrcp-init ()
  "Init."

  (define-key noxel-map (kbd "x") noxrcp-exec-map)

  (global-set-key (kbd "C-v") noxel-map))

(let ((f (concat user-emacs-directory "noxrcp.el")))
  (if (file-readable-p f)
      (require 'noxrcp f)
    (display-warning :noxrcp (format "nox rcp not found: %s" f))))

(defvar noxrcp-exec-map (make-sparse-keymap)
  "Exec keymap for noxrcp commands.")

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

;;  '(noxrcp-read-only-modes
;;    (append init-base-modes
;;            '(
;;              Info-mode
;;              Man-mode
;;              ag-mode
;;              cider-stacktrace-mode
;;              compilation-mode
;;              dired-mode
;;              help-mode
;;              ibuffer-mode
;;              magit-branch-manager-mode
;;              magit-commit-mode
;;              magit-diff-mode
;;              magit-log-mode
;;              magit-process-mode
;;              magit-status-mode
;;              occur-mode
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

;; (dolist (mode noxrcp-read-only-modes)
;;   (add-to-list 'noxrcp-read-only-modes-hooks
;;                (intern (concat (symbol-name mode) "-hook"))))

;; (dolist (mode noxrcp-toggle-quotes-modes)
;;   (add-to-list 'noxrcp-toggle-quotes-modes-hooks
;;                (intern (concat (symbol-name mode) "-hook"))))

)

;; (put 'magit-diff-edit-hunk-commit 'disabled nil)
