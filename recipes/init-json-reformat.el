(autoload 'json-reformat-region "json-reformat" nil t)

(my-init--hook
  (global-set-key (my-kbd "m j j r") 'json-reformat-region))
