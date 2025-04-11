(source "ELPA" "http://tromey.com/elpa/")
(source "melpa-stable" "http://stable.melpa.org/packages/")
(source gnu)
(source melpa)
(source org)

;; (depends-on "cask") ; NOTE: error: Some dependencies were not available: cask ~~~~<danil@kutkevich.org>

;; (depends-on "erise")
;; (depends-on "lfe-mode")
;; (depends-on "mmm-mode")
;; (depends-on "org-readme")
;; (depends-on "yafolding")

(depends-on "ac-html" :git "https://github.com/zhangkaiyulw/ac-html.git" :ref "v0.31") ; i can not setup new version
(depends-on "web-completion-data") ; used by ad-html

;; C/C++ compile/make dependencies.
(depends-on "ccls")

;; (depends-on "cider") ; i do not want upgrade "cider-nrepl plugin"
(depends-on "clojure-mode")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; vvv↓vvv Magit mode <https://github.com/magit/magit> below this line.

(depends-on "magit")
(depends-on "magit-popup")

;;; ^^^↑^^^ Magit mode <https://github.com/magit/magit> above this line.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; vvv↓vvv Org mode <https://github.com/bzg/org-mode> below this line.

(depends-on "org" "20150929") ; fixme: respects version!!!!!!!!!!!!!!!!!!!!!!
(depends-on "org-ac")

;;; ^^^↑^^^ Org mode <https://github.com/bzg/org-mode> above this line.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; vvv↓vvv Company mode <https://github.com/company-mode/company-mode> below this line.

;; Company auto complete.
;; (depends-on "company-ansible")
;; (depends-on "company-edbi")
;; (depends-on "company-statistics")
(depends-on "company")
(depends-on "company-erlang")
(depends-on "company-go")
(depends-on "company-inf-ruby")
(depends-on "company-lua")
(depends-on "company-nginx")
(depends-on "company-php")
(depends-on "company-shell")
(depends-on "company-web")

;;; ^^^↑^^^ Company mode <https://github.com/company-mode/company-mode> above this line.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; vvv↓vvv Fuzzy searching in multiple files below this line.

