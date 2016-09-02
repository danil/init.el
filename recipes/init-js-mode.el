(add-hook 'after-init-hook 'init-js-mode)

(defun init-js-mode ()
  "Init."

  ;; (myinit--add-mode-to-patterns 'js-mode
  ;;                               "\\.htc\\'" ;HTML Components (HTCs or .htc) <http://en.wikipedia.org/wiki/HTML_Components>
  ;;                               )
  (myinit--after-load 'js (setq js-indent-level 2)))
