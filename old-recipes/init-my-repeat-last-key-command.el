;;; Setting key with repeat
;;; <http://stackoverflow.com/questions/7560094/two-key-shortcut-in-emacs-without-repressing-the-first-key#7560416>.
(defmacro my-with-repeat-while-press-last-key (&rest body)
  "Execute BODY and repeat while the user presses the last key."
  (declare (indent 0))
  `(let* ((repeat-key (and (> (length (this-single-command-keys)) 1)
                           last-input-event))
          (repeat-key-str (format-kbd-macro (vector repeat-key) nil)))
     ,@body
     (while repeat-key
       (message "Type %s to repeat again" repeat-key-str)
       (let ((event (read-event)))
         (clear-this-command-keys t)
         (if (equal event repeat-key)
             (progn ,@body
                    (setq last-input-event nil))
           (setq repeat-key nil)
           (push last-input-event unread-command-events))))))
