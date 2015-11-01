(autoload 'window-numbering-mode "window-numbering"
  "Numbered window shortcuts" t)

(my-init--hook
  (my-init--after-load 'window-numbering
    ;; ;; <http://blog.binchen.org/?p=512#sec-1>.
    ;; (custom-set-faces
    ;;  '(window-numbering-face
    ;;    ((t (:foreground "brightmagenta" :background nil :weight normal :underline nil)))))

    (global-set-key (my-kbd "0") 'select-window-0)
    (global-set-key (my-kbd "1") 'select-window-1)
    (global-set-key (my-kbd "2") 'select-window-2)
    (global-set-key (my-kbd "3") 'select-window-3)
    (global-set-key (my-kbd "4") 'select-window-4)
    (global-set-key (my-kbd "5") 'select-window-5)
    (global-set-key (my-kbd "6") 'select-window-6)
    (global-set-key (my-kbd "7") 'select-window-7)
    (global-set-key (my-kbd "8") 'select-window-8)
    (global-set-key (my-kbd "9") 'select-window-9))

  (window-numbering-mode)

  (custom-set-variables '(window-numbering-format "%s ")))
