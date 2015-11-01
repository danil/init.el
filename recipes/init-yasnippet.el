(autoload 'yas-reload-all "yasnippet" nil t)

(my-init--hook
  (yas-reload-all)

  (my-init--after-load 'yasnippet
    ;; How to fix Yasnippet and Autocomplete tab key collision
    ;; <http://sethlakowske.com/why-i-use-emacs/fix-yasnippet-and-autocomplete-tab-key-collision/>.
    (define-key yas-minor-mode-map (kbd "<tab>") nil)
    (define-key yas-minor-mode-map (kbd "TAB") nil)
    ;; Set Yasnippet's key binding to shift+tab
    (define-key yas-minor-mode-map (kbd "<backtab>") 'yas-expand))

  (my-init--add-mode-to-hooks 'yas-minor-mode my-init--programming-modes-hooks))
