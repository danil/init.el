(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-context-lines 5)
 '(amx-history-length 500) ; amx.el
 '(amx-save-file (file-name-concat init-emacs-var "amx-items")) ; amx.el
 '(anzu-search-threshold 500) ; anzu.el
 '(back-button-global-backward-keystrokes nil) ; back-button.el
 '(back-button-global-forward-keystrokes nil) ; back-button.el
 '(back-button-global-keystrokes nil) ; back-button.el
 '(back-button-index-timeout nil) ; back-button.el
 '(back-button-local-backward-keystrokes nil) ; back-button.el
 '(back-button-local-forward-keystrokes nil) ; back-button.el
 '(back-button-local-keystrokes nil) ; back-button.el
 '(back-button-no-wrap t) ; back-button.el
 '(back-button-smartrep-prefix nil) ; back-button.el
 '(backup-by-copying t) '(kept-new-versions 10) '(kept-old-versions 10) ; files.el: `backup-by-copying` to getting rid of annoying backup/temporary/autosave files <http://emacswiki.org/emacs/BackupDirectory#toc2>. files.el
 '(backup-directory-alist `(("." . ,(file-name-concat init-emacs-var "backup")))) ; files.el: don't litter my fs tree, get rid of annoying backups, temporary files and autosaves (built-in backup settings <http://www.emacswiki.org/emacs/BackupDirectory#toc2>)
 '(bookmark-default-file (file-name-concat init-emacs-var "bookmarks")) ; bookmark.el
 '(c-basic-offset 2) ; cc-vars.el
 '(calendar-week-start-day 1) ; calendar.el
 '(cider-mode-line " cider")
 '(coffee-tab-width 2) ; coffee-mode.el
 '(comint-input-ring-size 500) ; comint.el
 '(company-backends ; company.el
   `(,@(unless
           (version< "24.3.51" emacs-version)
         (list 'company-elisp))
     company-bbdb ,@(unless
                        (version<= "26" emacs-version)
                      (list 'company-nxml))
     ,@(unless
           (version<= "26" emacs-version)
         (list 'company-css))
     company-semantic company-clang company-cmake company-files
     (company-dabbrev-code company-gtags company-etags company-keywords)
     company-dabbrev company-abbrev company-oddmuse company-capf))
 ;; '(company-abort-manual-when-too-short nil) ; company.el: <https://github.com/gorakhargosh/emacs.d/blob/master/config-completion.el>
 ;; '(company-clang-executable (executable-find "clang")) ; company-clang.el
 ;; '(company-global-modes t) ; company.el: <https://github.com/gorakhargosh/emacs.d/blob/master/config-completion.el>
 ;; '(company-lighter-base "company") ; company.el: <https://github.com/gorakhargosh/emacs.d/blob/master/config-completion.el>
 ;; '(company-show-numbers nil) ; company.el: <https://github.com/gorakhargosh/emacs.d/blob/master/config-completion.el>
 ;; '(company-tooltip-idle-delay nil) ; company.el: .5 <https://github.com/gorakhargosh/emacs.d/blob/master/config-completion.el>
 ;; '(company-tooltip-limit 10) ; company.el: <https://github.com/gorakhargosh/emacs.d/blob/master/config-completion.el>
 ;; '(company-tooltip-margin 1) ; company.el: <https://github.com/gorakhargosh/emacs.d/blob/master/config-completion.el>
 ;; '(company-tooltip-maximum-width most-positive-fixnum) ; company.el: <https://github.com/gorakhargosh/emacs.d/blob/master/config-completion.el>
 ;; '(company-tooltip-minimum 6) ; company.el: <https://github.com/gorakhargosh/emacs.d/blob/master/config-completion.el>
 ;; '(company-tooltip-minimum-width 0) ; company.el: <https://github.com/gorakhargosh/emacs.d/blob/master/config-completion.el>
 ;; '(company-tooltip-offset-display 'scrollbar) ; company.el: <https://github.com/gorakhargosh/emacs.d/blob/master/config-completion.el>
 '(company-dabbrev-code-everywhere t) ; company-dabbrev-code.el
 '(company-dabbrev-minimum-length 1) ; company-dabbrev.el
 '(company-frontends nil) ; company.el: nil '() <https://github.com/gorakhargosh/emacs.d/blob/master/config-completion.el>
 '(company-idle-delay nil) ; company.el: 0.7 tradeoff between typing speed and performance <https://emacs.stackexchange.com/questions/32467/how-can-i-configure-company-mode-to-only-display-candidates-after-an-explicit-ke#32523>, <https://github.com/gorakhargosh/emacs.d/blob/master/config-completion.el>
 '(company-minimum-prefix-length 0) ; company.el: <https://github.com/gorakhargosh/emacs.d/blob/master/config-completion.el>
 '(compilation-scroll-output t) ; compile.el
 '(counsel-ag-base-command ; counsel.el
   (format "%s %s %s" init-counsel-ag-base-command-name init-counsel-ag-base-command-args "%s"))
 '(counsel-yank-pop-truncate-radius 4) ; counsel.el
 ;; '(css-indent-offset 2) ; css-mode.el
 '(default-tab-width 2) ; indent.el
 '(deft-auto-save-interval 30.0) ; deft.el: Idle time in seconds before automatically saving buffers opened by Deft. Set to zero to disable.
 '(deft-directory "~/Notes") ; deft.el: <http://jblevins.org/projects/deft>
 '(deft-extensions '("md" "markdown" "org" "mw" "txt" "restclient")) ; deft.el: Any files with these extensions will be listed. The first element of the list is used as the default file extension of newly created files, if `deft-default-extension` is not set.
 '(deft-new-file-format "%Y-%m-%dT%H-%M%Z")
 '(deft-recursive t) ; deft.el: Recursively search for files in subdirectories when non-nil.
 '(deft-recursive-ignore-dir-regexp ; deft.el
    (concat "\\(?:" "\\." "\\|\\.\\." "\\|.*-src" "\\|vendor" "\\)$"))
 '(deft-strip-title-regexp ; deft.el: Regular expression to remove from file titles. Presently, it removes leading LaTeX comment delimiters, leading and trailing hash marks from Markdown ATX headings, leading astersisks from Org Mode headings, and Emacs mode lines of the form -*-mode-*-.
    (concat "\\(?:"
            "^%+" ; line beg with %
            "\\|^Title:[\t ]*" ; MultiMarkdown metadata
            "\\|^#\\+TITLE: *" ; org-mode title
            "\\|^[#* ]+" ; line beg with #, * and/or space
            "\\|-\\*-[[:alpha:]]+-\\*-" ; -*- .. -*- lines
            "\\|^-- " ; sql-mode title
            "\\|[={']+" ; MediaWiki markup == Header == or {{Infobox or '''Bold'''
            "\\|#+" ; line with just # chars
            "\\|#!/bin/.*" ; shebang
            "$\\)"))
 '(deft-use-filename-as-title t)
 '(delete-old-versions t) ; files.el
 '(desktop-base-file-name (convert-standard-filename "desktop")) ; desktop.el
 '(desktop-base-lock-name (convert-standard-filename "desktop.lock")) ; desktop.el
 '(desktop-dirname init-emacs-var t) ; desktop.el
 '(desktop-globals-to-save '()) ; desktop.el
 '(desktop-locals-to-save '(desktop-locals-to-save)) ; desktop.el: Itself! Think it over.
 '(desktop-path (list user-emacs-directory init-emacs-var)) ; desktop.el
 '(desktop-restore-frames nil) ; desktop.el
 '(diff-hl-draw-borders nil) ; diff-hl.el
 '(diff-hl-margin-symbols-alist ; diff-hl.el
   '(
     (change . " ") ;"="
     (delete . " ") ;"-"
     (ignored . " ") ;"!"
     (insert . " ") ;"+"
     (unknown . " ") ;"?"
     ))
 '(diff-hl-side 'right) ; diff-hl.el
 '(directory-free-space-args "--human-readable") ; files.el
 '(dired-details-hidden-string "") ; dired-details.el
 '(dired-details-hide-extra-lines nil) ; dired-details.el
 '(dired-details-hide-link-targets nil) ; dired-details.el
 '(dired-listing-switches "-l --all --human-readable") ; dired.el
 ;; '(diredfl-compressed-extensions '(".tar" ".taz" ".tgz" ".arj" ".lzh" ".lzma" ".xz" ".zip" ".z" ".Z" ".gz" ".bz2" ".zst")) ; diredfl.el
 '(diredfl-ignore-compressed-flag nil) ; diredfl.el
 '(dumb-jump-max-find-time 10) ; dumb-jump.el
 '(dumb-jump-selector 'ivy) ; dumb-jump.el
 ;; '(evil-overriding-maps nil) ; evil-vars.el
 ;; '(evil-search-module 'isearch) ; 'evil-search ; evil-search.el
 ;; '(evil-ex-interactive-search-highlight 'all-windows) ; evil-vars.el ; Determine in which windows the interactive highlighting should be shown.
 ;; '(evil-ex-search-case 'smart) ; evil-vars.el ; The case behaviour of the search command. Smart case means that the pattern is case sensitive if and only if it contains an upper case letter, otherwise it is case insensitive.
 ;; '(evil-ex-search-highlight-all t) ; evil-vars.el ; If t and interactive search is enabled, all matches are highlighted.
 ;; '(evil-ex-search-incremental t) ; evil-vars.el ; "If t, use incremental search. Note that this only affects the search command if `evil-search-module' is set to `evil-search'.
 ;; '(evil-ex-search-interactive t) ; evil-vars.el ; If t search is interactive.
 ;; '(evil-ex-search-persistent-highlight t) ; evil-vars.el ; If non-nil matches remain highlighted when the search ends.
 ;; '(evil-ex-search-vim-style-regexp nil) ; evil-vars.el ; If non-nil Vim-style backslash codes are supported in search patterns. See `evil-transform-vim-style-regexp' for the supported backslash codes.  Note that this only affects the search command if `evil-search-module' is set to `evil-search'.  The isearch module always uses plain Emacs regular expressions. TODO: Regex Capture Groups <https://reddit.com/r/emacs/comments/9kxeb0/regex_capture_groups_in_evil>.
 ;; '(evil-regexp-search t) ; evil-vars.el ; Whether to use regular expressions for searching in `evil-search-forward` and `evil-search-backward`.
 ;; '(evil-search-module 'isearch) ; evil-vars.el ; The search module to be used.  May be either `isearch', for Emacs' isearch module, or `evil-search', for Evil's own interactive search module.  N.b. changing this will not affect keybindings.
 ;; '(evil-search-wrap t) ; evil-vars.el ; `evil-motion-state-map`Whether search with `evil-search-forward` and `evil-search-backward` wraps around the buffer. If this is non-nil, search stops at the buffer boundaries.
 ;; '(evil-symbol-word-search nil) ; evil-vars.el ; If nil then * and # search for words otherwise for symbols.
 '(evil-disable-insert-state-bindings t) ; Useed Emacs keybindings instead of the ones that evil makes in insert state <https://github.com/noctuid/evil-guide#switching-between-evil-and-emacs>, <https://stackoverflow.com/questions/25542097/emacs-evil-mode-how-to-change-insert-state-to-emacs-state-automatically#56206909>.
 '(evil-search-wrap-ring-bell t) ; evil-vars.el ; Whether to ring the bell when search wraps around the buffer.
 '(evil-undo-system 'undo-tree) ; evil-vars.el
 '(evil-want-integration t) ; <https://github.com/emacs-evil/evil-collection/tree/master#installation> ; evil-vars.el
 '(evil-want-keybinding nil) ; <https://github.com/emacs-evil/evil-collection/tree/master#installation> ; evil-collection.el
 '(fd-dired-display-in-current-window t)
 '(find-temp-custom-spec '((?D . (lambda () (format-time-string "%Y%m%d"))))) ; find-temp-file.el
 '(find-temp-template-alist '(("go" . "tmp%D%N/%N.%E"))) ; find-temp-file.el
 '(find-temp-file-directory "~/src/tmp/") ; temporary-file-directory ; find-temp-file.el
 '(find-temp-template-default "tmp%D%N.%E") ; find-temp-file.el
 '(flycheck-indication-mode nil) ; flycheck.el
 ;; '(flycheck-check-syntax-automatically '(idle-change)) ; flycheck.el
 '(flycheck-disabled-checkers '( ; flycheck.el
                                emacs-lisp ; annoying errors
                                emacs-lisp-checkdoc ; annoying errors

                                go-gofmt
                                go-golint
                                go-vet
                                go-build
                                go-test
                                go-errcheck
                                go-unconvert
                                go-megacheck

                                json-python-json ; ruby slower than javascript
                                markdown-mdl ; ruby slower than javascript
                                proselint ; slow python/javascript

                                ruby-reek ; annoying errors and undocumented config
                                ruby-rubylint

                                sh-bash
                                sh-posix-bash

                                ;; yaml-jsyaml ; annoying errors
                                yaml-ruby ; i use a yaml-javascript linter so as not to set a ruby linter for each ruby version
                                yaml-yamllint ; i use a yaml-javascript linter
                                ))
 '(flycheck-idle-change-delay 1.5) ; flycheck.el
 '(flycheck-indication-mode nil)
 '(flycheck-markdown-markdownlint-cli-config "~/.markdownlint.json") ; flycheck.el
 '(flycheck-mode-line-prefix "F") ; flycheck.el
 '(gofmt-command "gofmt") ; "goimports" ; go-mode.el: The 'gofmt' command. Some users may replace this with 'goimports'from https://github.com/bradfitz/goimports.
 '(highlight-thing-all-visible-buffers-p t) ; highlight-thing.el
 '(highlight-thing-delay-seconds 0.5) ; highlight-thing.el
 '(highlight-thing-exclude-thing-under-point t) ; highlight-thing.el
 '(highlight-thing-large-buffer-limit 5000) ; highlight-thing.el
 '(historian-save-file (file-name-concat init-emacs-var ".historian")) ; historian.el
 '(ibuffer-formats
   '((mark modified read-only " "
           (name 64 64 :left :elide)
           " "
           (size 9 -1 :right)
           " "
           (mode 16 16 :left :elide)
           " " filename-and-process)
     (mark " "
           (name 16 -1)
           " " filename)))
 '(indent-tabs-mode nil)
 '(inf-mongo-command "/usr/bin/mongo 127.0.0.1:27017")
 ;; '(ivy-fixed-height-minibuffer nil) ; ivy.el
 ;; '(ivy-fixed-height-minibuffer t) ; ivy.el
 ;; '(ivy-height 11) ; ivy.el
 '(init-back-button-mode-bindings ; init-back-button.el
   '(("C-x C-x j j" . back-button-local-backward)
     ("C-x C-x j k" . back-button-local-forward)
     ("C-x C-x j J" . back-button-global-backward)
     ("C-x C-x j K" . back-button-global-forward)))
 '(init-c-mode-patterns '("/etc/portage/savedconfig/www-servers/quark" "/etc/portage/savedconfig/x11-misc/dmenu" "/etc/portage/savedconfig/x11-misc/slstatus" "/etc/portage/savedconfig/x11-misc/tabbed" "/etc/portage/savedconfig/x11-terms/st" "/etc/portage/savedconfig/x11-wm/dwm")) ; init-cc-mode.el
 '(init-company-completing-read-function 'init-selectrum-company) ; init-company.el
 '(init-conf-mode-patterns ; init-conf-mode.el
   '(("/Pipfile2\\'"                           conf-mode)
     ("/Pipfile3\\'"                           conf-mode)
     ("/Pipfile\\'"                            conf-mode)
     ("/\\.Xmodmap\\'"                         conf-xdefaults-mode)
     ("/\\.config/skippy-xd/skippy-xd\\.rc\\'" conf-mode)
     ("/\\.config/sxhkd/"                      conf-mode)
     ("/\\.curlrc\\'"                          conf-mode)
     ("/\\.gtkrc-2.0\\'"                       conf-mode)
     ("/\\.inputrc\\'"                         conf-mode)
     ("/\\.moc/keymap\\'"                      conf-mode)
     ("/\\.npmrc\\'"                           conf-mode)
     ("/\\.offlineimaprc\\'"                   conf-mode)
     ("/\\.rvmrc\\'"                           conf-mode)
     ("/\\.screenrc\\'"                        conf-mode)
     ("/\\.tigrc\\'"                           conf-mode)
     ("/conkyrc_calendar\\'"                   conf-mode)
     ("/conkyrc_top\\'"                        conf-mode)
     ("/csf\\.allow\\'"                        conf-mode)
     ("/dunstrc\\'"                            conf-mode)
     ("/etc/aliases\\'"                        conf-mode)
     ("/etc/fstab\\'"                          conf-mode)
     ("/etc/mail/aliases\\'"                   conf-mode)
     ("/etc/mailutils\\.d/"                    conf-mode)
     ("/etc/smtpd/aliases\\'"                  conf-mode)
     ("/etc/smtpd/secrets\\'"                  conf-colon-mode)
     ("/etc/sudoers.d/.*\\'"                   conf-mode)
     ("/etc/sudoers\\.tmp\\'"                  conf-mode)
     ("/etc/zypp/.*\\'"                        conf-mode)
     ("/fail2ban/.*\\.local\\'"                conf-mode)
     ("/hosts\\'"                              conf-mode)
     ("/htoprc\\'"                             conf-mode)
     ("/inventor\\(y\\|ies\\)/[^.]*\\'"        conf-mode)
     ("/locale\\.gen.pacnew\\'"                conf-mode)
     ("/locale\\.gen\\'"                       conf-mode)
     ("/logind\\.conf\\.pacnew\\'"             conf-mode)
     ("/mailutils\\.rc\\'"                     conf-mode)
     ("/mimeapps.list\\'"                      conf-mode)
     ("/mirrorlist\\'"                         conf-mode)
     ("/mirrorlist\\.pacnew\\'"                conf-mode)
     ("/monit.d/[^/]*\\'"                      conf-mode)
     ("/monitrc\\'"                            conf-mode)
     ("/robots\\.txt\\'"                       conf-mode)
     ("/rsyncd\\.secrets\\'"                   conf-colon-mode)
     ("/securetty\\'"                          conf-mode)
     ("/share/applications/defaults\\.list\\'" conf-mode)
     ("/shells\\'"                             conf-mode)
     ("/sshd_config\\'"                        conf-mode)
     ("/sudoers\\'"                            conf-mode)
     ("/tint2rc\\'"                            conf-mode)
     ("\\.SRCINFO\\'"                          conf-mode)
     ("\\.cnf\\'"                              conf-mode)
     ("\\.eixrc\\'"                            conf-mode)
     ("\\.features\\'"                         conf-mode) ; cucumber features
     ("\\.feed2imaprc\\'"                      conf-mode)
     ("\\.gtkrc.mine\\'"                       conf-mode)
     ("\\.ini\\.template\\'"                   conf-unix-mode)
     ("\\.pgpass\\'"                           conf-colon-mode)
     ("\\.pkla\\'"                             conf-mode)
     ("\\.skippyrc\\'"                         conf-mode)
     ("\\.stalonetrayrc\\'"                    conf-mode)
     ("\\.theme\\'"                            conf-mode)
     ("\\.xxkbrc\\'"                           conf-mode)
     ("\\parcelliterc\\'"                      conf-mode)
     ("\\torrc\\'"                             conf-mode)

     ;; Logrotate scripts
     ("/etc/logrotate\\.d/" conf-mode)
     ("\\.logrotate\\'"     conf-mode)

     ;; Exim configs
     ("/auth_conf\\.sub\\'"              conf-mode)
     ("/exim4\\.conf\\.localmacros\\'"   conf-mode)
     ("/exim\\.conf\\.dist\\'"           conf-mode)
     ("/passwd\\.client\\'"              conf-mode)
     ("/system_filter\\.exim\\'"         conf-mode)

     ;; Gentoo configs
     ("/etc/conf\\.d/"                     conf-mode)
     ("/etc/eixrc/"                        conf-mode)
     ("/etc/env\\.d/"                      conf-mode)
     ("/etc/fcron/"                        conf-mode)
     ("/etc/portage/env/"                  conf-mode)
     ("/etc/portage/package\\..*\\'"       conf-mode)
     ("/etc/portage/profile/use\\.mask\\'" conf-mode)
     ("/etc/portage/sets/"                 conf-mode)
     ("/portage/package\\.license\\'"      conf-mode)
     ("/profiles/categories\\'"            conf-mode)
     ("/profiles/package\\.mask\\'"        conf-mode)
     ("/profiles/repo_name\\'"             conf-mode)
     ("/var/lib/portage/world_sets\\'"     conf-mode)
     ("\\world\\'"                         conf-mode)
     ))
 '(init-crontab-mode-patterns '("/etc/cron.d/" "crontab\\'")) ; init-crontab-mode.el
 '(init-dart-mode-bindings 'nil) ; init-dart-mode.el
 '(init-digit-groups-mode-hooks (append init-programming-modes-hooks '(shell-mode-hook)))
 '(init-dired-details-bindings ; init-dired-details.el
   '(
     ;; ("(" . dired-details-hide)
     ;; (")" . dired-details-show)
     ;; ("C-x C-x C-x b" . init-dired-details-toggle-view) ; NOTE: Used together with the Emacs Evil because the `b` hot key already taken by the `evil-backward-word-begin` function.~~~~<danil@kutkevich.org> FIXME: Maybe use the `C-z` followed by `b` hot key sequence together with Emacs Evil instead of `C-x C-x C-x b` hot key?
     ("b" . init-dired-details-toggle-view)
     ))
 '(init-display-line-numbers-mode-hooks (append init-overview-mode-hooks '())) ; init-display-line-numbers-mode.el
 '(init-emacs-lisp-mode-patterns '("/\\.?abbrev_defs\\'" "/\\.emacs\\.d/bookmarks\\'" "/ac-comphist\\.dat\\'" "\\.el\\.\\(tpl\\|template\\)\\'")) ; init-emacs-lisp-mode.el
 '(init-evil-bindings ; init-evil.el
   '(("C-x C-x C-x C-x s" . evil-mode)
     ("C-x C-x C-x C-x S S" . evil-force-normal-state)
     ("C-x C-x C-x C-x S n" . evil-normal-state)
     ("C-x C-x C-x C-x S i" . evil-insert-state)
     ("C-x C-x C-x C-x S r" . evil-replace-state)
     ("C-x C-x C-x C-x S m" . evil-motion-state)
     ("C-x C-x C-x C-x S v" . evil-visual-state)
     ("C-x C-x C-x C-x S e" . evil-emacs-state)))
 '(init-evil-normal-bindings ; init-evil.el
   '(("=" . init-lsp-format-buffer)))
 '(init-ferm-mode-patterns '("/etc/iptables/rules.v[46]" "\\.rules\\'")) ; init-ferm-mode.el
 '(init-ferm-mode-rainbow-identifiers-stop-words '("ACCEPT" "DROP" "FORWARD" "INPUT" "OUTPUT" "REJECT")) ; init-ferm-mode.el
 ;; '(init-files-bindings
 ;;   '(
 ;;     ;; ("C-x C-x C-f s" . save-some-buffers)
 ;;     ))
 '(init-find-temp-file-mode-bindings '(("C-x C-x C-x t" . find-temp-file))) ; init-find-temp-file-mode.el
 '(init-find-temp-file-mode-extension-functions '(("go" . init-find-temp-file-go))) ; init-find-temp-file-mode.el
 '(init-fundamental-mode-patterns '()) ; init-simple.el
 '(init-go-mode-bindings ; init-go-mode.el
   '(("C-c C-f e" . init-go-mode-end-of-defun)
     ("C-x C-x ? ? f" . godoc-at-point)))
 '(init-gitconfig-mode-patterns '(("/.gitconfig\\'" gitconfig-mode) ("/.gitconfig\\.[^/]*\\'" gitconfig-mode))) ; init-gitconfig-mode.el
 '(init-graphql-mode-patterns '("\\.graphql\\'"))
 '(init-handlebars-mode-patterns '("\\.go\\.tmpl\\'"))
 '(init-help-bindings ; init-help.el
   '(("?" . nil)
     ("? ?" . help-for-help)
     ("? m" . man)
     ("? M t" . tldr)
     ("? M w" . woman)
     ("b" . counsel-descbinds)
     ("i" . describe-symbol) ; ("i" . counsel-info-lookup-symbol)
     ("F" . counsel-faces) ; ("F" . counsel-describe-face)
     ;; ("f" . counsel-describe-function)
     ("l" . find-library) ; ("l" . counsel-find-library)
     ("u" . counsel-unicode-char)
     ("v" . describe-variable) ; ("v" . counsel-describe-variable)
     ))
 '(init-leerzeichen-mode-hooks (append init-overview-mode-hooks '())) ; init-leerzeichen-mode.el
 '(init-lsp-mode-modes '(go-mode json-mode markdown-mode sh-mode zig-mode)) ; init-lsp-mode.el
 '(init-make-gmake-mode-patterns
   '("/Makefile.port\\'" "/Makefile.shlib\\'" "/etc/portage/savedconfig/x11-misc/slock")) ; init-make-mode.el
 '(init-minibuffer-bindings '(("C-r" . counsel-minibuffer-history))) ; init-minibuffer.el
 '(init-projectile-mode-hooks ; init-projectile.el
   (append init-programming-modes-hooks
           '(
             compilation-mode-hook
             dired-mode-hook
             go-test-mode-hook
             graphql-mode-hook
             ivy-occur-grep-mode-hook
             magit-diff-mode-hook
             magit-process-mode-hook
             magit-revision-mode-hook
             magit-stash-mode-hook
             magit-status-mode-hook
             protobuf-mode-hook
             shell-mode-hook
             sql-interactive-mode-hook
             zig-mode-hook
             )))
 '(init-projectile-project-root-files '("go.mod"))
 '(init-rainbow-identifiers-hooks ; init-rainbow-identifiers.el
   '((c-mode-common-hook init-c-mode-rainbow-identifiers-init)
     (clojure-mode-hook init-clojure-mode-rainbow-identifiers-init)
     (coffee-mode-hook init-coffee-mode-rainbow-identifiers-init)
     (conf-colon-mode-hook init-conf-colon-mode-rainbow-identifiers-init)
     (conf-space-mode-hook init-conf-space-mode-rainbow-identifiers-init)
     (conf-unix-mode-hook init-conf-unix-mode-rainbow-identifiers-init)
     (conf-xdefaults-mode-hook init-conf-xdefaults-mode-rainbow-identifiers-init)
     (csharp-mode-hook init-csharp-mode-rainbow-identifiers-init)
     (css-mode-hook init-css-mode-rainbow-identifiers-init)
     (dockerfile-mode-hook init-dockerfile-mode-rainbow-identifiers-init)
     (elixir-mode-hook init-elixir-mode-rainbow-identifiers-init)
     (emacs-lisp-mode-hook init-emacs-lisp-mode-rainbow-identifiers-init)
     (enh-ruby-mode-hook init-enh-ruby-mode-rainbow-identifiers-init)
     (ferm-mode-hook init-ferm-mode-rainbow-identifiers-init)
     (go-dot-mod-mode-hook init-go-dot-mod-mode-rainbow-identifiers-init)
     (go-mode-hook init-go-mode-rainbow-identifiers-init)
     (graphql-mode-hook init-graphql-mode-rainbow-identifiers-init)
     (handlebars-mode-hook init-handlebars-mode-rainbow-identifiers-init)
     (haproxy-mode-hook init-haproxy-mode-rainbow-identifiers-init)
     (hcl-mode-hook init-hcl-mode-rainbow-identifiers-init)
     (js2-parse-finished-hook init-js2-mode-rainbow-identifiers-init)
     (json-mode-hook init-json-mode-rainbow-identifiers-init)
     (lisp-mode-hook init-lisp-mode-rainbow-identifiers-init)
     (lua-mode-hook init-lua-mode-rainbow-identifiers-init)
     (nginx-mode-hook init-nginx-mode-rainbow-identifiers-init)
     (nxml-mode-hook init-nxml-mode-rainbow-identifiers-init)
     (php-mode-hook init-php-mode-rainbow-identifiers-init)
     (protobuf-mode-hook init-protobuf-mode-rainbow-identifiers-init)
     (python-mode-hook init-python-mode-rainbow-identifiers-init)
     (ruby-mode-hook init-ruby-mode-rainbow-identifiers-init)
     (rust-mode-hook init-rust-mode-rainbow-identifiers-init)
     (sh-mode-hook init-sh-mode-rainbow-identifiers-init)
     (slim-mode-hook init-slim-mode-rainbow-identifiers-init)
     (sql-interactive-mode-hook init-sql-interactive-mode-rainbow-identifiers-init)
     (sql-mode-hook init-sql-mode-rainbow-identifiers-init)
     (systemd-mode-hook init-systemd-rainbow-identifiers-init)
     (toml-mode-hook init-toml-mode-rainbow-identifiers-init)
     (typescript-mode-hook init-typescript-mode-rainbow-identifiers-init)
     (web-mode-hook init-web-mode-rainbow-identifiers-init)
     (yaml-mode-hook init-yaml-mode-rainbow-identifiers-init)
     (zig-mode-hook init-zig-mode-rainbow-identifiers-init)))
 '(init-rainbow-mode-hooks
   '(css-mode-hook i3wm-config-mode-hook less-css-mode-hook nxml-mode-hook php-mode-hook sass-mode-hook scss-mode-hook web-mode-hook xml-mode-hook)) ; init-rainbow-mode.el
 '(init-replace-bindings
   '(("M-s o" occur)
     ("M-s O O" . noccur-dired) ; Is a multi-occur on dired files a-la find/grep <https://github.com/nicolaspetton/noccur.el>.
     ("M-s O m" . multi-occur-in-matching-buffers))) ; init-replace.el
 '(init-sh-mode-patterns
   '(
     "/Procfile\\'"
     "/\\.ackrc\\'"
     "/\\.alias\\'"
     "/\\.bash_aliases\\'"
     "/\\.bc\\'"
     "/\\.bpkgrc\\'"
     "/\\.config/go/env\\'"
     "/\\.env\\(\\.development\\|\\.production\\|.local\\|.test\\)?\\(\\.example\\)?\\'"
     "/\\.lessfilter\\'"
     "/\\.mkshrc\\'"
     "/\\.xprofile\\'"
     "/dwmrc\\'"
     "/etc/profile\\'"
     "\\.bashrc\\'"

     ;; Ubuntu.
     "/apt/.+\\.list\\(\\.save\\)?\\'"

     ;; Gentoo.
     "/etc/init.d/"
     "/etc/local.d/.+\\.\\(start\\|stop\\)"

     ;; Emacs shellcheck config.
     "/\\.shellcheckrc\\'"
     ))
 '(init-shell-bindings '(("TAB". nil) ("C-x C-x C-l" . init-shell-clear))) ; init-shell.el
 '(init-simple-mode-bindings ; init-simple.el
   '(("<mouse-4>" . scroll-down-line)
     ("<mouse-5>" . scroll-up-line)
     ("<mouse-6>" . init-window-scroll-right)
     ("<mouse-7>" . init-window-scroll-left)

     ("C-c C-f e" . end-of-defun)
     ("C-c C-f n" . beginning-of-defun)

     ;; ("C-x <" . scroll-left) ; ("<right>" . scroll-left)
     ;; ("C-x >" . scroll-right) ; ("<left>" . scroll-right)
     ("C-v" . scroll-up-line) ; ("C-v" . scroll-up-command) ; ("<down>" . scroll-up-line)
     ("C-x C-f" . init-files-find-file)
     ("C-x C-d" . init-files-list)
     ("M-s h y" . highlight-symbol) ; highlight-symbol.el
     ("M-s h Y r" . highlight-symbol-query-replace) ; highlight-symbol.el
     ;; ("M-s o" occur)
     ;; ("M-s O O" . noccur-dired)
     ;; ("M-s O m" . multi-occur-in-matching-buffers)
     ("M-v" . scroll-down-line) ; ("M-v" . scroll-down-command) ; ("<up>" . scroll-down-line)
     ("M-|" . init-subr-shell-command-with-region-arg) ; init-subr.el

     ;; ("C-x C-f" . init-counsel-find-file)
     ;; ("C-x C-r" . counsel-buffer-or-recentf)
     ;; ("C-c g" . counsel-git)
     ;; ("C-x b" . ivy-switch-buffer)
     ("C-x 1" . init-window-delete-other-windows)
     ("C-x 4 0" . init-window-maybe-delete-window-maybe-kill-buffer) ; `(kill-buffer-and-window)`.
     ("C-x k" . init-window-maybe-delete-window-maybe-kill-buffer-open-dired)

     ("C-x C-x ." . repeat) ; init--repeat
     ("C-x C-x ! b" . init--quickrun)
     ("C-x C-x ! r" . init--quickrun-region)
     ("C-x C-x ?" . help-command) ; <http://gnu.org/software/emacs/manual/html_node/elisp/Help-Functions.html>.
     ("C-x C-x b" . init-window-bury-buffer-maybe-delete-window)
     ("C-x C-x B h" . init-highlight-regexp) ; FIXME: Maybe unused key binding?~~~~<danil@kutkevich.org>
     ("C-x C-x B r" . rename-buffer)
     ("C-x C-x f"   . noxrcp-isearch--forward-literal)
     ("C-x C-x F F" . noxrcp-isearch--backward-literal)
     ("C-x C-x F a" . init-counsel-ag)
     ("C-x C-x F g" . counsel-git-grep)
     ("C-x C-x F p" . counsel-pt)
     ("C-x C-x F r" . init-counsel-rg)
     ;; ("C-x C-x F R R" . init-counsel-rg-no-ignore)
     ("C-x C-x g" . revert-buffer)

     ("C-x C-x C-j" . electric-newline-and-maybe-indent)
     ("C-x C-x C-o" . open-line)
     ("C-x C-x i t" . init-subr-insert-timestamp-datetime)
     ("C-x C-x i T u" . init-subr-insert-timestamp-unix)
     ("C-x C-x i T d" . init-subr-insert-timestamp-date)
     ("C-x C-x L L" . init-hl-line-on)
     ("C-x C-x L t" . toggle-truncate-lines)
     ("C-x C-x m" . less-scroll-stub)
     ("C-x C-x M M" . xterm-mouse-mode)
     ("C-x C-x r f" . fill-region)
     ("C-x C-x s"   . init-overview-mode-toggle)
     ("C-x C-x t" . shell)

     ("C-x C-x C-x s"   . sort-lines)
     ("C-x C-x C-x S f" . sort-fields)
     ("C-x C-x C-x S c" . init-sort-chars)
     ("C-x C-x C-x S s" . init-sort-symbols)
     ("C-x C-x C-x S w" . init-sort-words)
     ("C-x C-x C-x n" . init-deft-init)
     ("C-x C-x C-x T" . init-transpose-frame)
     ("C-x C-x C-x u" . init-unique-lines-region)
     ("C-x C-x C-x U b" . init-unique-lines-buffer)

     ("C-x C-x C-x C-x d s" . desktop-save-in-desktop-dir)
     ("C-x C-x C-x C-x d l" . desktop-read)
     ("C-x C-x C-x C-x k" . init-kill-emacs)
     ("C-x C-x C-x C-x u" . browse-url-at-point)

     ("M-t" . transpose-chars)
     ;; ("M-x" . counsel-M-x)
     ("M-y" . init-simple-yank-pop)))
 '(init-simple-yank-pop-function 'init-selectrum-yank-pop) ; init-simple.el
 '(init-wdired-bindings ; init-wdired.el
   '(("C-x C-x" . nil)
     ("C-x C-x C-x C-x w" . wdired-change-to-wdired-mode)))
 '(init-text-mode-patterns '("\\.bash_history\\'" "\\.txt#\\'")) ; init-text-mode.el
 '(ivy-count-format "(%d/%d) ") ; ivy.el
 '(ivy-truncate-lines nil) ; ivy.el: it is fixed by <<https://github.com/abo-abo/swiper/issues/1307>
 '(ivy-use-virtual-buffers nil) ; ivy.el: virtual buffers slow down switching between buffers
 '(js2-mode-show-strict-warnings nil)
 '(json-encoding-default-indentation "    " t)
 '(kill-ring-max 500)
 '(logview-cache-filename (file-name-concat init-emacs-var "logview-cache.extmap"))
 '(logview-views-file (file-name-concat init-emacs-var "logview.views"))
 '(lsp-headerline-breadcrumb-enable nil) ; lsp-mode.el
 '(magit-auto-revert-mode nil)
 '(magit-blame-heading-format "%-20a %C %s %H")
 '(magit-completing-read-function 'selectrum-completing-read)
 '(magit-save-repository-buffers nil)
 '(markdown-command "blackfriday-tool")
 '(markdown-toc-header-toc-title "")
 '(markdown-toc-list-item-marker "*")
 '(mediawiki-site-alist
   '(("en" "http://en.wikipedia.org/w/" "danilkutkevich" "" "Main Page")
     ("ru" "http://ru.wikipedia.org/w/" "danilkutkevich" "" "Main Page")))
 '(mediawiki-site-default "en")
 '(menu-bar-mode nil)
 '(mode-line-format '("%e" ; mode-line.el
                      (:eval (window-numbering-get-number-string))
                      mode-line-position
                      ":"
                      mode-line-front-space ; line number and column number
                      mode-line-client
                      mode-line-modified
                      mode-line-frame-identification
                      mode-line-buffer-identification
                      " "
                      mode-line-modes
                      mode-line-remote
                      mode-line-mule-info
                      (vc-mode vc-mode)
                      mode-line-misc-info
                      mode-line-end-spaces))
 '(mode-require-final-newline nil) ; files.el: otherwise warning: you have `mode-require-final-newline' turned on. ethan-wspace supersedes `require-final-newline', so `mode-require-final-newline' will be turned off
 '(multi-compile-alist
   '(("/Cask\\'"
      ("cask outdated" . "cd %dir && cask --verbose outdated")
      ("cask install" . "cd %dir && cask --verbose install")
      ("cask update" . "cd %dir && cask --verbose update"))
     (go-mode
      ("go build" . "go build -v -x ./")
      ("go clean" . "go clean ./...")
      ("go get" . "go get -v ./...")
      ("go run" . "go run -v %file-name")
      ("go test" . "go clean ./... && go vet ./... && errcheck -verbose -asserts ./... && unconvert -v . && golint -set_exit_status ./... && gocyclo -over 25 ./ && ineffassign ./ && misspell -error ./* ./*/* ./*/*/* ./*/*/*/* ./*/*/*/*/* ./*/*/*/*/*/* ./*/*/*/*/*/*/* && go test -v -bench=./... ./..."))
     (makefile-mode
      ("make" . "make")
      ("make --jobs=9" . "make --jobs=5")
      ("make install" . "make install")
      ("make clean" . "make clean"))
     (makefile-gmake-mode
      ("make" . "make")
      ("make --jobs=9" . "make --jobs=5")
      ("make install" . "make install")
      ("make clean" . "make clean"))
     (ruby-mode
      ("rspec" . "bundle exec rspec")
      ("rake db:migrate" . "bundle exec rake db:migrate")
      ("rake db:migrate RAILS_ENV=test" . "bundle exec rake db:migrate RAILS_ENV=test")
      ("rake db:rollback" . "bundle exec rake db:rollback")
      ("rake db:rollback RAILS_ENV=test" . "bundle exec rake db:rollback RAILS_ENV=test")
      ("bundle install" . "bundle install")
      ("bundle outdated" . "bundle outdated")
      ("bundle update" . "bundle update"))
     (rust-mode
      ("rustc" . "rustc %path"))))
 '(multi-compile-completion-system 'default)
 '(multi-compile-history-file (expand-file-name "multi-compile.cache" init-emacs-var))
 '(noxrcp-auto-completion-modes
   (append init-programming-modes
           '(redis-cli-mode shell-mode telnet-mode wdired-mode)))
 '(noxrcp-gitignore-mode-patterns
   '("/\\.agignore\\'" "/\\.dockerignore\\'" "/\\.gitignore_global\\'" "/\\.megaignore\\'" "/\\.stglobalignore\\'" "/\\.stignore\\'" "/\\.stignore_global\\'" "/\\.stignoreglobal\\'"))
 '(noxrcp-haproxy-mode-patterns
   '("/haproxy.*\\.\\(erb\\|cfg\\)'" "haproxy/.*\\(erb\\|cfg\\)\\'"))
 '(noxrcp-highlight-static-regexps-hooks
   '((go-mode-hook init-go-mode-highlight-static-regexps-init)))
 '(noxrcp-js2-mode-patterns '("\\.htc\\'" "\\.js\\'"))
 '(noxrcp-json-mode-patterns
   '("/composer\\.lock\\'" "\\.bowerrc\\'" "\\.json\\.example\\'" "\\.json\\.template\\'"))
 '(noxrcp-lisp-mode-patterns
   '("/\\.stumpwmrc\\'" "/\\.sbclrc\\'" "\\.ros\\'" "\\.sexp\\'")) ; init-lisp-mode.el
 '(noxrcp-logview-mode-patterns
   '("/access_log\\(?:\\.[0-9]+\\)?\\'" "/error_log\\(?:\\.[0-9]+\\)?\\'" "/var/log/boot\\'" "/var/log/cups/access_log\\(?:\\.[0-9]+\\)?\\'" "/var/log/dmesg\\(?:\\.[0-9]+\\)?\\'" "/var/log/messages\\'" "/var/log/mysql/mysql.err\\'" "/var/log/mysql/mysqld.err\\'" "/var/log/syslog\\(?:\\.[0-9]+\\)?\\'" "\\.access_log\\(?:\\.[0-9]+\\)?\\'" "\\.error_log\\(?:\\.[0-9]+\\)?\\'" "\\.log\\(?:\\.[0-9]+\\)?\\'" "/mainlog\\'" "/rejectlog\\'"))
 '(noxrcp-lua-mode-patterns '("\\.lua\\.example\\'" "\\.ws\\'"))
 '(noxrcp-markdown-mode-patterns
   '("/Dropbox/deft/.*\\.txt\\'" "/README\\'" "/mutt[-a-zA-Z0-9]+\\'" "\\.markdown\\'" "\\.md\\'" "\\.mdown\\'"))
 '(noxrcp-nginx-mode-patterns '("/etc/nginx/.*\\.conf\\'" "/etc/nginx/sites-available/"))
 '(noxrcp-nxml-mode-patterns '("/\\.drirc\\'"))
 '(noxrcp-rspec-mode-patterns '("_spec\\.rb\\'" "/spec[0-9]*\\.rb\\'"))
 '(noxrcp-ruby-mode--rainbow-identifiers-stop-words
   '("_" "with_indifferent_access" "Integer" "it_behaves_like" "inspect" ":count" ":date" ":errors" ":float" ":json" ":jsonb" ":push" ":uuid" "Array" "assign_attributes" "ascii_only?" "all?" "as_json" "allow_any_instance_of" "ApplicationController" "ArgumentError" "ActiveSupport" "ActiveRecord" "ActiveModel" "after" "any?" "after_create" "after_commit" "after_create_commit" "after_save" "after_update" "alias_attribute" "all" "and" "as:" "Base64" "backtrace" "Base" "base" "boolean" "bigint" "before_action" "between?" "before_save" "before_update" "belongs_to" "blank?" "build" "changed?" "Class" "crated_at" "clear_active_connections!" "call" "class" "clone" "compact!" "compact" "concat" "count" "create!" "create" "Date" "created_at" "datetime" "decimal" "decode64" "default" "default:" "default_scope" "default_scoped" "delegate" "delegate_missing_to" "delete" "delete_at" "delete_if" "destroy!" "destroy" "downcase" "drop" "dup" "Errno" "ENOENT" "extname" "encode64" "Enumerable" "Encoding" "Exception" "except" "each_with_index" "end_with?" "exists?" "each" "each_with_object" "empty?" "enum" "equal_to" "Errors" "errors" "errors:" "even" "extract_options!" "File" "fail" "FalseClass" "Float" "find" "find_each" "find_in_batches" "flatten!" "flatten" "false" "find_by" "find_or_create_by!" "find_or_create_by" "first" "float" "freeze" "full_messages" "gsub" "greater_than" "greater_than_or_equal_to" "hex" "Hash" "has_many" "has_one" "instance_variable_get" "instance_variable_set" "if:" "include?" "included" "index" "initial" "initialize" "integer" "is_a?" "json" "jsonb" "join" "joins" "keys" "LockWaitTimeout" "lock" "ljust" "last" "length" "less_than" "less_than_or_equal_to" "limit" "limit:" "method_missing" "methods" "module_parent" "messages" "map" "match" "match?" "merge" "merge!" "mock_model" "module_function" "none?" "NilClass" "Numeric" "none" "negative?" "new" "nil" "nil?" "not" "null" "null:" "numericality" "OrderedHash" "OpenStruct" "order" "odd" "other_than" "parse" "params:" "performed?" "positive?" "polymorphic" "polymorphic:" "pop" "pluck" "presence" "presence:" "present?" "push" "push:" "persisted?" "JSON" "read" "raise" "reject" "reload" "rescue_from" "rjust" "render" "respond_to?" "sample" "strip" "strict_encode64" "strict_decode64" "stringify_keys" "superclass" "start_with?" "symbolize_keys" "Symbol" "Struct" "send" "set_backtrace" "skip_before_action" "SecureRandom" "string" "String" "select!" "select" "save!" "save" "scope" "scoped" "second" "self" "size" "slice" "split" "status" "shift" "status:" "stub" "sum" "Thread" "TimeWithZone" "to_date" "to_time" "TrueClass" "Time" "transform_values" "text" "tap" "table_name" "third" "to_sym" "to_sym!" "to_a" "to_proc" "to_h" "to_hash" "to_i" "to_json" "to_s" "transform_keys" "true" "try" "UTF_8" "update_at" "uuid" "uniq!" "uniq" "unique" "unique:" "uniqueness" "upcase" "update!" "update" "update_attribute" "update_attribute!" "update_all" "update_column" "update_columns" "updated_at" "values" "valid" "valid?" "validate" "validates" "where" "with_options" "zero?"))
 '(noxrcp-ruby-mode-patterns
   '("/Capfile\\'" "/Gemfile\\'" "/Guardfile\\.private.example\\'" "/Guardfile\\.private\\'" "/Guardfile\\'" "/[rR]akefile\\'" "/[vV]agrantfile.proxy\\'" "/[vV]agrantfile\\'" "\\.atex\\'" "\\.gemspec\\'" "\\.irbrc\\'" "\\.mdlrc\\'" "\\.prawn\\'" "\\.rake\\'" "\\.rb\\.erb\\'" "\\.thor\\'" "\\.yml\\.erb\\'"))
 '(noxrcp-sql-mode-patterns '(
                              "/Dropbox/deft/sql/.*\\.sql\\.md\\'"
                              "/\\.?psqlrc\\'"
                              "\\.sql\\.tmpl\\'"
                              ))
 '(noxrcp-systemd--rainbow-identifiers-stop-words 'nil)
 '(noxrcp-systemd-patterns 'nil)
 '(noxrcp-toggle-quotes-modes
   '(awk-mode cask-mode coffee-mode conf-mode conf-space-mode conf-xdefaults-mode csharp-mode css-mode emacs-lisp-mode enh-ruby-mode haml-mode haskell-mode html-mode java-mode js-mode js2-mode lisp-mode lua-mode makefile-gmake-mode markdown-mode nxml-mode org-mode perl-mode php-mode rhtml-mode ruby-mode sass-mode scss-mode sgml-mode sh-mode shell-mode slim-mode sql-mode xml-mode yaml-mode))
 '(noxrcp-web-mode-patterns
   '("/src/vendor/narus/narus-web/.+\\.jsx?\\'" "\\.\\(html\\|text\\)\\.erb\\'" "\\.as[cp]x\\'" "\\.djhtml\\'" "\\.ejs\\'" "\\.html\\'" "\\.js.erb\\'" "\\.jsp\\'" "\\.jst\\.ejs\\'" "\\.jsx\\'" "\\.phtml\\'" "\\.rhtml\\'" "\\.tpl\\.php\\'"))
 '(noxrcp-yaml-mode-patterns
   '(
     "/\\(group\\|host\\)_vars/[^.]*\\'"
     "/\\.kube/[^/.]*\\'"
     "\\.ya?ml\\(.ci\\)?\\(\\.example\\|\\.sample\\|.ci\\)?\\'"
     "\\.yml\\.j2\\'"
     ))
 '(pack-dired-default-extension ".tar.xz") ; pack.el
 '(pack-program-alist ; pack.el
   '(("\\.7z\\'" :pack "7z a" :unpack "7z x")
     ("\\.tar\\'" :pack "tar -cf" :unpack "tar -xf")
     ("\\.tar\\.gz\\'" :pack "tar -czf" :unpack "tar -xf")
     ("\\.tar\\.xz\\'" :pack "tar -cJf" :unpack "tar -xJf")
     ("\\.tgz\\'" :pack "tar -czf" :unpack "tar -xf")
     ("\\.zip\\'" :pack "zip -r" :unpack "unzip")))
 '(package-selected-packages
   '(
     ac-html
     amx
     ansi
     anzu
     apache-mode
     back-button
     bash-completion
     browse-kill-ring
     cask
     cask-mode
     clojure-mode
     column-marker
     commander
     company-erlang
     company-go
     company-inf-ruby
     company-lua
     company-php
     company-shell
     company-web
     corral
     counsel-fd
     counsel-jq
     counsel-world-clock
     crm-custom
     crontab-mode
     csharp-mode
     css-comb
     csv-mode
     ctrlf
     cycle-quotes
     dart-mode
     dash
     deft
     diff-hl
     diffview
     digit-groups
     dired-details
     diredfl
     direx
     dockerfile-mode
     dumb-jump
     ebuild-mode
     elisp-slime-nav
     elixir-mode
     elpa-mirror
     enh-ruby-mode
     epl
     etags-select
     expand-region
     f
     fd-dired
     ferm-mode
     find-temp-file
     findr
     fish-mode
     flatbuffers-mode
     flycheck-golangci-lint
     git
     git-timemachine
     gitconfig-mode
     gitignore-mode
     go-expr-completion
     go-snippets
     go-stacktracer
     godoctor
     gotest
     graphql-mode
     handlebars-mode
     highlight-symbol
     highlight-thing
     hl-todo
     i3wm-config-mode
     ibuffer-vc
     inf-mongo
     ivy-dired-history
     ivy-historian
     ivy-hydra
     jade-mode
     js2-mode
     jsfmt
     json-mode
     leerzeichen
     list-unicode-display
     literate-coffee-mode
     logview
     lsp-ivy
     lsp-mode
     magit
     magit-popup
     markdown-mode
     markdown-toc
     markdownfmt
     mediawiki
     minitest
     multi-compile
     mustache-mode
     narrow-indirect
     nginx-mode
     noccur
     nodejs-repl
     noflet
     org-ac
     origami
     pacfiles-mode
     pack
     package-build
     pinentry
     pkgbuild-mode
     projectile-rails
     protobuf-mode
     quelpa
     quickrun
     rainbow-delimiters
     rainbow-identifiers
     rainbow-mode
     rbtagger
     recentf-ext
     redis
     restclient
     robe
     rspec-mode
     ruby-guard
     ruby-hash-syntax
     ruby-pry
     ruby-refactor
     ruby-tools
     rust-mode
     s
     sass-mode
     scss-mode
     sed-mode
     selectrum
     selectrum-prescient
     shut-up
     simp
     slim-mode
     smart-mode-line
     speed-type
     string-inflection
     su
     systemd
     tldr
     toml-mode
     top-mode
     tramp
     transpose-frame
     twittering-mode
     typescript-mode
     undo-tree
     unicode-troll-stopper
     vimrc-mode
     visual-regexp
     vlf
     web-mode
     wgrep-ag
     wgrep-pt
     window-numbering
     yaml-mode
     yasnippet-snippets
     yasnippets
     zig-mode
     ztree
     ))
 '(password-cache-expiry 3600)
 '(prescient-save-file (file-name-concat init-emacs-var "prescient-save.el")) ; prescient.el
 '(projectile-completion-system 'init-selectrum-unsorted-read) ; projectile.el:'default = selectrum <https://github.com/raxod502/selectrum/wiki/Additional-Configuration#working-with-projects-in-projectile> ;'ivy ;'ido
 '(projectile-dynamic-mode-line nil) ; projectile.el
 '(projectile-indexing-method 'alien) ; projectile.el: 'native ; 'alien ; 'hybrid ; error: Setting current directory: No such file or directory, some/path: No url found for submodule path 'some-module-name' in .gitmodules <https://github.com/syl20bnr/spacemacs/issues/11507>
 '(projectile-mode-line nil) ; projectile.el
 ;; '(quickrun-timeout-seconds 10)
 '(quickrun-focus-p nil)
 '(recentf-auto-cleanup 'never)
 '(recentf-max-menu-items 500) ; init-recentf.el
 '(recentf-max-saved-items nil)
 '(recentf-save-file (file-name-concat init-emacs-var "recentf"))
 '(rm-text-properties '(("\\` OVERWRITING\\'" 'face 'font-lock-warning-face))) ; rich-minority.el
 '(rm-whitelist " F\\| OVERWRITING\\| 👁") ; rich-minority.el
 '(rspec-use-spring-when-possible nil)
 '(ruby-encoding-magic-comment-style 'ruby)
 '(ruby-insert-encoding-magic-comment nil)
 '(safe-local-variable-values '((encoding . utf-8)))
 '(save-place-file (file-name-concat init-emacs-var "places"))
 '(save-place-limit 500)
 '(savehist-additional-variables
   '(compile-command compile-history dired-regexp-history dired-shell-command-history file-name-history kill-ring minibuffer-history query-replace-history regexp-history regexp-search-ring search-ring shell-command-history))
 '(savehist-file (file-name-concat init-emacs-var "history"))
 '(scroll-bar-width 7 t)
 '(selectrum-count-style 'current/matches) ; selectrum.el
 '(show-paren-mode t)
 '(sml/col-number-format "%c") ; smart-mode-line.el
 '(sml/directory-truncation-string "<") ; smart-mode-line.el
 '(sml/line-number-format "%l") ; smart-mode-line.el
 '(sml/mode-width 'full) ; smart-mode-line.el
 '(sml/modified-char (char-to-string (if (char-displayable-p ?╳) ?╳ ?*))) ; ×╳❌❎
 '(sml/name-width '(0 . 44)) ; smart-mode-line.el
 '(sml/no-confirm-load-theme t) ; smart-mode-line.el
 '(sml/projectile-replacement-format "%s>") ; smart-mode-line.el
 '(sml/replacer-regexp-list '(("^/sudo:.*:" ":SU:"))) ; smart-mode-line.el
 '(sml/shorten-directory t) ; smart-mode-line.el
 '(sml/theme 'automatic) ; smart-mode-line.el
 '(sql-postgres-login-params
   '((user :default "danil")
     (database :default "danil")
     (port :default 5432)
     server))
 '(standard-indent 2)
 '(tab-stop-list (number-sequence 2 200 2))
 '(tab-width 2)
 '(tldr-directory-path (expand-file-name "tldr/" init-emacs-var))
 '(tldr-use-word-at-point t)
 ;; '(tramp-persistency-file-name (file-name-concat init-emacs-var "tramp")) ; FAIL: Call of the `custom-set-variables` function for a `tramp-persistency-file-name` variable ignored by the `tramp-cache` (instead use `setq` for `tramp-persistency-file-name`).
 '(transient-history-file (file-name-concat init-emacs-var "transient/history.el"))
 '(undo-tree-enable-undo-in-region nil) ; https://emacs.stackexchange.com/questions/69779/emacs-get-frozen-due-to-error-reading-undo-tree-history#69790
 '(undo-tree-history-directory-alist `(("." . ,(file-name-concat init-emacs-var "undo-tree"))))
 '(uniquify-min-dir-content 20)
 '(version-control t) ; files.el: use versioned backups
 '(window-min-height 1) '(window-min-width 1) '(split-height-threshold nil) '(split-width-threshold 64) ; Split vertical by default <http://stackoverflow.com/questions/20167246/emacs-open-buffer-in-vertical-split-by-default#20514750>. ; window.el
 '(winner-dont-bind-my-keys t)
)

