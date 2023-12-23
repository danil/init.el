;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

;;; `noccur.el` Is a multi-occur on dired files a-la find/grep <https://github.com/nicolaspetton/noccur.el>.

(defgroup init-replace nil
  "init-replace"
  :group  'editing
  :tag    "init-replace"
  :prefix "init-replace-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-replace-bindings '()
  "Keybindings enabled in `occur-mode'. This is not a keymap.
Rather it is an alist that is converted into a keymap just before `occur-mode'
is (re-)enabled. The keys are strings and the values are command symbols."
  :group 'init-replace
  :type '(alist
          :key-type sexp
          :value-type function))

(defun init-replace ()
  (if (boundp 'occur-mode-map) (init-replace-init)
    (with-eval-after-load 'replace (init-replace-init))))

(defun init-replace-init ()
  (add-hook 'occur-mode-hook (lambda () (setq truncate-lines t))) ; Truncate lines <http://stackoverflow.com/questions/950340/how-do-you-activate-line-wrapping-in-emacs#950406>.
  (add-hook 'occur-hook (lambda () (occur-rename-buffer t))) ; <http://lists.gnu.org/archive/html/emacs-devel/2005-07/msg00411.html>.

  ;; (global-set-key (kbd "M-s o") nil)

  (dolist (b init-replace-bindings)
    (let ((key (car b)) (cmd (cdr b)) (map global-map)) ; occur-mode-map
      (define-key map (kbd key) cmd))))

(provide 'init-replace)
