(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-context-lines 5)
 '(amx-history-length 1000) ;; amx.el
 '(amx-save-file "~/.emacs.var/amx-items") ;; amx.el
 '(anzu-search-threshold 7000) ;; anzu.el
 '(backup-by-copying t) ;; files.el: don't clobber symlinks, get rid of annoying backups, temporary files and autosaves (built-in backup settings <http://www.emacswiki.org/emacs/BackupDirectory#toc2>)
 '(backup-directory-alist '(("." . "~/.emacs.var/backups"))) ;; files.el: don't litter my fs tree, get rid of annoying backups, temporary files and autosaves (built-in backup settings <http://www.emacswiki.org/emacs/BackupDirectory#toc2>)
 '(bookmark-default-file "~/.emacs.var/bookmarks") ;; bookmark.el
 '(c-basic-offset 2) ;; cc-vars.el
 '(calendar-week-start-day 1) ;; calendar.el
 '(cider-mode-line " cider")
 '(coffee-tab-width 2) ;; coffee-mode.el
 '(comint-input-ring-size 10000) ;; comint.el
 '(company-backends
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
     company-dabbrev company-abbrev company-oddmuse company-capf)) ;; company.el
 ;; '(company-clang-executable (executable-find "clang")) ;; company-clang.el
 '(company-dabbrev-code-everywhere t) ;; company-dabbrev-code.el
 '(company-dabbrev-minimum-length 1) ;; company-dabbrev.el
 ;; '(company-abort-manual-when-too-short nil) ;; company.el: <https://github.com/gorakhargosh/emacs.d/blob/master/config-completion.el>
 ;; '(company-global-modes t) ;; company.el: <https://github.com/gorakhargosh/emacs.d/blob/master/config-completion.el>
 ;; '(company-show-numbers nil) ;; company.el: <https://github.com/gorakhargosh/emacs.d/blob/master/config-completion.el>
 ;; '(company-tooltip-limit 10) ;; company.el: <https://github.com/gorakhargosh/emacs.d/blob/master/config-completion.el>
 ;; '(company-tooltip-margin 1) ;; company.el: <https://github.com/gorakhargosh/emacs.d/blob/master/config-completion.el>
 ;; '(company-tooltip-maximum-width most-positive-fixnum) ;; company.el: <https://github.com/gorakhargosh/emacs.d/blob/master/config-completion.el>
 ;; '(company-tooltip-minimum 6) ;; company.el: <https://github.com/gorakhargosh/emacs.d/blob/master/config-completion.el>
 ;; '(company-tooltip-minimum-width 0) ;; company.el: <https://github.com/gorakhargosh/emacs.d/blob/master/config-completion.el>
 ;; '(company-tooltip-offset-display 'scrollbar) ;; company.el: <https://github.com/gorakhargosh/emacs.d/blob/master/config-completion.el>
 ;; '(company-lighter-base "company") ;; company.el: <https://github.com/gorakhargosh/emacs.d/blob/master/config-completion.el>
 ;; '(company-tooltip-idle-delay nil) ;; company.el: .5 <https://github.com/gorakhargosh/emacs.d/blob/master/config-completion.el>
 '(company-frontends nil) ;; company.el: nil '() <https://github.com/gorakhargosh/emacs.d/blob/master/config-completion.el>
 '(company-idle-delay nil) ;; company.el: 0.7 tradeoff between typing speed and performance <https://emacs.stackexchange.com/questions/32467/how-can-i-configure-company-mode-to-only-display-candidates-after-an-explicit-ke#32523>, <https://github.com/gorakhargosh/emacs.d/blob/master/config-completion.el>
 '(company-minimum-prefix-length 0) ;; company.el: <https://github.com/gorakhargosh/emacs.d/blob/master/config-completion.el>
 '(compilation-scroll-output t) ;; compile.el
 '(counsel-ag-base-command
   (format "%s %s %s" init-counsel-ag-base-command-name init-counsel-ag-base-command-args "%s")) ;; counsel.el
 '(counsel-yank-pop-truncate-radius 4) ;; counsel.el
 ;; '(css-indent-offset 2) ;; css-mode.el
 '(default-tab-width 2) ;; indent.el
 '(deft-auto-save-interval 30.0) ;; deft.el: Idle time in seconds before automatically saving buffers opened by Deft. Set to zero to disable.
 '(deft-directory "~/Notes") ;; deft.el: <http://jblevins.org/projects/deft>
 '(deft-extensions '("md" "markdown" "org" "mw" "txt" "restclient")) ;; deft.el: Any files with these extensions will be listed. The first element of the list is used as the default file extension of newly created files, if `deft-default-extension` is not set.
 '(deft-recursive t) ;; deft.el: Recursively search for files in subdirectories when non-nil.
 '(deft-recursive-ignore-dir-regexp
    (concat "\\(?:" "\\." "\\|\\.\\." "\\|.*-src" "\\|vendor" "\\)$")) ;; deft.el
 '(deft-strip-title-regexp
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
            "$\\)")) ;; deft.el: Regular expression to remove from file titles. Presently, it removes leading LaTeX comment delimiters, leading and trailing hash marks from Markdown ATX headings, leading astersisks from Org Mode headings, and Emacs mode lines of the form -*-mode-*-.
 '(delete-old-versions t) ;; files.el
 '(desktop-base-file-name (convert-standard-filename "desktop")) ;; desktop.el
 '(desktop-base-lock-name (convert-standard-filename "desktop.lock")) ;; desktop.el
 '(desktop-dirname "~/.emacs.var/" t) ;; desktop.el
 '(desktop-globals-to-save '()) ;; desktop.el
 '(desktop-locals-to-save '(desktop-locals-to-save)) ;; desktop.el: Itself! Think it over.
 '(desktop-path '(user-emacs-directory "~/.emacs.var/")) ;; desktop.el
 '(desktop-restore-frames nil) ;; desktop.el
 '(diff-hl-draw-borders nil) ;; diff-hl.el
 '(diff-hl-margin-symbols-alist
   '(
     (change . " ") ;"="
     (delete . " ") ;"-"
     (ignored . " ") ;"!"
     (insert . " ") ;"+"
     (unknown . " ") ;"?"
     )) ;; diff-hl.el
 '(diff-hl-side 'right) ;; diff-hl.el
 '(directory-free-space-args "--human-readable")
 '(dired-details-hidden-string "") ;; dired-details.el
 '(dired-details-hide-extra-lines nil) ;; dired-details.el
 '(dired-details-hide-link-targets nil) ;; dired-details.el
 '(dired-listing-switches "-l --all --human-readable") ;; dired.el
 ;; '(diredfl-compressed-extensions '(".tar" ".taz" ".tgz" ".arj" ".lzh" ".lzma" ".xz" ".zip" ".z" ".Z" ".gz" ".bz2" ".zst")) ;; diredfl.el
 '(diredfl-ignore-compressed-flag nil) ;; diredfl.el
 '(dumb-jump-max-find-time 10) ;; dumb-jump.el
 '(dumb-jump-selector 'ivy) ;; dumb-jump.el
 '(ethan-wspace-face-customized t) ;; ethan-wspace.el: http://github.com/glasserc/ethan-wspace/blob/master/lisp/ethan-wspace.el#L714
 '(fd-dired-display-in-current-window t)
 '(find-temp-custom-spec '((68 lambda nil (format-time-string "%Y%m%d"))))
 '(find-temp-template-alist '(("go" . "danil/go%D%N/%N.%E")))
 '(find-temp-template-default "danil/%D%N.%E")
 '(flycheck-disabled-checkers
   '(go-gofmt go-golint go-vet go-build go-test go-errcheck go-unconvert go-megacheck json-python-json markdown-mdl proselint ruby-reek ruby-rubylint sh-bash sh-posix-bash yaml-ruby yaml-yamllint))
 '(flycheck-idle-change-delay 1.5)
 '(flycheck-indication-mode nil)
 '(flycheck-markdown-markdownlint-cli-config "~/.markdownlint.json")
 '(flycheck-mode-line-prefix "F")
 '(gofmt-command "goimports")
 '(highlight-symbol-highlight-single-occurrence nil) ;; highlight-symbol.el
 '(highlight-symbol-idle-delay 0.2) ;; highlight-symbol.el: 0.5 1.5
 '(highlight-symbol-ignore-list '("[*-]" "[$+=-][$+=-]+")) ;; highlight-symbol.el
 '(historian-save-file "~/.emacs.var/.historian") ;; historian.el
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
 ;; '(ivy-fixed-height-minibuffer nil) ;; ivy.el
 ;; '(ivy-fixed-height-minibuffer t) ;; ivy.el
 ;; '(ivy-height 11) ;; ivy.el
 '(init-anzu-mode-map-exec-prefix init-exec-key-prefix) ;; init-anzu.el
 '(init-browse-url-mode-map-exec-prefix init-exec-key-prefix)
 '(init-bytecomp-mode-map-prefix init-exec-key-prefix)
 '(init-c-mode-patterns '("/etc/portage/savedconfig/www-servers/quark" "/etc/portage/savedconfig/x11-misc/dmenu" "/etc/portage/savedconfig/x11-misc/slstatus" "/etc/portage/savedconfig/x11-misc/tabbed" "/etc/portage/savedconfig/x11-terms/st" "/etc/portage/savedconfig/x11-wm/dwm")) ;; init-cc-mode.el
 '(init-cc-mode-map-prefix init-key-prefix)
 '(init-company-completing-read-function 'init-selectrum-company) ;; init-company.el
 '(init-compile-mode-map-prefix init-key-prefix) ;; init-compile.el
 '(init-conf-mode-patterns
   '(
     ("/Pipfile2\\'"                           conf-mode)
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
     ("/etc/sudoers\\.tmp\\'"                  conf-mode)
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
     )
   ) ;; init-conf-mode.el
 '(init-corral-mode-map-prefix init-key-prefix) ;; init-corral.el
 '(init-cycle-quotes-mode-map-prefix init-key-prefix) ;; init-cycle-quotes.el
 '(init-counsel-mode-map-prefix init-key-prefix) ;; init-counsel.el
 '(init-crontab-mode-patterns '("/etc/cron.d/" "crontab\\'")) ;; init-crontab-mode.el
 '(init-deft-mode-map-exec-prefix init-exec-key-prefix) ;; init-deft.el
 '(init-desktop-mode-map-prefix init-key-prefix) ;; init-desktop.el
 '(init-digit-groups-mode-hooks (append init-programming-modes-hooks '(shell-mode-hook)))
 '(init-dired-details-key "b")
 '(init-emacs-lisp-mode-map-prefix init-key-prefix)
 '(init-emacs-lisp-mode-patterns '("/\\.?abbrev_defs\\'" "/\\.emacs\\.d/bookmarks\\'" "/ac-comphist\\.dat\\'" "\\.el\\.\\(tpl\\|template\\)\\'")) ;; init-emacs-lisp-mode.el
 '(init-ethan-wspace-mode-hooks init-programming-modes-hooks) ;; init-ethan-wspace.el
 '(init-ethan-wspace-disallows-eol-modes '(autoconf-mode awk-mode c-mode cask-mode change-log-mode clojure-mode coffee-mode conf-colon-mode conf-mode conf-space-mode conf-unix-mode conf-xdefaults-mode crontab-mode csharp-mode css-mode dockerfile-mode ebuild-mode emacs-lisp-mode ferm-mode fish-mode git-commit-mode gitconfig-mode gitignore-mode go-mode haml-mode haskell-mode html-mode inf-mongo-mode jade-mode java-mode js-mode js2-mode json-mode less-css-mode lisp-mode litcoffee-mode lua-mode makefile-gmake-mode mediawiki-mode nginx-mode nodejs-repl-mode nroff-mode nxml-mode org-mode pascal-mode perl-mode php-mode python-mode restclient-mode rhtml-mode ruby-mode rust-mode sass-mode sed-mode sgml-mode sh-mode sieve-mode slim-mode sql-mode systemd-mode text-mode toml-mode web-mode xml-mode yaml-mode)) ;; init-ethan-wspace.el
 '(init-ethan-wspace-disallows-many-nls-eof-modes init-programming-modes) ;; init-ethan-wspace.el
 '(init-ethan-wspace-disallows-no-nl-eof-modes init-programming-modes) ;; init-ethan-wspace.el
 '(init-ethan-wspace-disallows-tabs-modes '(autoconf-mode awk-mode cask-mode change-log-mode clojure-mode coffee-mode conf-colon-mode conf-mode conf-space-mode conf-unix-mode conf-xdefaults-mode csharp-mode css-mode dockerfile-mode emacs-lisp-mode ferm-mode fish-mode git-commit-mode gitconfig-mode gitignore-mode haml-mode haskell-mode html-mode inf-mongo-mode jade-mode java-mode js-mode js2-mode json-mode less-css-mode lisp-mode litcoffee-mode lua-mode markdown-mode mediawiki-mode nginx-mode nodejs-repl-mode nroff-mode nxml-mode org-mode pascal-mode perl-mode php-mode python-mode restclient-mode rhtml-mode ruby-mode rust-mode sass-mode sed-mode sgml-mode sh-mode sieve-mode slim-mode sql-mode systemd-mode text-mode toml-mode web-mode xml-mode yaml-mode)) ;; init-ethan-wspace.el
 '(init-expand-region-map-prefix init-key-prefix) ;; init-expand-region.el
 '(init-highlight-symbol-mode-hooks (append init-programming-modes-hooks '(dired-mode-hook shell-mode-hook sql-interactive-mode-hook)))
 '(init-fringe-mode-map-exec-prefix init-exec-key-prefix)
 '(init-rainbow-identifiers-hooks
  '(
    (c-mode-common-hook init-c-mode-rainbow-identifiers-setup)
    (clojure-mode-hook init-clojure-mode-rainbow-identifiers-setup)
    (coffee-mode-hook init-coffee-mode-rainbow-identifiers-setup)
    (conf-colon-mode-hook init-conf-colon-mode-rainbow-identifiers-setup)
    (conf-space-mode-hook init-conf-space-mode-rainbow-identifiers-setup)
    (conf-unix-mode-hook init-conf-unix-mode-rainbow-identifiers-setup)
    (conf-xdefaults-mode-hook init-conf-xdefaults-mode-rainbow-identifiers-setup)
    (csharp-mode-hook init-csharp-mode-rainbow-identifiers-setup)
    (css-mode-hook init-css-mode-rainbow-identifiers-setup)
    (dockerfile-mode-hook init-dockerfile-mode-rainbow-identifiers-setup)
    (elixir-mode-hook init-elixir-mode-rainbow-identifiers-setup)
    (emacs-lisp-mode-hook init-emacs-lisp-mode-rainbow-identifiers-setup)
    (enh-ruby-mode-hook init-enh-ruby-mode-rainbow-identifiers-setup)
    (ferm-mode-hook init-ferm-mode-rainbow-identifiers-setup)
    (go-mode-hook init-go-mode-rainbow-identifiers-setup)
    (haproxy-mode-hook init-haproxy-mode-rainbow-identifiers-setup)
    (hcl-mode-hook init-hcl-mode-rainbow-identifiers-setup)
    (js2-parse-finished-hook init-js2-mode-rainbow-identifiers-setup)
    (json-mode-hook init-json-mode-rainbow-identifiers-setup)
    (lisp-mode-hook init-lisp-mode-rainbow-identifiers-setup)
    (lua-mode-hook init-lua-mode-rainbow-identifiers-setup)
    (nginx-mode-hook init-nginx-mode-rainbow-identifiers-setup)
    (nxml-mode-hook init-nxml-mode-rainbow-identifiers-setup)
    (php-mode-hook init-php-mode-rainbow-identifiers-setup)
    (protobuf-mode-hook init-protobuf-mode-rainbow-identifiers-setup)
    (python-mode-hook init-python-mode-rainbow-identifiers-setup)
    (ruby-mode-hook init-ruby-mode-rainbow-identifiers-setup)
    (rust-mode-hook init-rust-mode-rainbow-identifiers-setup)
    (sh-mode-hook init-sh-mode-rainbow-identifiers-setup)
    (slim-mode-hook init-slim-mode-rainbow-identifiers-setup)
    (sql-interactive-mode-hook init-sql-interactive-mode-rainbow-identifiers-setup)
    (sql-mode-hook init-sql-mode-rainbow-identifiers-setup)
    (systemd-mode-hook init-systemd-rainbow-identifiers-setup)
    (toml-mode-hook init-toml-mode-rainbow-identifiers-setup)
    (typescript-mode-hook init-typescript-mode-rainbow-identifiers-setup)
    (web-mode-hook init-web-mode-rainbow-identifiers-setup)
    (yaml-mode-hook init-yaml-mode-rainbow-identifiers-setup)
    )) ;; init-rainbow-identifiers.el
 '(init-highlight-symbol-mode-prefix init-key-prefix) ;; init-highlight-symbol.el
 '(init-projectile-mode-hooks (append init-programming-modes-hooks '(dired-mode-hook shell-mode-hook sql-interactive-mode-hook))) ;; init-projectile.el
 '(init-projectile-project-root-files '("go.mod"))
 '(init-rainbow-mode-hooks '(css-mode-hook i3wm-config-mode-hook less-css-mode-hook nxml-mode-hook php-mode-hook sass-mode-hook scss-mode-hook web-mode-hook xml-mode-hook)) ;; init-rainbow-mode.el
 '(init-wdired-map-exec-prefix init-exec-key-prefix) ;; init-wdired.el
 '(init-window-numbering-mode-map-prefix init-key-prefix) ;; init-window-numbering.el
 '(ivy-count-format "(%d/%d) ") ;; ivy.el
 '(ivy-truncate-lines nil) ;; ivy.el: it is fixed by <<https://github.com/abo-abo/swiper/issues/1307>
 '(ivy-use-virtual-buffers nil) ;; ivy.el: virtual buffers slow down switching between buffers
 '(js2-mode-show-strict-warnings nil)
 '(json-encoding-default-indentation "    " t)
 '(kept-new-versions 6)
 '(kept-old-versions 2)
 '(kill-ring-max 1000)
 '(magit-blame-heading-format "%-20a %C %s %H")
 '(magit-completing-read-function 'selectrum-completing-read)
 '(markdown-command "blackfriday-tool")
 '(markdown-toc-header-toc-title "")
 '(markdown-toc-list-item-marker "*")
 '(mediawiki-site-alist
   '(("en" "http://en.wikipedia.org/w/" "danilkutkevich" "" "Main Page")
     ("ru" "http://ru.wikipedia.org/w/" "danilkutkevich" "" "Main Page")))
 '(mediawiki-site-default "en")
 '(menu-bar-mode nil)
 '(mode-line-format '("%e"
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
                      mode-line-end-spaces)) ;; mode-line.el
 '(mode-require-final-newline nil)
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
 '(multi-compile-history-file (expand-file-name "multi-compile.cache" "~/.emacs.var"))
 '(noxrcp-auto-completion-modes
   (append init-programming-modes
           '(redis-cli-mode shell-mode telnet-mode wdired-mode)))
 '(noxrcp-ferm-mode--rainbow-identifiers-stop-words '("ACCEPT" "DROP" "FORWARD" "INPUT" "OUTPUT" "REJECT"))
 '(noxrcp-ferm-mode-patterns '("/etc/iptables/rules.v[46]" "\\.rules\\'"))
 '(noxrcp-gitignore-mode-patterns
   '("/\\.agignore\\'" "/\\.dockerignore\\'" "/\\.gitignore_global\\'" "/\\.stglobalignore\\'" "/\\.stignore\\'" "/\\.stignore_global\\'" "/\\.stignoreglobal\\'"))
 '(noxrcp-go-expr-completion-modes-hooks '(go-mode-hook))
 '(noxrcp-go-mode--rainbow-identifiers-stop-words
   '("adler32" "aes" "ascii85" "asn1" "ast" "atomic" "base32" "base64" "big" "binary" "bufio" "build" "builtin" "bytes" "bzip2" "cgi" "cgo" "cipher" "cmplx" "color" "constant" "context" "cookiejar" "crc32" "crc64" "crypto" "csv" "debug" "des" "doc" "draw" "driver" "dsa" "dwarf" "ecdsa" "elf" "elliptic" "encoding" "errors" "exec" "expvar" "fcgi" "filepath" "flag" "flate" "fnv" "format" "gif" "gob" "gosym" "gzip" "hash" "heap" "hex" "hmac" "html" "http" "httptest" "httptrace" "httputil" "image" "importer" "init" "internal" "io" "iotest" "ioutil" "jpeg" "json" "jsonrpc" "list" "log" "lzw" "macho" "mail" "main" "math" "md5" "mime" "multipart" "net" "os" "palette" "parse" "parser" "path" "pe" "pem" "pkix" "plan9obj" "png" "pprof" "pprof" "printer" "quick" "quotedprintable" "race" "rand" "rand" "rc4" "reflect" "regexp" "ring" "rpc" "rsa" "runtime" "scanner" "scanner" "sha1" "sha256" "sha512" "signal" "smtp" "sort" "sql" "strconv" "strings" "subtle" "suffixarray" "sync" "syntax" "syscall" "syslog" "tabwriter" "tar" "template" "template" "testing" "textproto" "tls" "token" "types" "unicode" "unsafe" "url" "user" "utf16" "utf8" "x509" "xml" "zip" "zlib" "bool" "Bool" "byte" "Byte" "Bytes" "chan" "Chan" "complex128" "Complex128" "complex64" "Complex64" "error" "float32" "Float32" "float64" "Float64" "fmt" "Stringer" "int" "Int" "int16" "Int16" "int32" "Int32" "int64" "Int64" "int8" "Int8" "rune" "Rune" "string" "String" "struct" "Struct" "time" "Time" "uint" "Uint" "uint16" "Uint16" "uint32" "Uint32" "uint64" "Uint64" "uint8" "Uint8" "uintptr" "Uintptr" "DB" "DBStats" "NullBool" "NullFloat64" "NullInt64" "NullString" "RawBytes" "Result" "Row" "Rows" "Scanner" "Stmt" "Tx" "Valid"))
 '(noxrcp-haproxy-mode-patterns
   '("/haproxy.*\\.\\(erb\\|cfg\\)'" "haproxy/.*\\(erb\\|cfg\\)\\'"))
 '(noxrcp-highlight-static-regexps-hooks
   '((go-mode-hook noxrcp-go-mode--highlight-static-regexps-init)))
 '(noxrcp-js2-mode-patterns '("\\.htc\\'" "\\.js\\'"))
 '(noxrcp-json-mode-patterns
   '("/composer\\.lock\\'" "\\.bowerrc\\'" "\\.json\\.example\\'" "\\.json\\.template\\'"))
 '(noxrcp-linum-max-lines 5000)
 '(noxrcp-linum-modes (-difference init-programming-modes '(org-mode)))
 '(noxrcp-linum-modes-hooks
   (mapcar
    (lambda
      (m)
      (intern
       (concat
        (symbol-name m)
        "-hook")))
    noxrcp-linum-modes))
 '(noxrcp-logview-mode-patterns
   '("/access_log\\(?:\\.[0-9]+\\)?\\'" "/error_log\\(?:\\.[0-9]+\\)?\\'" "/var/log/boot\\'" "/var/log/cups/access_log\\(?:\\.[0-9]+\\)?\\'" "/var/log/dmesg\\(?:\\.[0-9]+\\)?\\'" "/var/log/messages\\'" "/var/log/mysql/mysql.err\\'" "/var/log/mysql/mysqld.err\\'" "/var/log/syslog\\(?:\\.[0-9]+\\)?\\'" "\\.access_log\\(?:\\.[0-9]+\\)?\\'" "\\.error_log\\(?:\\.[0-9]+\\)?\\'" "\\.log\\(?:\\.[0-9]+\\)?\\'" "/mainlog\\'" "/rejectlog\\'"))
 '(noxrcp-lua-mode-patterns '("\\.lua\\.example\\'" "\\.ws\\'"))
 '(noxrcp-markdown-mode-patterns
   '("/Dropbox/deft/.*\\.txt\\'" "/README\\'" "/mutt[-a-zA-Z0-9]+\\'" "\\.markdown\\'" "\\.md\\'" "\\.mdown\\'"))
 '(noxrcp-nginx-mode-patterns '("/etc/nginx/.*\\.conf\\'" "/etc/nginx/sites-available/"))
 '(noxrcp-read-only-modes
   (append init-base-modes
           '(Info-mode Man-mode ag-mode cider-stacktrace-mode compilation-mode dired-mode help-mode ibuffer-mode magit-branch-manager-mode magit-commit-mode magit-diff-mode magit-log-mode magit-process-mode magit-status-mode occur-mode)))
 '(noxrcp-rspec-mode-patterns '("_spec\\.rb\\'" "/spec[0-9]*\\.rb\\'"))
 '(noxrcp-ruby-mode--rainbow-identifiers-stop-words
   '("_" "with_indifferent_access" "Integer" "it_behaves_like" "inspect" ":count" ":date" ":errors" ":float" ":json" ":jsonb" ":push" ":uuid" "Array" "assign_attributes" "ascii_only?" "all?" "as_json" "allow_any_instance_of" "ApplicationController" "ArgumentError" "ActiveSupport" "ActiveRecord" "ActiveModel" "after" "any?" "after_create" "after_commit" "after_create_commit" "after_save" "after_update" "alias_attribute" "all" "and" "as:" "Base64" "backtrace" "Base" "base" "boolean" "bigint" "before_action" "between?" "before_save" "before_update" "belongs_to" "blank?" "build" "changed?" "Class" "crated_at" "clear_active_connections!" "call" "class" "clone" "compact!" "compact" "concat" "count" "create!" "create" "Date" "created_at" "datetime" "decimal" "decode64" "default" "default:" "default_scope" "default_scoped" "delegate" "delegate_missing_to" "delete" "delete_at" "delete_if" "destroy!" "destroy" "downcase" "drop" "dup" "Errno" "ENOENT" "extname" "encode64" "Enumerable" "Encoding" "Exception" "except" "each_with_index" "end_with?" "exists?" "each" "each_with_object" "empty?" "enum" "equal_to" "Errors" "errors" "errors:" "even" "extract_options!" "File" "fail" "FalseClass" "Float" "find" "find_each" "find_in_batches" "flatten!" "flatten" "false" "find_by" "find_or_create_by!" "find_or_create_by" "first" "float" "freeze" "full_messages" "gsub" "greater_than" "greater_than_or_equal_to" "hex" "Hash" "has_many" "has_one" "instance_variable_get" "instance_variable_set" "if:" "include?" "included" "index" "initial" "initialize" "integer" "is_a?" "json" "jsonb" "join" "joins" "keys" "LockWaitTimeout" "lock" "ljust" "last" "length" "less_than" "less_than_or_equal_to" "limit" "limit:" "method_missing" "methods" "module_parent" "messages" "map" "match" "match?" "merge" "merge!" "mock_model" "module_function" "none?" "NilClass" "Numeric" "none" "negative?" "new" "nil" "nil?" "not" "null" "null:" "numericality" "OrderedHash" "OpenStruct" "order" "odd" "other_than" "parse" "params:" "performed?" "positive?" "polymorphic" "polymorphic:" "pop" "pluck" "presence" "presence:" "present?" "push" "push:" "persisted?" "JSON" "read" "raise" "reject" "reload" "rescue_from" "rjust" "render" "respond_to?" "sample" "strip" "strict_encode64" "strict_decode64" "stringify_keys" "superclass" "start_with?" "symbolize_keys" "Symbol" "Struct" "send" "set_backtrace" "skip_before_action" "SecureRandom" "string" "String" "select!" "select" "save!" "save" "scope" "scoped" "second" "self" "size" "slice" "split" "status" "shift" "status:" "stub" "sum" "Thread" "TimeWithZone" "to_date" "to_time" "TrueClass" "Time" "transform_values" "text" "tap" "table_name" "third" "to_sym" "to_sym!" "to_a" "to_proc" "to_h" "to_hash" "to_i" "to_json" "to_s" "transform_keys" "true" "try" "UTF_8" "update_at" "uuid" "uniq!" "uniq" "unique" "unique:" "uniqueness" "upcase" "update!" "update" "update_attribute" "update_attribute!" "update_all" "update_column" "update_columns" "updated_at" "values" "valid" "valid?" "validate" "validates" "where" "with_options" "zero?"))
 '(noxrcp-ruby-mode-patterns
   '("/Capfile\\'" "/Gemfile\\'" "/Guardfile\\.private.example\\'" "/Guardfile\\.private\\'" "/Guardfile\\'" "/[rR]akefile\\'" "/[vV]agrantfile.proxy\\'" "/[vV]agrantfile\\'" "\\.atex\\'" "\\.gemspec\\'" "\\.irbrc\\'" "\\.mdlrc\\'" "\\.prawn\\'" "\\.rake\\'" "\\.rb\\.erb\\'" "\\.thor\\'" "\\.yml\\.erb\\'"))
 '(noxrcp-sh-mode-patterns
   '("/Procfile\\'" "/\\.ackrc\\'" "/\\.bash_aliases\\'" "/\\.bpkgrc\\'" "/\\.env\\(\\.development\\|.production\\)?\\(\\.example\\)?\\'" "/\\.lessfilter\\'" "/\\.mkshrc\\'" "/\\.xprofile\\'" "/dwmrc\\'" "/etc/profile\\'" "\\.bashrc\\'" "/apt/.+\\.list\\(\\.save\\)?\\'" "/etc/init.d/" "/etc/local.d/.+\\.\\(start\\|stop\\)"))
 '(noxrcp-sql-mode-patterns '("/Dropbox/deft/sql/.*\\.sql\\.md\\'"))
 '(noxrcp-systemd--rainbow-identifiers-stop-words 'nil)
 '(noxrcp-systemd-patterns 'nil)
 '(noxrcp-toggle-quotes-modes
   '(awk-mode cask-mode coffee-mode conf-mode conf-space-mode conf-xdefaults-mode csharp-mode css-mode emacs-lisp-mode enh-ruby-mode haml-mode haskell-mode html-mode java-mode js-mode js2-mode lisp-mode lua-mode makefile-gmake-mode markdown-mode nxml-mode org-mode perl-mode php-mode rhtml-mode ruby-mode sass-mode scss-mode sgml-mode sh-mode shell-mode slim-mode sql-mode xml-mode yaml-mode))
 '(noxrcp-web-mode-patterns
   '("/src/vendor/narus/narus-web/.+\\.jsx?\\'" "\\.\\(html\\|text\\)\\.erb\\'" "\\.as[cp]x\\'" "\\.djhtml\\'" "\\.ejs\\'" "\\.html\\'" "\\.js.erb\\'" "\\.jsp\\'" "\\.jst\\.ejs\\'" "\\.jsx\\'" "\\.phtml\\'" "\\.rhtml\\'" "\\.tpl\\.php\\'"))
 '(noxrcp-yaml-mode-patterns
   '("/\\(group\\|host\\)_vars/[^.]*\\'" "/\\.kube/[^/.]*\\'" "\\.ya?ml\\(\\.example\\|\\.sample\\)?\\'" "\\.yml\\.j2\\'"))
 '(pack-dired-default-extension ".tar.xz") ;; pack.el
 '(pack-program-alist
   '(("\\.7z\\'" :pack "7z a" :unpack "7z x")
     ("\\.tar\\'" :pack "tar -cf" :unpack "tar -xf")
     ("\\.tar\\.gz\\'" :pack "tar -czf" :unpack "tar -xf")
     ("\\.tar\\.xz\\'" :pack "tar -cJf" :unpack "tar -xJf")
     ("\\.tgz\\'" :pack "tar -czf" :unpack "tar -xf")
     ("\\.zip\\'" :pack "zip -r" :unpack "unzip"))) ;; pack.el
 '(package-selected-packages
   '(string-inflection skeletor markdown-toc visual-regexp typescript-mode noccur fd-dired counsel-fd pkgbuild-mode logview tramp i3wm-config-mode pinentry ctrlf amx selectrum-prescient selectrum go-translate su go-expr-completion flatbuffers-mode pacfiles-mode lsp-ivy lsp-mode counsel-jq ansi package-build shut-up epl git commander f dash s dart-mode rbtagger counsel-world-clock ztree yasnippets yasnippet-snippets yaml-mode window-numbering wgrep-pt wgrep-ag web-mode vlf vimrc-mode unicode-troll-stopper undo-tree twittering-mode transpose-frame top-mode toml-mode tldr systemd speed-type smart-mode-line slim-mode simp sed-mode scss-mode sass-mode rust-mode ruby-tools ruby-refactor ruby-pry ruby-hash-syntax ruby-guard rspec-mode robe restclient redis recentf-ext rainbow-mode rainbow-identifiers rainbow-delimiters quickrun quelpa protobuf-mode projectile-rails pack origami org-ac noflet nodejs-repl nginx-mode narrow-indirect mustache-mode multi-compile minitest mediawiki markdownfmt markdown-mode magit-popup magit literate-coffee-mode list-unicode-display json-mode jsfmt js2-mode jade-mode ivy-hydra ivy-historian ivy-dired-history inf-mongo ibuffer-vc hl-todo highlight-symbol gotest godoctor go-stacktracer go-snippets gitignore-mode gitconfig-mode git-timemachine flycheck-golangci-lint fish-mode findr find-temp-file ferm-mode expand-region ethan-wspace etags-select enh-ruby-mode elpa-mirror elixir-mode elisp-slime-nav ebuild-mode dumb-jump dockerfile-mode direx diredfl dired-details digit-groups diffview diff-hl deft cycle-quotes csv-mode css-comb csharp-mode crontab-mode crm-custom corral company-web company-shell company-php company-lua company-inf-ruby company-go company-erlang column-marker clojure-mode cask-mode cask browse-kill-ring bash-completion apache-mode anzu ac-html))
 '(password-cache-expiry 3600)
 '(prescient-save-file "~/.emacs.var/prescient-save.el") ;; prescient.el
 '(projectile-completion-system 'init-selectrum-unsorted-read) ;; projectile.el:'default = selectrum <https://github.com/raxod502/selectrum/wiki/Additional-Configuration#working-with-projects-in-projectile> ;'ivy ;'ido
 '(projectile-dynamic-mode-line nil) ;; projectile.el
 '(projectile-indexing-method 'alien) ;; projectile.el: 'native ; 'alien ; 'hybrid ; error: Setting current directory: No such file or directory, some/path: No url found for submodule path 'some-module-name' in .gitmodules <https://github.com/syl20bnr/spacemacs/issues/11507>
 '(projectile-mode-line nil) ;; projectile.el
 '(recentf-auto-cleanup 'never)
 '(recentf-max-menu-items 9000)
 '(recentf-max-saved-items nil)
 '(recentf-save-file "~/.emacs.var/recentf")
 '(rm-text-properties '()) ;; rich-minority.el
 '(rm-whitelist " F") ;; rich-minority.el
 '(rspec-use-spring-when-possible nil)
 '(ruby-encoding-magic-comment-style 'ruby)
 '(ruby-insert-encoding-magic-comment nil)
 '(safe-local-variable-values '((encoding . utf-8)))
 '(save-place-file "~/.emacs.var/places")
 '(save-place-limit 10000)
 '(savehist-additional-variables
   '(compile-command compile-history dired-regexp-history dired-shell-command-history file-name-history kill-ring minibuffer-history query-replace-history regexp-history regexp-search-ring search-ring shell-command-history))
 '(savehist-file "~/.emacs.var/history")
 '(scroll-bar-width 7 t)
 '(selectrum-count-style 'current/matches) ;; selectrum.el
 '(show-paren-mode t)
 '(skeletor-completing-read-function 'selectrum-completing-read)
 '(skeletor-init-with-git nil)
 '(sml/col-number-format "%c") ;; smart-mode-line.el
 '(sml/directory-truncation-string "<") ;; smart-mode-line.el
 '(sml/line-number-format "%l") ;; smart-mode-line.el
 '(sml/mode-width 'full) ;; smart-mode-line.el
 '(sml/name-width '(0 . 44)) ;; smart-mode-line.el
 '(sml/no-confirm-load-theme t) ;; smart-mode-line.el
 '(sml/projectile-replacement-format "%s>") ;; smart-mode-line.el
 '(sml/replacer-regexp-list '(("^/sudo:.*:" ":SU:"))) ;; smart-mode-line.el
 '(sml/shorten-directory t) ;; smart-mode-line.el
 '(sml/theme 'automatic) ;; smart-mode-line.el
 '(split-height-threshold nil)
 '(split-width-threshold 64)
 '(sql-postgres-login-params
   '((user :default "danil")
     (database :default "danil")
     (port :default 5432)
     server))
 '(standard-indent 2)
 '(tab-stop-list (number-sequence 2 200 2))
 '(tab-width 2)
 '(tldr-directory-path (expand-file-name "tldr/" "~/.emacs.var"))
 '(tldr-use-word-at-point t)
 '(uniquify-min-dir-content 20)
 '(version-control t)
 '(window-min-height 1)
 '(window-min-width 1)
 '(winner-dont-bind-my-keys t))
