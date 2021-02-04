(defgroup init-bytecomp nil
  "init-bytecomp"
  :group  'editing
  :tag    "init-bytecomp"
  :prefix "init-bytecomp-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-bytecomp-mode-map-prefix "C-v " "init-bytecomp" :group 'init-bytecomp)

(defun init-bytecomp ()
  (if (boundp 'emacs-lisp-mode-map) (init-bytecomp--init)
    (with-eval-after-load 'elisp-mode (init-bytecomp--init))))

(defun init-bytecomp--init ()
  (let ((map emacs-lisp-mode-map)
        (prfx init-bytecomp-mode-map-prefix))
    (define-key map (kbd (concat prfx " ! f")) 'byte-compile-file)))

(provide 'init-bytecomp)
