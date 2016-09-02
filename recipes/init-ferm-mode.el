(autoload 'ferm-mode "ferm-mode" nil t)

(add-hook 'after-init-hook 'init-ferm-mode)

(defun init-ferm-mode ()
  "Init."

  (myinit--add-mode-to-patterns 'ferm-mode
                                "/etc/iptables/rules.v[46]"
                                "\\.rules\\'"))
