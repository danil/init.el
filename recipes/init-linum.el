;;; Linum (line numbers).

(autoload 'linum-mode "linum" nil t)

(add-hook 'after-init-hook 'init-linum)

(defun init-linum ()
  "Init."

  (my-init--add-mode-to-hooks (lambda ()
                          (let ((my-number-of-lines (count-lines (point-min)
                                                                 (point-max))))
                            (if (< my-number-of-lines 20000)
                                (linum-mode t))))
                        (-difference my-init--programming-modes-hooks
                                     '(org-mode-hook text-mode-hook)))

  (my-init--after-load 'linum
    (set-face-foreground 'linum my-line-numbers-foreground)
    (set-face-background 'linum my-line-numbers-background)))
