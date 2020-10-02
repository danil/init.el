(add-hook 'after-init-hook 'noxrcp-js-mode)

(defun noxrcp-js-mode ()
  "No X recipe init."

  ;; (noxrcp-add-mode-to-patterns 'js-mode
  ;;                               "\\.htc\\'" ;HTML Components (HTCs or .htc) <http://en.wikipedia.org/wiki/HTML_Components>
  ;;                               )
  (noxrcp-after-load 'js (setq js-indent-level 2)))
