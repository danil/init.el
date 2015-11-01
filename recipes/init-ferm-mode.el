(autoload 'ferm-mode "ferm-mode" nil t)

(my-init--hook
  (my-init--add-mode-to-patterns 'ferm-mode
                                "/etc/iptables/rules.v[46]"
                                "\\.rules\\'"))
