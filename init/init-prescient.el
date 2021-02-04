(defun init-prescient ()
  (autoload 'prescient-persist-mode "prescient" nil t)

  (if (boundp 'selectrum-prescient-mode) (init-prescient--setup)
    (with-eval-after-load 'selectrum-prescient (init-prescient--setup))))

(defun init-prescient--setup ()
  ;; FIXME: maybe use major mode hooks?
  ;; to save your command history on disk, so the sorting gets more
  ;; intelligent over time
  (prescient-persist-mode +1))

(provide 'init-prescient)
