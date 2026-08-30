;;; -*- lexical-binding: t; -*-
;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

;;; FIXME: Insaned nested hook.~~~~<danil@kutkevich.org>

(defun init-diredfl ()
  (if (boundp 'dired-after-readin-hook) (init-diredfl-lazy-init)
    (with-eval-after-load 'dired (init-diredfl-lazy-init))))

(defun init-diredfl-lazy-init ()
  (init-lazy (/ init-lazy-seconds 2) nil 'require 'diredfl)
  (add-hook 'dired-after-readin-hook 'init-diredfl--lazy-init))

(defun init-diredfl--lazy-init ()
  (remove-hook 'dired-after-readin-hook 'init-diredfl-lazy-init)
  (init-lazy init-lazy-seconds nil 'init-diredfl---lazy-init))

(defun init-diredfl---lazy-init ()
  "Run `diredfl'."
  (diredfl-mode)
  (add-hook 'dired-after-readin-hook 'diredfl-mode))

(provide 'init-diredfl)
