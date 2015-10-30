;;; Linum (line numbers).

(autoload 'linum-mode "linum" nil t)

(my-after-init
  (my-add-mode-to-hooks (lambda ()
                          (let ((my-number-of-lines (count-lines (point-min)
                                                                 (point-max))))
                            (if (< my-number-of-lines 20000)
                                (linum-mode t))))
                        (-difference my-programming-modes-hooks
                                     '(org-mode-hook text-mode-hook)))

  (my-eval-after-load 'linum
    (set-face-foreground 'linum my-line-numbers-foreground)
    (set-face-background 'linum my-line-numbers-background)))
