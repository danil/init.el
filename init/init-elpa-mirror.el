(defun init-elpa-mirror ()
  (if (boundp 'elpamr-default-output-directory) (init-ielm--init)
    (with-eval-after-load 'elpa-mirror (init-ielm--init))))

(defun init-elpa-mirror-xxxxxxxxxx ()
  (setq elpamr-default-output-directory "/var/elpa/mirror"
        elpamr-email "danil@kutkevich.org"
        elpamr-repository-name "kutkevich"
        elpamr-repository-path "http://elpa.kutkevich.org"))

(provide 'init-elpa-mirror)
