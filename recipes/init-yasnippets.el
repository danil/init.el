(my-after-init
  (my-eval-after-load 'yasnippet
    (add-to-list 'yas-snippet-dirs
                 (el-get-package-directory "yasnippets"))))
