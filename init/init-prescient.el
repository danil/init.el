;;; -*- lexical-binding: t; -*-
;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defun init-prescient ()
  (autoload 'prescient-persist-mode "prescient" nil t)

  (if (boundp 'selectrum-prescient-mode) (init-prescient-init)
    (with-eval-after-load 'selectrum-prescient (init-prescient-init))))

(defun init-prescient-init ()
  ;; FIXME: maybe use major mode hooks?~~~~<danil@kutkevich.org>
  ;; to save your command history on disk, so the sorting gets more
  ;; intelligent over time
  (prescient-persist-mode +1))

(provide 'init-prescient)
