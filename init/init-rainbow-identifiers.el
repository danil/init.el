(defgroup init-rainbow-identifiers nil
  "init-rainbow-identifiers"
  :group  'editing
  :tag    "init-rainbow-identifiers"
  :prefix "init-rainbow-identifiers-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-rainbow-identifiers-hooks '()
  "Hooks associated with `rainbow-identifiers'." :group 'init-rainbow-identifiers)

(defun init-rainbow-identifiers ()
  (dolist (h init-rainbow-identifiers-hooks)
    (let ((h (car h))
          (init-fn (nth 1 h)))
      (when (fboundp init-fn) (add-hook h init-fn))))

  (if (boundp 'rainbow-identifiers--face) (init-rainbow-identifiers--init)
    (with-eval-after-load 'rainbow-identifiers (init-rainbow-identifiers--init))))

(defun init-rainbow-identifiers--init ()
  ;; Use a wider set of colors.
  (setq rainbow-identifiers-choose-face-function 'rainbow-identifiers-cie-l*a*b*-choose-face)
  (setq rainbow-identifiers-cie-l*a*b*-lightness 70)
  (setq rainbow-identifiers-cie-l*a*b*-saturation 70))

(defun init-rainbow-identifiers--lazy-setup ()
  (init-lazy init-lazy-seconds nil 'init-rainbow-identifiers--setup))

(defun init-rainbow-identifiers--setup ()
  (rainbow-identifiers-mode +1))

(defun init-rainbow-identifiers-face-overridable (begin end)
  "Checking that the face of the identifier under BEGIN is overridable."
  (let ((face (get-text-property begin 'face)))
    (cond
     ((null face)
      nil)
     ((listp face)
      (catch 'rainbow-identifiers--face-overridable
        (dolist (face* face)
          (unless (memq face* rainbow-identifiers-faces-to-override)
            (throw 'rainbow-identifiers--face-overridable nil)))
        t))
     (t
      (memq face rainbow-identifiers-faces-to-override)))))

(provide 'init-rainbow-identifiers)