;;; Colors available to Emacs <http://raebear.net/comp/emacscolors.html>.
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

 ;; Color theme (like bash, alacritty and so on)
 ;; <https://github.com/doomemacs/themes/issues/674#issuecomment-939413854>,
 ;; <https://github.com/doomemacs/themes/issues/674#issuecomment-1028388882>.
 `(ansi-color-black ((t (:foreground "#000000"))))
 `(ansi-color-red ((t (:foreground "#cd0000"))))
 `(ansi-color-green ((t (:foreground "#00cd00"))))
 `(ansi-color-yellow ((t (:foreground "#cdcd00"))))
 `(ansi-color-blue ((t (:foreground "#3f69ee"))))
 `(ansi-color-magenta ((t (:foreground "#cd00cd"))))
 `(ansi-color-cyan ((t (:foreground "#00cdcd"))))
 `(ansi-color-gray ((t (:foreground "#e5e5e5"))))
 `(ansi-color-bright-black ((t (:foreground "#7f7f7f"))))
 `(ansi-color-bright-red ((t (:foreground "#ff0000"))))
 `(ansi-color-bright-green ((t (:foreground "#00ff00"))))
 `(ansi-color-bright-yellow ((t (:foreground "#ffff00"))))
 `(ansi-color-bright-blue ((t (:foreground "#5c5cff"))))
 `(ansi-color-bright-magenta ((t (:foreground "#ff00ff"))))
 `(ansi-color-bright-cyan ((t (:foreground "#00ffff"))))

 '(anzu-mode-line ((((class color) (min-colors 88) (background dark)) (:background "black" :foreground "magenta" :weight bold)))) ; anzu.el
 '(anzu-mode-line-no-match ((((class color) (min-colors 88) (background dark)) (:inherit init-alert)))) ; anzu.el
 '(column-marker-1 ((((class color) (min-colors 88) (background light)) :background "gray80") ; column-marker.el
                    (((class color) (min-colors 88) (background dark)) :background "gray35")))
 '(ctrlf-highlight-active ((t :background "brightwhite" :foreground "brightred"))) ; ctrlf.el
 '(diff-added ((((class color) (min-colors 88) (background dark)) :foreground "brightgreen"))) ; diff-mode.el
 '(diff-changed ((((class color) (min-colors 88) (background dark)) :foreground "brightblue"))) ; diff-mode.el
 '(diff-refine-added ((((class color) (min-colors 88) (background dark)) :foreground "brightgreen" :background "grey45"))) ; diff-mode.el
 '(diff-refine-removed ((((class color) (min-colors 88) (background dark)) :foreground "brightred" :background "grey45"))) ; diff-mode.el
 '(diff-removed ((((class color) (min-colors 88) (background dark)) :foreground "brightred"))) ; diff-mode.el
 '(diredfl-compressed-file-name ((((class color) (min-colors 88) (background dark)) (:foreground "#3f69ee"))))
 '(diredfl-compressed-file-suffix ((((class color) (min-colors 88) (background dark)) (:foreground "#3f69ee"))))
 '(ediff-current-diff-A ((((class color) (min-colors 88) (background dark)) (:background "#5f0000")))) ; ediff-init.el: ,(vector 95  0  0) DarkRed
 '(ediff-current-diff-B ((((class color) (min-colors 88) (background dark)) (:background "#005f00")))) ; ediff-init.el: ,(vector 0  95  0) DarkGreen
 '(ediff-current-diff-C ((((class color) (min-colors 88) (background dark)) (:background "DarkOrange4")))) ; ediff-init.el
 '(ediff-even-diff-A ((((class color) (min-colors 88) (background dark)) (:background "#303030")))) ; ediff-init.el ,(vector 48 48 48)
 '(ediff-even-diff-A-line ((((class color) (min-colors 88) (background dark)) (:background "#303030")))) ; ediff-init.el ,(vector 48 48 48)
 '(ediff-even-diff-Ancestor ((((class color) (min-colors 88) (background dark)) (:background "#262626")))) ; ediff-init.el ,(vector 38 38 38)
 '(ediff-even-diff-B ((((class color) (min-colors 88) (background dark)) (:background "#3a3a3a")))) ; ediff-init.el ,(vector 58 58 58)
 '(ediff-even-diff-C ((((class color) (min-colors 88) (background dark)) (:background "#444444")))) ; ediff-init.el ,(vector 68 68 68)
 '(ediff-odd-diff-A ((((class color) (min-colors 88) (background dark)) (:background "#585858")))) ; ediff-init.el ,(vector 88 88 88)
 '(ediff-odd-diff-Ancestor ((((class color) (min-colors 88) (background dark)) (:background "#4e4e4e")))) ; ediff-init.el ,(vector 78 78 78)
 '(ediff-odd-diff-B ((((class color) (min-colors 88) (background dark)) (:background "#626262")))) ; ediff-init.el ,(vector 98 98 98)
 '(ediff-odd-diff-C ((((class color) (min-colors 88) (background dark)) (:background "#6c6c6c")))) ; ediff-init.el ,(vector 108 108 108)
 '(highlight-thing ((t (:inherit highlight)))) ; hi-yellow ; highlight-thing.el
 '(init-alert ((((background light)) :foreground "green" :background "red" :weight bold) (((background dark)) :foreground "green" :background "red" :weight bold))) ; init-faces.el
 '(init-truncation-glyph-face ((t (:background "orchid3")))) ; init-disp-table-line-wrap-and-truncation.el: orchid3 coral3 red
 '(init-wrap-glyph-face ((t (:background "limegreen")))) ; ; init-disp-table-line-wrap-and-truncation.el: green4 ; green3 ; light green
 '(ivy-current-match ((t :inverse-video t))) ; ivy.el: :inherit highlight
 '(ivy-minibuffer-match-face-1 ((((class color) (min-colors 88) (background light)) :background "#d3d3d3") (((class color) (min-colors 88) (background dark)) :background "gray10"))) ; ivy.el
 '(ivy-minibuffer-match-face-2 ((t :background "red"))) ; ivy.el
 '(ivy-minibuffer-match-face-3 ((t :background "blue"))) ; ivy.el
 '(ivy-minibuffer-match-face-4 ((t :background "green4"))) ; ivy.el
 '(leerzeichen ((((class color) (min-colors 88) (background dark)) (:foreground "gray25")))) ; gray15 gray20 gray25 gray30 ; leerzeichen.el ; '(ethan-wspace-face ((((class color) (min-colors 88) (background dark)) (:background "gray15")))) ; ethan-wspace.el ; `leerzeichen-mode` is a minor mode to display whitespace characters <https://github.com/fgeller/leerzeichen.el>.
 ;; '(line-number ((((class color) (min-colors 88) (background light)) :foreground "black" :background "gray90") (((class color) (min-colors 88) (background dark)) :foreground "DarkGray" :background "gray25")))
 '(mode-line ((((class color) (min-colors 88) (background dark)) (:background "black")))) ; mode-line.el: :background MidnightBlue black color-52 OrangeRed4 black gray10 purple4 NavyBlue firebrick4 brown4 red4 computers/emacs-colors>
 '(mode-line-inactive ((((class color) (min-colors 88) (background dark)) :inherit shadow :foreground "grey70" :background "gray30"))) ; mode-line.el:  ; :background "MidnightBlue" <http://raebear.net/computers/emacs-colors>
 '(rainbow-delimiters-depth-1-face ((((class color) (min-colors 88) (background dark)) :foreground "dark orange"))) ; rainbow-delimiters.el
 '(rainbow-delimiters-depth-2-face ((((class color) (min-colors 88) (background dark)) :foreground "deep pink"))) ; rainbow-delimiters.el
 '(rainbow-delimiters-depth-3-face ((((class color) (min-colors 88) (background dark)) :foreground "chartreuse"))) ; rainbow-delimiters.el
 '(rainbow-delimiters-depth-4-face ((((class color) (min-colors 88) (background dark)) :foreground "deep sky blue"))) ; rainbow-delimiters.el
 '(rainbow-delimiters-depth-5-face ((((class color) (min-colors 88) (background dark)) :foreground "yellow"))) ; rainbow-delimiters.el
 '(rainbow-delimiters-depth-6-face ((((class color) (min-colors 88) (background dark)) :foreground "orchid"))) ; rainbow-delimiters.el
 '(rainbow-delimiters-depth-7-face ((((class color) (min-colors 88) (background dark)) :foreground "spring green"))) ; rainbow-delimiters.el
 '(rainbow-delimiters-depth-8-face ((((class color) (min-colors 88) (background dark)) :foreground "sienna1"))) ; rainbow-delimiters.el
 '(scroll-bar ((((class color) (min-colors 88) (background dark)) (:background "white" :foreground "gray"))))
 '(selectrum-current-candidate ((t :inverse-video t))) ; selectrum.el
 '(selectrum-prescient-primary-highlight ((t :background "red"))) ; selectrum.el
 '(selectrum-prescient-secondary-highlight ((t :background "blue"))) ; selectrum.el
 '(selectrum-primary-highlight ((t :background "red")) t)
 '(selectrum-secondary-highlight ((t :background "blue")) t)
 '(sml/modified ((t :inherit sml/not-modified :foreground "#ff5970" :weight bold))) ; :inherit sml/not-modified :foreground "Red" :weight bold :inverse-video t ; :inherit font-lock-warning-face ; smart-mode-line.el
 '(sml/git ((t :inherit (sml/not-modified sml/prefix)))) ; smart-mode-line.el
 '(sml/global ((t (:foreground "gray60" :inverse-video nil)))) ; smart-mode-line.el
 '(sml/line-number ((t (:foreground "brightwhite" :weight normal)))) ; smart-mode-line.el
 '(sml/position-percentage ((t (:inherit sml/read-only :background "brightwhite" :inverse-video t)))) ; smart-mode-line.el
 '(sml/projectile ((t (:weight normal :inherit sml/filename)))) ; smart-mode-line.el
 '(sp-pair-overlay-face ((t nil)))
 ;; '(swiper-include-line-number-in-search nil) ; swiper.el
 ;; '(swiper-goto-start-of-match nil) ; swiper.el
 '(window-numbering-face ((((class color) (min-colors 88) (background dark)) (:inherit mode-line-inactive :foreground "OliveDrab" :background "brightwhite" :inverse-video t))) t) ; :foreground "PaleGreen" ; window-numbering.el: <http://blog.binchen.org/?p=512#sec-1>.
 )
