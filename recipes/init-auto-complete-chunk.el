;; (my-init--hook
;;   (my-init--after-load 'auto-complete-config
;;     (my-init--add-mode-to-hooks (lambda ()
;;                             ;; Make sure `ac-source-chunk-list' comes first.
;;                             (setq ac-sources (append '(ac-source-chunk-list) ac-sources))
;;                             ;; (setq ac-chunk-list
;;                             ;;       '("os.path.abspath" "os.path.altsep" "os.path.basename"))
;;                             )
;;                            '(python-mode-hook
;;                              ruby-mode-hook))))