;; Fuzzy searching in multiple files (projectile and friends).
;; (depends-on "ag") ; using `counsel-ag` instead
;; (depends-on "pt") ; using `counsel-pt` instead ; the platinum searcher (ag and ack replacement <https://github.com/monochromegane/the_platinum_searcher>)
;; (depends-on "rg") ; using `counsel-rg` instead ; ripgrep is an a-la ag platinum searcher written in rust
(depends-on "urgrep")
(depends-on "wgrep-ag") ; editable grep
(depends-on "wgrep-pt") ; editable grep

;;; ^^^↑^^^ Fuzzy searching in multiple files above this line.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(depends-on "anzu") ; isearch and query-replace extension
(depends-on "apache-mode")
(depends-on "back-button") ; two-way navigation through mark ring forward/backward
;(depends-on "bash-completion")
(depends-on "cask-mode")
(depends-on "column-marker" :git "https://github.com/emacsmirror/column-marker.git")
(depends-on "corral") ; smartparens replacement (quotes/parentheses/delimiters manager)
(depends-on "crontab-mode" :git "https://github.com/emacsmirror/crontab-mode.git")
(depends-on "csharp-mode")
(depends-on "csv-mode")
(depends-on "cycle-quotes")
(depends-on "dart-mode")
(depends-on "dash")
(depends-on "deft")
(depends-on "diffview")
(depends-on "digit-groups") ; highlighting digit groups in numbers

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; vvv↓vvv Dired mode below this line.

;; Dired.
;; (depends-on "dired-dups")
(depends-on "dired-details" :git "https://github.com/emacsmirror/dired-details.git")
(depends-on "diredfl")
(depends-on "direx")
(depends-on "pack") ; archive/tar/gzip/xz

;;; ^^^↑^^^ Dired mode above this line.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(depends-on "dockerfile-mode")
(depends-on "dumb-jump")
(depends-on "ebuild-mode" :git "https://github.com/emacsmirror/ebuild-mode.git") ; "Gentoo ebuild and eclass mode <http://wiki.gentoo.org/wiki/Project:Emacs>, <https://packages.gentoo.org/packages/app-emacs/ebuild-mode>" ; http://dev.gentoo.org/~ulm/emacs/ebuild-mode-1.26.tar.xz
(depends-on "elisp-slime-nav")
(depends-on "elixir-mode")
(depends-on "elpa-mirror")
(depends-on "etags-select")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; vvv↓vvv Evil mode <https://github.com/emacs-evil/evil> below this line.

(depends-on "evil")
(depends-on "evil-collection") ;; <https://github.com/emacs-evil/evil-collection#installation>.
(depends-on "evil-terminal-cursor-changer") ;; <https://github.com/7696122/evil-terminal-cursor-changer>
(depends-on "goto-chg")

;;; ^^^↑^^^ Evil mode <https://github.com/emacs-evil/evil> above this line.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(depends-on "expand-region")
(depends-on "ferm-mode" :git "https://github.com/danil/ferm-mode.git" :files ("ferm-mode.el")) ; "Major mode for ferm iptables tool <https://gitorious.org/kaction-emacs/ferm-mode>, <http://ferm.foo-projects.org>"
(depends-on "find-dupes-dired") ; find dupes/duplicates and handle them in dired-mode https://github.com/ShuguangSun/find-dupes-dired (find using external command fdupes https://github.com/adrianlopezroche/fdupes)
(depends-on "find-temp-file")
(depends-on "findr")
(depends-on "fish-mode")
(depends-on "flatbuffers-mode") ; major mode for editing flatbuffers .fbs files
(depends-on "flycheck")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; vvv↓vvv fd <https://github.com/sharkdp/fd> below this line.

;; fd a-la find replacement.
(depends-on "counsel-fd")
(depends-on "fd-dired")

;;; ^^^↑^^^ fd <https://github.com/sharkdp/fd> above this line.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; vvv↓vvv Go programming language <https://github.com/dominikh/go-mode.el> below this line.

;; (depends-on "flycheck-gometalinter")
(depends-on "flycheck-golangci-lint")
(depends-on "go-expr-completion") ; complete a left-hand side from given expression
(depends-on "go-mode")
;; (depends-on "go-snippets") ; FAIL: Ignoring unknown directive "contributer" in file: ... Ignoring unknown directive "description" in file: ...
(depends-on "go-stacktracer")
(depends-on "godoctor")
(depends-on "gotest")

;;; ^^^↑^^^ Go programming language <https://github.com/dominikh/go-mode.el> above this line.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; vvv↓vvv Git below this line.

;; (depends-on "git-gutter")
(depends-on "diff-hl")
(depends-on "git-modes") ; NOTE: Provides gitconfig-mode and gitignore-mode <https://github.com/magit/git-modes>.~~~~<danil@kutkevich.org>
(depends-on "git-timemachine")

;;; ^^^↑^^^ Git above this line.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (depends-on "go-translate") ; google translate https://github.com/lorniu/go-translate
;; (depends-on "iedit") ; isearch + edit is an a-la multiple-cursors-mode
(depends-on "crm-custom")
(depends-on "css-comb") ; css formater
(depends-on "haml-mode")
(depends-on "highlight-symbol")
(depends-on "highlight-thing")
(depends-on "hl-todo")
(depends-on "hydra") ; FIXME: A nested hotkey definition is a anti-pattern instead must use a best practice and do using the `general.el` because that package provides a more convenient method for binding keys in Emacs. ; Key bindings a-la `transient`.~~~~<danil@kutkevich.org>
(depends-on "i3wm-config-mode")
(depends-on "inf-mongo")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; vvv↓vvv Counsel/Ivy <https://github.com/emacsmirror/ivy> below this line.

;; Ivy (is an ido replacement).
;; (depends-on "counsel-projectile") ; projectile respect selectrum instead of counsel
;; (depends-on "ivy-dired-history") ; error: Some dependencies were not available: ivy-dired-history
(depends-on "consult") ; a-la counsel replacement <https://github.com/minad/consult>
(depends-on "counsel")
(depends-on "counsel-jq") ; queries against json
(depends-on "counsel-world-clock") ; <https://github.com/kchenphy/counsel-world-clock>
(depends-on "ivy")
(depends-on "ivy-historian")
(depends-on "ivy-hydra")
(depends-on "lsp-ivy") ; ivy respects lsp (language server protocol) <https://github.com/emacs-lsp/lsp-mode#configure-lsp-mode>, <https://github.com/emacs-lsp/lsp-ivy>
(depends-on "swiper")
(depends-on "wgrep") ; editable `ivy-occur` buffer (grep-mode)

;;; ^^^↑^^^ Counsel/Ivy <https://github.com/emacsmirror/ivy> above this line.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; vvv↓vvv JavaScript programming language below this line.

(depends-on "coffee-mode")
(depends-on "jade-mode")
(depends-on "js2-mode")
(depends-on "jsfmt")
(depends-on "json-mode")
(depends-on "json-reformat")
(depends-on "jsonnet-mode")
(depends-on "literate-coffee-mode")
(depends-on "typescript-mode")

;;; ^^^↑^^^ JavaScript programming language above this line.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(depends-on "browse-kill-ring")
(depends-on "kill-ring-ido" :git "https://github.com/lalopmak/kill-ring-ido.git")
(depends-on "noflet")

(depends-on "graphql-mode") ; https://github.com/davazp/graphql-mode
(depends-on "leerzeichen") ; `leerzeichen-mode` is a minor mode to display whitespace characters <https://github.com/fgeller/leerzeichen.el>. ; (depends-on "ethan-wspace")
(depends-on "less-css-mode")
(depends-on "list-unicode-display")
(depends-on "logview")
(depends-on "lsp-mode")
(depends-on "lua-mode")
(depends-on "markdown-mode")
(depends-on "markdown-toc")
(depends-on "markdownfmt")
(depends-on "mediawiki")
(depends-on "mustache-mode")
(depends-on "narrow-indirect" :git "https://github.com/emacsmirror/narrow-indirect.git")
(depends-on "nginx-mode")
(depends-on "noccur") ; Is a multi-occur on dired files a-la find/grep <https://github.com/nicolaspetton/noccur.el>.
(depends-on "nodejs-repl")
(depends-on "origami")
(depends-on "pacfiles-mode") ; diff/update arch linux pacnew and pacsave files
(depends-on "package-build")
(depends-on "php-mode")
(depends-on "pinentry") ; gnupg password in minibuffer prompt instead of graphical dialog <https://unix.stackexchange.com/questions/55638/can-emacs-use-gpg-agent-in-a-terminal-at-all/278875#278875>
(depends-on "pkgbuild-mode")
(depends-on "projectile")
;; (depends-on "projectile-rails") ; FAIL: Eager macro-expansion failure: (error "Shortdoc f function ‘f-older-p’: bad keyword ‘:noeval’")
(depends-on "protobuf-mode")
(depends-on "quelpa")
(depends-on "quickrun")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; vvv↓vvv Ruby programming language below this line.

;; (depends-on "rbenv")
(depends-on "enh-ruby-mode")
(depends-on "minitest")
(depends-on "multi-compile")
(depends-on "rbtagger") ; ctags via gem-ripper-tags
(depends-on "robe")
(depends-on "rspec-mode")
(depends-on "ruby-guard" :git "https://github.com/zhangkaiyulw/ruby-guard.git")
(depends-on "ruby-hash-syntax")
;(depends-on "ruby-pry" :git "https://github.com/jacott/emacs-pry.git" :files ("*" (:exclude ".git" ".gitignore" "COPYING" "README.md" "TODO"))) ; "Pry support within Emacs"
(depends-on "ruby-refactor")
(depends-on "ruby-tools")

;;; ^^^↑^^^ Ruby programming language above this line.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; vvv↓vvv Rust programming language below this line.

;; (depends-on "racer")
;; (depends-on "flycheck-rust") ; buggy(
(depends-on "rust-mode")

;;; ^^^↑^^^ Rust programming language above this line.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(depends-on "sass-mode")
(depends-on "scss-mode")
(depends-on "simp")
(depends-on "slim-mode")
(depends-on "su") ; automatically read/write files as other users

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; vvv↓vvv Mode line below this line.

;; (depends-on "cyphejor")
;; (depends-on "doom-modeline")
(depends-on "rich-minority")
(depends-on "smart-mode-line")

;;; ^^^↑^^^ Mode line above this line.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(depends-on "rainbow-delimiters")
(depends-on "rainbow-identifiers") ; highlight each variable uniquely based on its name
(depends-on "rainbow-mode")
(depends-on "recentf-ext")
(depends-on "redis")
(depends-on "restclient") ; A-la cURL or [JetBrains HTTP Client](https://plugins.jetbrains.com/plugin/13121-http-client).

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; vvv↓vvv Selectrum mode <https://github.com/radian-software/selectrum> below this line.

;;; DEPRECATED: The original author of Selectrum, @raxod502, now uses Vertico mode <https://github.com/minad/vertico>.~~~~<danil@kutkevich.org>

(depends-on "selectrum") ; a-la ido/ivy/counsel
(depends-on "selectrum-prescient") ; selectrum sorting/filtering
(depends-on "ctrlf") ; a-la isearch replacement?
(depends-on "amx") ; a-la smex is a m-x enhancement

;;; ^^^↑^^^ Selectrum mode <https://github.com/radian-software/selectrum> above this line.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(depends-on "sed-mode")
(depends-on "speed-type")
(depends-on "systemd")
;; (depends-on "tldr")
(depends-on "toml-mode")
(depends-on "top-mode" :git "https://github.com/emacsmirror/top-mode.git")
(depends-on "tramp")
(depends-on "transient") ; FIXME: A nested hotkey definition is a anti-pattern instead must use a best practice and do using the `general.el` because that package provides a more convenient method for binding keys in Emacs. ; Key bindings a-la `hydra`.~~~~<danil@kutkevich.org>
(depends-on "transpose-frame")
;; (depends-on "twittering-mode") ; FAIL: Error: error ("Some dependencies were not available: twittering-mode")
(depends-on "undo-tree")
(depends-on "unicode-troll-stopper")
(depends-on "vimrc-mode")
(depends-on "visual-regexp")
(depends-on "vlf")
(depends-on "web-mode")
(depends-on "window-numbering")
(depends-on "yaml-mode")
(depends-on "yasnippet")
(depends-on "yasnippet-snippets" :git "https://github.com/AndreaCrotti/yasnippet-snippets.git" :files ("*" (:exclude ".git" ".gitignore" ".nosearch" "CONTRIBUTORS.txt" "LICENSE" "README.md" "rename_add_contr.py")))
(depends-on "yasnippets" :git "https://github.com/rejeep/yasnippets.git" :files ("*" (:exclude ".git" ".gitignore" "README.markdown"))) ; "Comprehensive collection of yasnippets"
(depends-on "zig-mode")
(depends-on "ztree")
