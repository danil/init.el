(defgroup init-selectrum nil
  "init-selectrum"
  :group  'editing
  :tag    "init-selectrum"
  :prefix "init-selectrum-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-selectrum-mode-lighter " init-selectrum" "init-selectrum" :group 'init-selectrum)

(defvar init-selectrum-mode-map (make-sparse-keymap) "init-selectrum")

(define-minor-mode init-selectrum-mode "init-selectrum" nil init-selectrum-mode-lighter init-selectrum-mode-map
  (init-selectrum-setup))

(define-globalized-minor-mode init-global-selectrum-mode init-selectrum-mode
  (lambda () (init-selectrum-mode +1)))

(defun init-selectrum ()
  (selectrum-mode +1)

  (if (boundp 'selectrum-minibuffer-map) (init-selectrum--init)
    (with-eval-after-load 'selectrum (init-selectrum--init))))

(defun init-selectrum-setup ()
  (define-key init-selectrum-mode-map (kbd "C-x C-r") 'init-selectrum-recentf)
  (define-key init-selectrum-mode-map (kbd "C-c C-r") #'selectrum-repeat))

(defun init-selectrum--init ()
  (interactive)
  (define-key selectrum-minibuffer-map (kbd "C-j") nil)
  (define-key selectrum-minibuffer-map (kbd "C-c C-j") #'selectrum-submit-exact-input))

;; <https://github.com/raxod502/selectrum/wiki/Useful-Commands#switch-to-recent-file>
(defun init-selectrum-recentf ()
  "Use `completing-read' to open a recent file."
  (interactive)
  (let ((selectrum-should-sort-p nil))
    ;; (let ((files (mapcar 'abbreviate-file-name recentf-list)))
    ;;   (find-file (completing-read "Recentf: " files nil t)))
    (find-file (completing-read "Recentf: " recentf-list nil t))))

;; Yank kill ring
;; <https://github.com/raxod502/selectrum/wiki/Useful-Commands#my-yank-pop>,
;; <https://www.gnu.org/software/emacs/manual/html_node/eintr/yank.html>
(defun init-selectrum-yank-pop (&optional arg)
  "Paste a previously killed string.
With just \\[universal-argument] as ARG, put point at beginning,
and mark at end.  Otherwise, put point at the end, and mark at
the beginning without activating it.

This is like `yank-pop'.  The differences are:

- This let you manually choose a candidate to paste.

- This doesn't delete the text just pasted if the previous
  command is `yank'."
  (interactive "P")
  (let* ((selectrum-should-sort-p nil)
         (text nil))
    (setq text
          (completing-read "Yank: "
                           (cl-remove-duplicates
                            kill-ring :test #'equal :from-end t)
                           nil 'require-match))
    (unless (eq last-command 'yank)
      (push-mark))
    (setq last-command 'yank)
    (setq yank-window-start (window-start))
    (when (and delete-selection-mode (use-region-p))
      (delete-region (region-beginning) (region-end)))
    (insert-for-yank text)
    (if (consp arg)
        (goto-char (prog1 (mark t)
                     (set-marker (mark-marker) (point) (current-buffer)))))))

(defun init-selectrum-company ()
  "Complete using `company-candidates'."
  (interactive)

  (let* ((selectrum-should-sort-p nil)
         (text nil)
         (initial-input (init-company-grab-symbol)))

    (unless company-candidates (company-complete))
    (when (and company-candidates company-point)
      (setq text
            (selectrum-read "Candidates: " company-candidates
                            :initial-input initial-input))
      (init-selectrum-completion-in-region-action text))))

(defun init-selectrum-completion-in-region-action (str)
  "Insert STR, erasing the previous one.
The previous string is between `completion-beg' and `completion-end'."
  (let ((completion-beg (if (symbol-at-point) (beginning-of-thing 'symbol) (point)))
        (completion-end (if (symbol-at-point) (end-of-thing 'symbol) (point))))
    (when (consp str)
      (setq str (cdr str)))
    (when (stringp str)
      (let ((fake-cursors (and (require 'multiple-cursors-core nil t)
                               (mc/all-fake-cursors)))
            (pt (point))
            (beg completion-beg)
            (end completion-end))
        (when beg
          (delete-region beg end))
        (setq completion-beg (point))
        (insert (substring-no-properties str))
        (completion--done str 'exact)
        (setq completion-end (point))
        (save-excursion
          (dolist (cursor fake-cursors)
            (goto-char (overlay-start cursor))
            (delete-region (+ (point) (- beg pt))
                           (+ (point) (- end pt)))
            (insert (substring-no-properties str))
            ;; manually move the fake cursor
            (move-overlay cursor (point) (1+ (point)))
            (set-marker (overlay-get cursor 'point) (point))
            (set-marker (overlay-get cursor 'mark) (point))))))))

(defun init-selectrum-completing-read (&optional arg)
  (interactive "P")
  (let* ((selectrum-should-sort-p nil)
         (text nil))
    (setq text
          (completing-read "Yank: "
                           (cl-remove-duplicates
                            kill-ring :test #'equal :from-end t)
                           nil 'require-match))
    (unless (eq last-command 'yank)
      (push-mark))
    (setq last-command 'yank)
    (setq yank-window-start (window-start))
    (when (and delete-selection-mode (use-region-p))
      (delete-region (region-beginning) (region-end)))
    (insert-for-yank text)
    (if (consp arg)
        (goto-char (prog1 (mark t)
                     (set-marker (mark-marker) (point) (current-buffer)))))))

(defun init-selectrum-unsorted-read (prompt choices)
  (let ((selectrum-should-sort-p nil))
    (completing-read prompt choices)))

;; Handle completion order for refs in magit with prescient
;; https://github.com/raxod502/selectrum/wiki/Additional-Configuration#handle-completion-order-for-refs-in-magit-with-prescient
(define-advice magit-list-refs (:around (orig &optional namespaces format sortby)
                                        prescient-sort)
  "Apply prescient sorting when listing refs."
  (let ((res (funcall orig namespaces format sortby)))
    (if (or sortby magit-list-refs-sortby (not selectrum-should-sort-p))
        res
      (prescient-sort res))))

(provide 'init-selectrum)
