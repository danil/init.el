;;; -*- lexical-binding: t; -*-
;;; TODO: Move this recipe file to init!!!~~~~<danil@kutkevich.org>

(defun init-transpose-frame ()
  (interactive)

  (let* ((one-more-repeat t)
         (keynames '("SPC" "j" "k" "RET" "h" "l")))

    (while one-more-repeat
      (message "transpose: SPC; flip/flop: j k, rotate 180°: RET, 90°: h, -90°: l")

      (let* ((event (read-event))
             (keyname (format-kbd-macro (vector event) nil)))
        (clear-this-command-keys t)

        (if (member keyname keynames)
            (progn

              (cond ((equal keyname "SPC") (transpose-frame)) ;Transpose windows arrangement at FRAME. Omitting FRAME means currently selected frame.
                    ((equal keyname "j") (flip-frame)) ;Flip windows arrangement vertically at FRAME. Omitting FRAME means currently selected frame.
                    ((equal keyname "k") (flop-frame)) ;Flop windows arrangement horizontally at FRAME. Omitting FRAME means currently selected frame.
                    ((equal keyname "RET") (rotate-frame)) ;Rotate windows arrangement 180 degrees at FRAME. Omitting FRAME means currently selected frame.
                    ((equal keyname "h") (rotate-frame-clockwise)) ;Rotate windows arrangement 90 degrees clockwise at FRAME. Omitting FRAME means currently selected frame.
                    ((equal keyname "l") (rotate-frame-anticlockwise)) ;Rotate windows arrangement 90 degrees anti-clockwise at FRAME. Omitting FRAME means currently selected frame.
                    )

              (setq last-input-event nil))

          (setq one-more-repeat nil)
          (push last-input-event unread-command-events))))))
