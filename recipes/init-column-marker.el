(autoload 'column-marker-1 "column-marker" nil t)

(my-init--hook
  (my-init--add-mode-to-hooks (lambda () (column-marker-1 79))
                         my-init--programming-modes-hooks)

  (my-init--after-load 'column-marker
    (cond ((equal frame-background-mode 'light)
           (set-face-background 'column-marker-1 "gray80"))

          ((equal frame-background-mode 'dark)
           (set-face-background 'column-marker-1 "gray35")))))
