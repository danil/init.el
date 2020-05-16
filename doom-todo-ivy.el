;;; doom-todo-ivy.el --- Display TODO, FIXME, etc in an Ivy buffer. -*- lexical-binding: t; -*-

;; Copyright (C) 2018 Justin Smestad

;; Author: Justin Smestad <justin.smestad@gmail.com>
;; Homepage: https://github.com/jsmestad/doom-todo-ivy
;; Version: 0.1.1
;; Package-Requires: ((emacs "25.1") (projectile "0.10.0") (ivy))
;; Keywords:

;;; Commentary:
;;;
;;; This is a straight port of the version supplied with Doom Emacs.

;;; Code:

(require 'projectile)
(require 'ivy)

(defvar doom/ivy-buffer-icons nil
  "If non-nil, show buffer mode icons in `ivy-switch-buffer' and the like.")

(defvar doom/ivy-todo-tags
  '(("TODO"  . warning)
    ("FIXME" . error))
  "An list of tags for `doom/ivy-todos' to search for.")


(defun doom/ivy--todos-candidates (todos)
  "Generate a list of todo candidates from TODOS."
  (let* ((max-type-width
          (cl-loop for todo in doom/ivy-todo-tags maximize (length (car todo))))
         (max-desc-width
          (cl-loop for todo in todos maximize (length (cl-cdadr todo))))
         (max-width (max (- (frame-width) (1+ max-type-width) max-desc-width)
                         25)))
    (cl-loop
     with fmt = (format "%%-%ds %%-%ds%%s%%s:%%s" max-type-width max-width)
     for alist in todos
     collect
     (let-alist alist
       (format fmt
               (propertize .type 'face (cdr (assoc .type doom/ivy-todo-tags)))
               (substring .desc 0 (min max-desc-width (length .desc)))
               (propertize " | " 'face 'font-lock-comment-face)
               (propertize (abbreviate-file-name .file) 'face 'font-lock-keyword-face)
               (propertize .line 'face 'font-lock-constant-face))))))

(defun doom/ivy--todos (target)
  "Search TARGET for a list of todos."
  (let* (case-fold-search
         (todo-tags (mapcar #'car doom/ivy-todo-tags))
         (cmd
          (format "%s -H -S --no-heading -- %s %s"
                  (or (when-let* ((bin (executable-find "rg")))
                        (concat bin " --line-number"))
                      (when-let* ((bin (executable-find "ag")))
                        (concat bin " --numbers"))
                      (error "Cannot find executables: ripgrep or the_silver_searcher"))
                  (shell-quote-argument
                   (concat "\\s("
                           (string-join todo-tags "|")
                           ")([\\s:]|\\([^)]+\\):?)"))
                  target)))
    (save-match-data
      (cl-loop with out = (shell-command-to-string cmd)
               for x in (and out (split-string out "\n" t))
               when (condition-case-unless-debug ex
                        (string-match
                         (concat "^\\([^:]+\\):\\([0-9]+\\):.+\\("
                                 (string-join todo-tags "\\|")
                                 "\\):?\\s-*\\(.+\\)")
                         x)
                      (error
                       (message "Error matching todo in file: (%s) %s"
                                (error-message-string ex)
                                (car (split-string x ":")))
                       nil))
               collect `((type . ,(match-string 3 x))
                         (desc . ,(match-string 4 x))
                         (file . ,(match-string 1 x))
                         (line . ,(match-string 2 x)))))))


(defun doom/ivy--todos-open-action (x)
  "Jump to the file X and line of the current todo."
  (let ((location (cadr (split-string x " | ")))
        (type (car (split-string x " "))))
    (cl-destructuring-bind (file line) (split-string location ":")
      (with-ivy-window
        (find-file (expand-file-name file (projectile-project-root)))
        (goto-char (point-min))
        (forward-line (1- (string-to-number line)))
        (search-forward type (line-end-position) t)
        (backward-char (length type))
        (recenter)))))

;;;###autoload
(defun doom/ivy-todos (&optional arg)
  "Search through all TODO/FIXME tags in the current project. Optional ARG will search only that file."
  (interactive "P")
  (ivy-read (format "Todos (%s): "
                    (if arg
                        (concat "in: " (file-relative-name buffer-file-name))
                      "project"))
            (doom/ivy--todos-candidates
             (doom/ivy--todos (if arg buffer-file-name (projectile-project-root))))
            :action #'doom/ivy--todos-open-action
            :caller 'doom/ivy-todos))

(provide 'doom-todo-ivy)

;;; doom-todo-ivy.el ends here
