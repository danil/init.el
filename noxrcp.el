(require 'cl-lib)
(require 'quail)

(defgroup noxrcp nil
  "Easily introduce native modal editing of your own design"
  :group  'editing
  :tag    "Noxrcp"
  :prefix "noxrcp-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

;;;###autoload
(defcustom noxrcp-lighter " Noxrcp"
  "Lightner for `noxrcp-mode'.")

(defcustom noxrcp-cursor-type t
  "Cursor type to use in `noxrcp-mode'.

See description of `cursor-type' for mode information, this
variable should follow the same conventions."
  :tag "Cursor Type"
  :type '(choice
          (const :tag "use the cursor specified for the frame" t)
          (const :tag "don't display a cursor" nil)
          (const :tag "display a filled box cursor" box)
          (const :tag "display a hollow box cursor" hollow)
          (const :tag "display a vertical bar cursor with default width" bar)
          (cons  :tag "display a vertical bar cursor with given width"
                 (const bar) (integer :tag "width of cursor"))
          (const :tag "display a horizontal bar cursor with default height" hbar)
          (cons  :tag "display a horizontal bar cursor with given height"
                 (const hbar (integer :tag "height of cursor")))))

;;;###autoload
(defcustom noxrcp-excluded-modes nil
  "List of major modes for which `noxrcp-mode' should not be activated.

This variable is considered when Noxrcp is enabled globally via
`noxrcp-global-mode'."
  :tag  "Excluded Modes"
  :type '(repeat :tag "Major modes to exclude" symbol))

(defvar noxrcp-mode-map (make-sparse-keymap)
  "This is Noxrcp mode map, used to translate your keys.")

;;;###autoload
(defun noxrcp-define-key (actual-key target-key)
  "Register translation from ACTUAL-KEY to TARGET-KEY."
  (define-key
    noxrcp-mode-map
    actual-key
    `(lambda ()
       (interactive)
       (let ((binding (key-binding ,target-key)))
         (unless (or (memq binding '(nil undefined))
                     (keymapp binding))
           (call-interactively binding))))))

;;;###autoload
(defun noxrcp-define-kbd (actual-kbd target-kbd)
  "Register translation from ACTUAL-KBD to TARGET-KBD.

Arguments are accepted in in the format used for saving keyboard
macros (see `edmacro-mode')."
  (noxrcp-define-key (kbd actual-kbd) (kbd target-kbd)))

;;;###autoload
(defun noxrcp-remove-key (key)
  "Unregister translation from KEY."
  (define-key noxrcp-mode-map key nil))

;;;###autoload
(defun noxrcp-remove-kbd (kbd)
  "Unregister translation from KBD.

Arguments are accepted in in the format used for saving keyboard
macros (see `edmacro-mode')."
  (noxrcp-remove-key (kbd kbd)))

;;;###autoload
(define-minor-mode noxrcp-mode
  "Toggle `noxrcp-mode' minor mode.

With a prefix argument ARG, enable `noxrcp-mode' if ARG is
positive, and disable it otherwise.  If called from Lisp, enable
the mode if ARG is omitted or NIL, and toggle it if ARG is
`toggle'.

This minor mode setups translation of key bindings according to
configuration created previously with `noxrcp-define-key' and
`noxrcp-define-keys'."
  nil noxrcp-lighter noxrcp-mode-map
  (setq-local cursor-type
              (if noxrcp-mode
                  noxrcp-cursor-type
                (default-value 'cursor-type))))

(defun noxrcp-maybe-activate ()
  "Activate `noxrcp-mode' if current buffer is not blacklisted.

This is used by `noxrcp-global-mode'."
  (unless (member major-mode noxrcp-excluded-modes) (noxrcp-mode +1)))

;;;###autoload
(define-globalized-minor-mode noxrcp-global-mode
  noxrcp-mode
  noxrcp-maybe-activate)

(defun noxrcp-input-function-advice (fnc key)
  "Call FNC with KEY as argument only when `noxrcp-mode' is disabled.

Otherwise use `list'."
  (funcall (if noxrcp-mode #'list fnc) key))

(advice-add 'quail-input-method :around #'noxrcp-input-function-advice)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;###autoload
(defcustom noxrcp-auto-completion-modes '()
  "No X recipe auto completion."
  :group 'noxinit)

;;;###autoload
(defcustom noxrcp-read-only-modes '()
  "No X recipe read only modes."
  :group 'noxinit)

;;;###autoload
(defcustom noxrcp-toggle-quotes-modes '()
  "No X recipe ruby tools modes."
  :group 'noxinit)


;;;###autoload
(defcustom noxrcp-auto-completion-modes-hooks '()
  "No X recipe auto completion hooks."
  :group 'noxinit)

;;;###autoload
(defcustom noxrcp-read-only-modes-hooks '()
  "No X recipe read only modes hooks."
  :group 'noxinit)

;;;###autoload
(defcustom noxrcp-toggle-quotes-modes-hooks '()
  "No X recipe ruby tools modes hooks."
  :group 'noxinit)

;; (defmacro my-eval-if-defined-or-after-load (symbol feature &rest body)
;;   "If function SYMBOL definded or variable SYMBOL defined or after
;;  FEATURE is loaded, evaluate BODY."
;;   (declare (indent defun))
;;   ;; (if (or (fboundp 'js-mode-map) (boundp 'js-mode-map))
;;   ;;     (define-key js-mode-map (kbd "C-c C-z") 'nodejs-repl)
;;   ;;   (with-eval-after-load 'js
;;   ;;     (define-key js-mode-map (kbd "C-c C-z") 'nodejs-repl)))
;; )

;;;###autoload
(defun noxrcp-removeme-add-mode-to-patterns (mode &rest patterns)
  "Add entries to `auto-mode-alist' to use `MODE' for all given file `PATTERNS'."

  (dolist (pattern patterns)
    (add-to-list 'auto-mode-alist (cons pattern mode))))


;;;###autoload
(defun noxrcp-removeme-add-mode-to-hooks (mode hooks)
  "Add `MODE' to all given `HOOKS'."
  (dolist (hook hooks) (add-hook hook mode)))


;;;###autoload
(defun noxel-kbd-fn (key)
  "No X recipe key bindings start with \\<<C-v>> follow by `KEY'."
  (kbd (concat "C-v " key)))

;;;###autoload

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'noxrcp)
