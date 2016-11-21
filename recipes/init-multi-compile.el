;;; init-multi-compile.el --- This file is part of Danil <danil@kutkevich.org> home.

;; Copyright (C) 2016 Danil <danil@kutkevich.org>.
;; Author: Danil <danil@kutkevich.org>
;; Maintainer: Danil <danil@kutkevich.org>
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

;;; <https://github.com/ReanGD/emacs-multi-compile#sample-configuration>.
(custom-set-variables
 '(multi-compile-alist
   '(("/Cask\\'" . (("cask outdated" . "cd %dir && cask --verbose outdated")
                    ("cask install" . "cd %dir && cask --verbose install")
                    ("cask update" . "cd %dir && cask --verbose update")))
     (go-mode . (("go build" . "go build -v -x ./")
                 ("go clean" . "go clean ./...")
                 ("go get" . "go get -v ./...")
                 ("go run" . "go run -v %file-name")
                 ("go test" . "go clean ./... && go vet ./... && errcheck -verbose -asserts ./... && unconvert -v . && golint -set_exit_status ./... && gocyclo -over 25 ./ && ineffassign ./ && misspell -error ./* ./*/* ./*/*/* ./*/*/*/* ./*/*/*/*/* ./*/*/*/*/*/* ./*/*/*/*/*/*/* && go test -v -bench=./... ./...")))
     (makefile-mode . (("make" . "make")
                       ("make --jobs=9" . "make --jobs=5")
                       ("make install" . "make install")
                       ("make clean" . "make clean")))
     (makefile-gmake-mode . (("make" . "make")
                             ("make --jobs=9" . "make --jobs=5")
                             ("make install" . "make install")
                             ("make clean" . "make clean")))
     (ruby-mode . (("rspec" . "bundle exec rspec")
                   ("rake db:migrate" . "bundle exec rake db:migrate")
                   ("rake db:migrate RAILS_ENV=test" . "bundle exec rake db:migrate RAILS_ENV=test")
                   ("rake db:rollback" . "bundle exec rake db:rollback")
                   ("rake db:rollback RAILS_ENV=test" . "bundle exec rake db:rollback RAILS_ENV=test")
                   ("bundle install" . "bundle install")
                   ("bundle outdated" . "bundle outdated")
                   ("bundle update" . "bundle update")))
     (rust-mode . (("rustc" . "rustc %path")
                   ;; ("rust debug" . "cargo run")
                   ;; ("rust release" . "cargo run --release")
                   ;; ("rust test" . "cargo test")
                   )))))

(add-hook 'after-init-hook 'myinit-multi-compile)

(defun myinit-multi-compile ()
  "My init."

  (define-key myinit-map (kbd "! m") 'multi-compile-run))

;;; init-multi-compile.el ends here
