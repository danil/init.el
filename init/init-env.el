;;; -*- lexical-binding: t; -*-
(require 'subr-x)

(defun init-env-dotenv-parse-value (value)
  "Parse an .env VALUE string.
Remove surrounding quotes and trailing inline comments when possible."
  (let ((v (string-trim value)))
    (cond
     ;; Double quoted value: "something"
     ((string-match "^\"\\([^\"]*\\)\"" v)
      (match-string 1 v))

     ;; Single quoted value: 'something'
     ((string-match "^'\\([^']*\\)'" v)
      (match-string 1 v))

     ;; Unquoted value: strip inline comment if it starts after whitespace
     (t
      (if (string-match "[ \t]+#" v)
          (string-trim (substring v 0 (match-beginning 0)))
        v)))))

(defun init-env-dotenv-setenv-from-region (start end)
  "Set environment variables from the active region.
The region should contain lines in .env format.

Supported examples:
  KEY=value
  export KEY=value
  KEY=\"quoted value\"
  # comment

Blank lines and comment lines are ignored."
  (interactive "r")
  (unless (use-region-p)
    (user-error "No active region"))

  (let ((lines (split-string
                (buffer-substring-no-properties start end)
                "\r?\n"))
        (set-vars nil)
        (invalid-lines 0))

    (dolist (line lines)
      (let ((trimmed (string-trim line)))
        (unless (or (string-empty-p trimmed)
                    (string-prefix-p "#" trimmed))

          ;; Remove optional leading "export "
          (let* ((normalized
                  (if (string-prefix-p "export " trimmed)
                      (string-trim (substring trimmed (length "export ")))
                    trimmed))
                 (eq-pos (string-match "=" normalized)))

            (if (and eq-pos (> eq-pos 0))
                (let ((key
                       (string-trim
                        (substring normalized 0 eq-pos)))
                      (value
                       (init-env-dotenv-parse-value
                        (substring normalized (1+ eq-pos)))))

                  (if (string-match-p "^[A-Za-z_][A-Za-z0-9_]*$" key)
                      (progn
                        (setenv key value)
                        (push key set-vars))
                    (setq invalid-lines (1+ invalid-lines))))

              (setq invalid-lines (1+ invalid-lines)))))))

    (message "Set %d environment variable(s)%s"
             (length set-vars)
             (if (> invalid-lines 0)
                 (format ", skipped %d invalid line(s)" invalid-lines)
               ""))))

(provide 'init-env)