;;; Colors available to Emacs <http://raebear.net/comp/emacscolors.html>.
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(anzu-mode-line ((((class color) (min-colors 88) (background dark)) (:background "black" :foreground "magenta" :weight bold)))) ;; anzu.el
 '(anzu-mode-line-no-match ((((class color) (min-colors 88) (background dark)) (:inherit noxrcp-faces--alert-fixme)))) ;; anzu.el
 '(column-marker-1 ((((class color) (min-colors 88) (background light)) :background "gray80")
                    (((class color) (min-colors 88) (background dark)) :background "gray35"))) ;; column-marker.el
 '(ctrlf-highlight-active ((t :background "brightwhite" :foreground "brightred"))) ;; ctrlf.el
 '(diff-added ((((class color) (min-colors 88) (background dark)) :foreground "brightgreen"))) ;; diff-mode.el
 '(diff-removed ((((class color) (min-colors 88) (background dark)) :foreground "brightred"))) ;; diff-mode.el
 '(diff-changed ((((class color) (min-colors 88) (background dark)) :foreground "brightblue"))) ;; diff-mode.el
 '(ediff-even-diff-A-line ((((class color) (min-colors 88) (background dark)) (:background "color-236")))) ;; ediff-init.el
 '(ediff-even-diff-A ((((class color) (min-colors 88) (background dark)) (:background "color-236")))) ;; ediff-init.el
 '(ediff-even-diff-Ancestor ((((class color) (min-colors 88) (background dark)) (:background "color-235")))) ;; ediff-init.el
 '(ediff-even-diff-B ((((class color) (min-colors 88) (background dark)) (:background "color-237")))) ;; ediff-init.el
 '(ediff-even-diff-C ((((class color) (min-colors 88) (background dark)) (:background "color-238")))) ;; ediff-init.el
 '(ediff-odd-diff-A ((((class color) (min-colors 88) (background dark)) (:background "color-240")))) ;; ediff-init.el
 '(ediff-odd-diff-Ancestor ((((class color) (min-colors 88) (background dark)) (:background "color-239")))) ;; ediff-init.el
 '(ediff-odd-diff-B ((((class color) (min-colors 88) (background dark)) (:background "color-241")))) ;; ediff-init.el
 '(ediff-odd-diff-C ((((class color) (min-colors 88) (background dark)) (:background "color-242")))) ;; ediff-init.el
 '(ediff-current-diff-A ((((class color) (min-colors 88) (background dark)) (:foreground nil)))) ;; ediff-init.el
 '(ediff-current-diff-B ((((class color) (min-colors 88) (background dark)) (:foreground nil)))) ;; ediff-init.el
 '(ediff-current-diff-C ((((class color) (min-colors 88) (background dark)) (:foreground nil)))) ;; ediff-init.el
 '(ediff-current-diff-A ((((class color) (min-colors 88) (background dark)) (:background "color-52")))) ;; ediff-init.el: DarkRed
 '(ediff-current-diff-B ((((class color) (min-colors 88) (background dark)) (:background "color-22")))) ;; ediff-init.el: DarkGreen
 '(ediff-current-diff-C ((((class color) (min-colors 88) (background dark)) (:background "DarkOrange4")))) ;; ediff-init.el
 '(ethan-wspace-face ((((class color) (min-colors 88) (background dark)) (:background "gray15")))) ;; ethan-wspace.el
 '(highlight-symbol-face ((t (:inherit highlight)))) ;; highlight-symbol.el
 '(init-truncation-glyph-face ((t (:background "orchid3")))) ;; init-disp-table-line-wrap-and-truncation.el: orchid3 coral3 red
 '(init-wrap-glyph-face ((t (:background "limegreen")))) ;; ;; init-disp-table-line-wrap-and-truncation.el: green4 ;; green3 ;; light green
 '(ivy-current-match ((t :inverse-video t))) ;; ivy.el: :inherit highlight
 '(ivy-minibuffer-match-face-1 ((t :background "gray10"))) ;; ivy.el
 '(ivy-minibuffer-match-face-2 ((t :background "red"))) ;; ivy.el
 '(ivy-minibuffer-match-face-3 ((t :background "blue"))) ;; ivy.el
 '(ivy-minibuffer-match-face-4 ((t :background "green4"))) ;; ivy.el
 '(linum ((((class color) (min-colors 88) (background light)) :foreground "black" :background "gray90") (((class color) (min-colors 88) (background dark)) :foreground "DarkGray" :background "gray25"))) ;; linum.el: ((background dark) :foreground "DimGray")
 '(mode-line ((((class color) (min-colors 88) (background dark)) (:background "black")))) ;; mode-line.el: :background MidnightBlue black color-52 OrangeRed4 black gray10 purple4 NavyBlue firebrick4 brown4 red4 computers/emacs-colors>
 '(mode-line-inactive ((((class color) (min-colors 88) (background dark)) :inherit shadow :foreground "grey70" :background "gray30"))) ;; mode-line.el:  ;; :background "MidnightBlue" <http://raebear.net/computers/emacs-colors>
 '(rainbow-delimiters-depth-1-face ((((class color) (min-colors 88) (background dark)) :foreground "dark orange"))) ;; rainbow-delimiters.el
 '(rainbow-delimiters-depth-2-face ((((class color) (min-colors 88) (background dark)) :foreground "deep pink"))) ;; rainbow-delimiters.el
 '(rainbow-delimiters-depth-3-face ((((class color) (min-colors 88) (background dark)) :foreground "chartreuse"))) ;; rainbow-delimiters.el
 '(rainbow-delimiters-depth-4-face ((((class color) (min-colors 88) (background dark)) :foreground "deep sky blue"))) ;; rainbow-delimiters.el
 '(rainbow-delimiters-depth-5-face ((((class color) (min-colors 88) (background dark)) :foreground "yellow"))) ;; rainbow-delimiters.el
 '(rainbow-delimiters-depth-6-face ((((class color) (min-colors 88) (background dark)) :foreground "orchid"))) ;; rainbow-delimiters.el
 '(rainbow-delimiters-depth-7-face ((((class color) (min-colors 88) (background dark)) :foreground "spring green"))) ;; rainbow-delimiters.el
 '(rainbow-delimiters-depth-8-face ((((class color) (min-colors 88) (background dark)) :foreground "sienna1"))) ;; rainbow-delimiters.el
 '(scroll-bar ((((class color) (min-colors 88) (background dark)) (:background "white" :foreground "gray"))))
 '(selectrum-current-candidate ((t :inverse-video t))) ;; selectrum.el
 '(selectrum-primary-highlight ((t :background "red"))) ;; selectrum.el
 '(selectrum-secondary-highlight ((t :background "blue"))) ;; selectrum.el
 '(sml/git ((t :inherit (sml/not-modified sml/prefix)))) ;; smart-mode-line.el
 '(sml/global ((t (:foreground "gray60" :inverse-video nil)))) ;; smart-mode-line.el
 '(sml/line-number ((t (:foreground "brightwhite" :weight normal)))) ;; smart-mode-line.el
 '(sml/position-percentage ((t (:inherit sml/read-only)))) ;; smart-mode-line.el
 '(sml/projectile ((t (:weight normal :inherit sml/filename)))) ;; smart-mode-line.el
 '(sp-pair-overlay-face ((t nil)))
 ;; '(swiper-include-line-number-in-search nil) ;; swiper.el
 ;; '(swiper-goto-start-of-match nil) ;; swiper.el
 '(window-numbering-face ((((class color) (min-colors 88) (background dark)) (:foreground "PaleGreen" :background "unspecified-bg" :inherit mode-line-inactive))) t) ;; window-numbering.el: <http://blog.binchen.org/?p=512#sec-1>.
 )
