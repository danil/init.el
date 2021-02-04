(defgroup init-company nil
  "init-company"
  :group  'editing
  :tag    "init-company"
  :prefix "init-company-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-company-mode-lighter " init-company" "init-company" :group 'init-company)

(defcustom init-company-completing-read-function 'init-counsel-company ; init-company.el:
  "No X custom variable for the company completing read function."
  :group 'init-company)

(defvar init-company-mode-map (make-sparse-keymap) "init-company")

(define-minor-mode init-company-mode "init-company" nil init-company-mode-lighter init-company-mode-map
  (init-company-setup))

(define-globalized-minor-mode init-global-company-mode init-company-mode
  (lambda () (init-company-mode +1)))

(defun init-company () (global-company-mode +1))

(defun init-company-setup ()
  (define-key init-company-mode-map [?\C-\M-i] 'init-company-completing-read)) ;; counsel-company completion-at-point)

(defun init-company-completing-read ()
  (interactive)
  (company-mode t)
  (when current-prefix-arg (make-local-variable 'company-backends))
  (cond ((equal current-prefix-arg 2)
         (init-company-complete-with-backend 'company-capf))
        ((equal current-prefix-arg 3)
         (init-company-complete-with-backend 'company-abbrev))
        ((equal current-prefix-arg 4)
         (init-company-complete-with-backend 'company-files))
        ((equal current-prefix-arg 7)
         (init-company-complete-with-backend 'company-dabbrev-code))
        ((equal current-prefix-arg 8)
         (init-company-complete-with-backend 'company-dabbrev))
        (current-prefix-arg
         (init-company-complete-with-backend 'company-ispell)))
  (call-interactively init-company-completing-read-function))

(defun init-company-complete-with-backend (new-backend)
  (let ((old-company-backends company-backends))
    (set 'company-backends (cons new-backend '()))
    (company-complete)
    (set 'company-backends old-company-backends)))

(defun init-company-grab-symbol ()
  "If point is at the end of a symbol, return it.
Otherwise, if point is not inside a symbol, return an empty string."
  (buffer-substring (point)
                    (save-excursion (skip-syntax-backward "w_") (point))))

(defun init-company-message-used-backend ()
  (interactive)
  (message "Company backend: %s"
           (pp-to-string (init-company-used-backend))))

(defun init-company-used-backend ()
  (interactive)
  (let* ((bb company-backends)
         backend
         (prefix (cl-loop for b in bb
                          thereis (let ((company-backend b))
                                    (setq backend b)
                                    (company-call-backend 'prefix)))))
    backend))

(provide 'init-company)
