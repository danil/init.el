(autoload 'ferm-mode "ferm-mode" nil t)

(add-hook 'after-init-hook 'noxrcp-ferm-mode)

(defun noxrcp-ferm-mode ()
  "No X recipe init."

  (noxrcp-add-mode-to-patterns 'ferm-mode
                                "/etc/iptables/rules.v[46]"
                                "\\.rules\\'"))
