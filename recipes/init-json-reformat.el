(autoload 'json-reformat-region "json-reformat" nil t)

(my-after-init
  (global-set-key (my-kbd "m j j r") 'json-reformat-region))