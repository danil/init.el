(add-hook 'after-init-hook 'noxrcp-js-mode)

(defun noxrcp-js-mode ()
  "No X recipe init."

  ;; (noxrcp-add-mode-to-patterns 'js-mode
  ;;                               "\\.htc\\'" ;HTML Components (HTCs or .htc) <http://en.wikipedia.org/wiki/HTML_Components>
  ;;                               )
  (if (boundp 'js-indent-level) (init-js-mode-xxxxxxxxxx)
    (with-eval-after-load 'js (init-js-mode-xxxxxxxxxx))))

(defun init-js-mode-xxxxxxxxxx ()
  (setq js-indent-level 2))
