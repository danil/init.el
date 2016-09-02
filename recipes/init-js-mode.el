(add-hook 'after-init-hook 'myinit-js-mode)

(defun myinit-js-mode ()
  "My init."

  ;; (myinit-add-mode-to-patterns 'js-mode
  ;;                               "\\.htc\\'" ;HTML Components (HTCs or .htc) <http://en.wikipedia.org/wiki/HTML_Components>
  ;;                               )
  (myinit-after-load 'js (setq js-indent-level 2)))
