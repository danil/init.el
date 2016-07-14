(custom-set-variables '(rainbow-html-colors-major-mode-list '(css-mode
                                                              html-mode
                                                              less-css-mode
                                                              nxml-mode
                                                              php-mode
                                                              sass-mode
                                                              scss-mode
                                                              xml-mode)))

(add-hook 'after-init-hook 'init-rainbow-mode)

(defun init-rainbow-mode ()
  "Init."

  (my-init--add-mode-to-hooks (lambda () (rainbow-mode t)) '(css-mode-hook
                                                  less-css-mode-hook
                                                  nxml-mode-hook
                                                  php-mode-hook
                                                  sass-mode-hook
                                                  scss-mode
                                                  web-mode-hook
                                                  xml-mode-hook)))
