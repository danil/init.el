;;; <http://stackoverflow.com/questions/13397737/ansi-coloring-in-compilation-mode#20788581>.
(defun init-ansi-color ()
  (require 'ansi-color)

  ;; AnsiColor (Emacs terminal related stuff)
  ;; <http://emacswiki.org/AnsiColor>.
  (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
  ;; (add-hook 'shell-mode-hook 'compilation-shell-minor-mode) ;filenames with line numbers linkable

  ;; ANSI SGR (Select Graphic Rendition) escape sequences
  ;; <http://www.emacswiki.org/emacs/AnsiColor>

  ;; ANSI SRG in shell command output
  ;; <http://stackoverflow.com/questions/5819719/emacs-shell-command-output-not-showing-ansi-colors-but-the-code#5821668
  (defadvice display-message-or-buffer (before ansi-color activate)
    "Process ANSI color codes in shell output."
    (let ((buf (ad-get-arg 0)))
      (and (bufferp buf)
           (string= (buffer-name buf) "*Shell Command Output*")
           (with-current-buffer buf
             (ansi-color-apply-on-region (point-min) (point-max)))))))

(defun init-ansi-color-show ()
  "Process ANSI color codes in region."
  (interactive)
  (ansi-color-apply-on-region (region-beginning) (region-end)))

(provide 'init-ansi-color)
