(autoload 'ferm-mode "ferm-mode" nil t)

(add-hook 'after-init-hook 'myinit-ferm-mode)

(defun myinit-ferm-mode ()
  "My init."

  (myinit-add-mode-to-patterns 'ferm-mode
                                "/etc/iptables/rules.v[46]"
                                "\\.rules\\'"))
