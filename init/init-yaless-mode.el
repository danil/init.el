;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defgroup init-yaless-mode nil
  "init-yaless-mode"
  :group  'editing
  :tag    "init-yaless-mode"
  :prefix "init-yaless-mode-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defun yaless-stub ()
  (interactive)

  (let* ((continue t)
         (keys '("j" "k" "h" "l" "n" "p" "u" "d" "0" "^" "$" "g" "G")))

    (while continue
      (message "Scroll: j k u d; move: h l n p; line begin/end: 0 ^ $; buffer begin/end: g G")

      (let* ((event (read-event))
             (key (format-kbd-macro (vector event) nil)))
        (clear-this-command-keys t)

        (if (member key keys)
            (progn
              (cond ((equal key "j") (condition-case nil (scroll-up-line) (end-of-buffer)))
                    ((equal key "k") (condition-case nil (scroll-down-line) (beginning-of-buffer)))
                    ((equal key "u") (condition-case nil (scroll-down) (beginning-of-buffer)))
                    ((equal key "d") (condition-case nil (scroll-up) (end-of-buffer)))

                    ((equal key "h") (backward-char))
                    ((equal key "l") (forward-char))
                    ((equal key "n") (next-line))
                    ((equal key "p") (previous-line))

                    ((equal key "0") (beginning-of-line))
                    ((equal key "^") (beginning-of-line-text))
                    ((equal key "$") (call-interactively 'move-end-of-line))

                    ((equal key "g") (beginning-of-buffer))
                    ((equal key "G") (end-of-buffer)))

              (setq last-input-event nil))

          (setq continue nil)
          (push last-input-event unread-command-events))))))

(provide 'init-yaless-mode)
