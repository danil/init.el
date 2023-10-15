;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defgroup init-quickrun nil
  "init-quickrun"
  :group  'editing
  :tag    "init-quickrun"
  :prefix "init-quickrun-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-quickrun-map-prefix "C-v " "init-quickrun" :group 'init-quickrun)

(defun init-quickrun ()
  (if (boundp 'quickrun-file-alist) (init-quickrun-setup)
    (with-eval-after-load 'quickrun (init-quickrun-setup)))

  (let ((prefix init-quickrun-map-prefix))
    (global-set-key (kbd (concat prefix "! b")) 'init--quickrun)
    (global-set-key (kbd (concat prefix "! r")) 'init--quickrun-region)))

(defun init-quickrun-setup ())

(defun init--quickrun (&optional arg)
  (interactive "P")

  (if (equal arg '(4)) ; universal-argument <http://www.gnu.org/software/emacs/manual/html_node/elisp/Prefix-Command-Arguments.html>, <http://www.gnu.org/software/emacs/manual/html_node/emacs/Arguments.html>.
      (call-interactively 'quickrun-with-arg)
    (call-interactively 'quickrun)))

(defun init--quickrun-region (&optional arg)
  (interactive "P")

  (if arg (call-interactively 'quickrun-replace-region)
    (call-interactively 'quickrun-region)))


(provide 'init-quickrun)
