;;; Comint mode (which shell mode and sql mode based on)
;;; <http://www.emacswiki.org/emacs/ComintMode#toc3>.

(defun init-comint ()
  (add-hook 'kill-emacs-hook 'init-comint-write-history-each-buffer))

;;; Persistent inferior comint command history
;;; <https://oleksandrmanzyuk.wordpress.com/2011/10/23/a-persistent-command-history-in-emacs/>

(defun init-comint-write-history-each-buffer ()
  "Run `comint-write-input-ring' function on each buffer."

  (init-comint-fn-on-each-buffer 'comint-write-input-ring))

(defun init-comint-fn-on-each-buffer (fn)
  "Run `FN' function on each buffer."

  (mapc (lambda (buffer)
          (with-current-buffer buffer
            (when (and (boundp 'init-comint-with-history)
                       (equal init-comint-with-history t))
              (funcall fn))))

        (buffer-list)))

(defun init-comint-write-history (process event)
  "Write `PROCESS' history to the file on `EVENT'.
Write comint `comint-input-ring' associated with `PROCESS'
to the file on `EVENT'."

  (comint-write-input-ring)
  (let ((buf (process-buffer process)))
    (when (buffer-live-p buf)
      (with-current-buffer buf
        (insert (format "\nProcess %s %s" process event))))))

(defmacro init-comint-create-history-fn (defun-name history-file)
  "Create `DEFUN-NAME' function which assign `HISTORY-FILE' and hook event.
Create function named `DEFUN-NAME' which assign `HISTORY-FILE' to input ring
and assign hook on sentinel event."

  (let ((funsymbol (intern defun-name)))
    `(defun ,funsymbol ()
       (setq init-comint-with-history nil)
       (make-local-variable 'init-comint-with-history)
       (setq init-comint-with-history t)

       (add-hook 'kill-buffer-hook 'comint-write-input-ring)

       (let ((process (get-buffer-process (current-buffer))))
         (when process
           (setq comint-input-ring-file-name ,history-file)
           (comint-read-input-ring)
           (set-process-sentinel process #'init-comint-write-history))))))

(provide 'init-comint)
