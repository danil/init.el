(add-hook 'after-init-hook 'init-js-mode)

(defun init-js-mode ()
  "Init."

  ;; (my-init--add-mode-to-patterns 'js-mode
  ;;                               "\\.htc\\'" ;HTML Components (HTCs or .htc) <http://en.wikipedia.org/wiki/HTML_Components>
  ;;                               )
  (my-init--after-load 'js (setq js-indent-level 2)))
