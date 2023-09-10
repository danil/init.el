;; alpha bravo charlie delta echo foxtrot golf hotel india juliet kilo lima mike november oscar papa quebec romeo sierra tango uniform victor whiskey x-ray yankee zulu

(defgroup init-find-temp-file-mode nil
  "init-find-temp-file-mode"
  :group  'editing
  :tag    "init-find-temp-file-mode"
  :prefix "init-find-temp-file-mode-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-find-temp-file-mode-lighter " init-find-temp-file-mode" "init-find-temp-file-mode" :group 'init-find-temp-file-mode)

(defcustom init-find-temp-file-mode-bindings '()
  "Keybindings enabled in `init-find-temp-file-mode'. This is not a keymap.
Rather it is an alist that is converted into a keymap just before `init-find-temp-file-mode'
is (re-)enabled. The keys are strings and the values are command symbols."
  :group 'init-find-temp-file-mode
  :type '(alist
          :key-type sexp
          :value-type function))

(defcustom init-find-temp-file-mode-extension-functions '()
  "Callback functions."
  :group 'init-find-temp-file-mode)

(defvar init-find-temp-file-mode-map (make-sparse-keymap)
  "Keymap for `init-find-temp-file-mode'. Populated when mode is enabled.
See `init-find-temp-file-mode-bindings'.")

(define-minor-mode init-find-temp-file-mode "init-find-temp-file-mode" :init-value nil :lighter init-find-temp-file-mode-lighter :keymap init-find-temp-file-mode-map
  (init-find-temp-file-mode-setup))

(define-globalized-minor-mode init-global-find-temp-file-mode init-find-temp-file-mode
  (lambda () (init-find-temp-file-mode +1)))

(defun init-global-find-temp-file-mode-on () (init-global-find-temp-file-mode +1))

(defun init-find-temp-file-mode-setup ()
  (if (boundp 'find-temp-file-keymap) (init-find-temp-file-monkeypatch-setup)
    (with-eval-after-load 'find-temp-file (init-find-temp-file-monkeypatch-setup)))

  (dolist (b init-find-temp-file-mode-bindings)
    (let ((key (car b)) (cmd (cdr b)) (map init-find-temp-file-mode-map))
      (define-key map (kbd key) cmd))))

(defun init-find-temp-file-go (file-path)
  (let* ((directory-path (file-name-directory file-path))
         (module-name (file-name-base (directory-file-name directory-path)))
         (go-mod-text (format "module %s\n" module-name))
         (go-mod-path (concat directory-path "go.mod")))
    (write-region go-mod-text nil go-mod-path)))

(defun init-find-temp-file-monkeypatch-setup ()
  (fset 'find-temp-file (symbol-function 'init-find-temp-file-monkeypatch)))

(defun init-find-temp-file-monkeypatch (extension)
  "Open a temporary file.

EXTENSION is the extension of the temporary file. If EXTENSION
contains a dot, use EXTENSION as the full file name."
  (interactive
   (let* ((default (concat (if buffer-file-name
                               (file-name-extension
                                buffer-file-name))))
          (default-prompt (if (equal default "") ""
                            (format " (%s)" default)))
          choice)
     (setq choice (read-from-minibuffer
                   (format "Extension%s: " default-prompt)
                   nil
                   find-temp-file-keymap))
     (list (if (equal "" choice)
               default
             choice))))
  (setq extension (or extension ""))
  (let ((file-path (find-temp-file--filename extension)))
    (make-directory (file-name-directory file-path) :parents)
    (if find-temp-add-to-history
        (add-to-history 'file-name-history (file-name-directory file-path)))
    (find-file file-path)
    (let ((fn (cdr (assoc extension init-find-temp-file-mode-extension-functions))))
      (when (fboundp fn) (funcall fn file-path))))
  (basic-save-buffer))

(provide 'init-find-temp-file-mode)
