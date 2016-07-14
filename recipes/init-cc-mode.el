(add-hook 'after-init-hook 'init-cc-mode)

(defun init-cc-mode ()
  "Init."

  (my-init--add-mode-to-patterns 'c-mode
                                "/etc/portage/savedconfig/www-servers/quark"
                                "/etc/portage/savedconfig/x11-misc/dmenu"
                                "/etc/portage/savedconfig/x11-misc/tabbed"
                                "/etc/portage/savedconfig/x11-terms/st"
                                "/etc/portage/savedconfig/x11-wm/dwm"))
