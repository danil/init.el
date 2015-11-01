;;; Hide Show minor mode <http://www.emacswiki.org/emacs/HideShow>.
(my-init--hook
  (my-init--add-mode-to-hooks 'hs-minor-mode '(ruby-mode-hook))

  (my-init--after-load 'hs-minor-mode
    ;; (define-key hs-minor-mode-map (kbd \"TAB\") 'hs-toggle-hiding)

    ;; Folding Ruby code (hide show minor mode).
    (add-to-list 'hs-special-modes-alist
                 '(ruby-mode
                   "\\(def\\|do\\|{\\)" "\\(end\\|end\\|}\\)" "#"
                   (lambda (arg) (ruby-end-of-block)) nil))))
