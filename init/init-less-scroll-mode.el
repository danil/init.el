;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defgroup init-less-scroll-mode nil
  "init-less-scroll-mode"
  :group  'editing
  :tag    "init-less-scroll-mode"
  :prefix "init-less-scroll-mode-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defun less-scroll-stub ()
  (interactive)

  (let* ((continue t)
         (keys '("j" "k" "h" "l" "u" "d" "b" "p" "n" "f" "0" "^" "$" "g" "G")))

    (while continue
      (message (concat " Less "
                       (propertize "SCROLL" 'face '((:background "blue" :foreground "white")))
                       ":hjkl PAGE/UP|DOWN:ud MOVE:bnpf LINE/BEGIN|END:0^$ BUFFER/BEGIN|END:gG"))

      (let* ((event (read-event))
             (key (format-kbd-macro (vector event) nil)))
        (clear-this-command-keys t)

        (if (member key keys)
            (progn
              (cond ((equal key "h") (scroll-right 1))
                    ((equal key "j") (condition-case nil (scroll-up-line) (end-of-buffer)))
                    ((equal key "k") (condition-case nil (scroll-down-line) (beginning-of-buffer)))
                    ((equal key "l") (scroll-left 1))

                    ((equal key "u") (condition-case nil (scroll-down) (beginning-of-buffer)))
                    ((equal key "d") (condition-case nil (scroll-up) (end-of-buffer)))

                    ((equal key "b") (backward-char))
                    ((equal key "p") (previous-line))
                    ((equal key "n") (next-line))
                    ((equal key "f") (forward-char))

                    ((equal key "0") (beginning-of-line))
                    ((equal key "^") (beginning-of-line-text))
                    ((equal key "$") (call-interactively 'move-end-of-line))

                    ((equal key "g") (beginning-of-buffer))
                    ((equal key "G") (end-of-buffer)))

              (setq last-input-event nil))

          (setq continue nil)
          (push last-input-event unread-command-events))))))

(provide 'init-less-scroll-mode)
