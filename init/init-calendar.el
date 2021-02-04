(defgroup init-calendar nil
  "init-calendar"
  :group  'editing
  :tag    "init-calendar"
  :prefix "init-calendar-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defface calendar-iso-week-face
  '((((class color) (min-colors 88) (background light)) :foreground "gray90")
    (((class color) (min-colors 88) (background dark)) :foreground "gray40"))
  "init-calendar"
  :group 'init-calendar)

(defun init-calendar ()
  (if (boundp 'calendar-intermonth-text) (init-calendar--init)
    (with-eval-after-load 'calendar (init-calendar--init))))

(defun init-calendar--init ()
  ;; Week numbers <http://www.emacswiki.org/emacs/CalendarWeekNumbers#toc1>.
  (setq calendar-intermonth-text
        '(propertize
          (format "%2d"
                  (car
                   (calendar-iso-from-absolute
                    (calendar-absolute-from-gregorian (list month day year)))))
          'font-lock-face 'calendar-iso-week-face)))

(provide 'init-calendar)
