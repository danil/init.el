;;; TODO: Move this recipe file to init!!!~~~~<danil@kutkevich.org>

;; (custom-set-variables '(hl-todo-activate-in-modes '()))

(add-hook 'after-init-hook 'noxrcp-hl-todo)

(defun noxrcp-hl-todo ()
  "No X recipe init."

  (if (boundp 'hl-todo-mode-map) (noxrcp-hl-todo--init)
    (with-eval-after-load 'hl-todo (noxrcp-hl-todo--init)))

  (dolist (hook init-programming-modes-hooks)
    (add-hook hook 'noxrcp-hl-todo--lazyinit)))

(defun noxrcp-hl-todo--lazyinit ()
  "Run `hl-todo'."

  (init-lazy
   init-lazy-seconds nil
   (lambda () (hl-todo-mode))))

;; 1. #cdcd00
;; 2. #ff0087
;; 3. #00cdcd
;; 4. #af87ff
;; 5. #00ff87
;; 6. #ff8700
;; 7. #ff5faf
;; 8. #5f87ff
;; 9. #5f8700

;;; #d2691e
(defun noxrcp-hl-todo--init ()
  (let ((faces '(("2FA"   . "#ff5fd7")
                 ("ARC"   . "#d7af00")
                 ("BAK"   . "#5f9ea0")
                 ("BENCH" . "#3cb371")
                 ("CERT"   . "#ff5fd7")
                 ("CHORE" . "#d0bf8f")
                 ("CLI"   . "#db7093")
                 ("CONS"  . "#ff875f")
                 ("DEPRECATED" . "#cc9393")
                 ("DEV"   . "#2e8b57")
                 ("DOC"   . "#00688b")
                 ("GEOPOLIT" . "#7cb8bb")
                 ("GEOS"  . "#2e8b57")
                 ("GOTO"  . "#5f7f5f")
                 ("HOWTO" . "#af87ff")
                 ("LOCAL" . "#00688b")
                 ("MED"   . "#00afff")
                 ("MERCH" . "#eedd82")
                 ("NETW"  . "#af87ff")
                 ("PICT"  . "#5f9ea0")
                 ("PIN"   . "#ff875f")
                 ("PROD"  . "#ff5fd7")
                 ("PROS"  . "#00afff")
                 ("PUB"   . "#7ec0ee")
                 ("PVT"   . "#00688b")
                 ("PWD"   . "#00afff")
                 ("RWX"   . "#db7093")
                 ("RX"    . "#6ca6cd")
                 ("STG"   . "#af87ff")
                 ("SVC"   . "#00688b")
                 ("TEST"  . "#af87ff")
                 ("TROUBLESHOOTING" . "#7cb8bb")
                 ("TX"    . "#db7093")
                 ("USR"   . "#6ca6cd")
                 ("VER[0-9]*" . "#7cb8bb")
                 ("WIP"   . "#5f9ea0"))))
    (setq hl-todo-keyword-faces (append hl-todo-keyword-faces faces))))

;;; init-hl-todo.el ends here
