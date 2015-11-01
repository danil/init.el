(autoload 'nvm-use "nvm" nil t)
(autoload 'nvm-use-for "nvm" nil t)

(my-init--hook
  ;; (nvm-use "0.11")

  ;; Use Node.js version from ~/.nvmrc
  (nvm-use-for))
