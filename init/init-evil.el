;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defgroup init-evil nil
  "init-evil"
  :group  'editing
  :tag    "init-evil"
  :prefix "init-evil-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-evil-bindings '()
  "Keybindings enabled in `init-evil-mode'. This is not a keymap.
Rather it is an alist that is converted into a keymap just before `init-evil-mode'
is (re-)enabled. The keys are strings and the values are command symbols."
  :group 'init-evil
  :type '(alist
          :key-type sexp
          :value-type function))

(defcustom init-evil-normal-bindings '()
  "Keybindings enabled in `init-evil-mode'. This is not a keymap.
Rather it is an alist that is converted into a keymap just before `init-evil-mode'
is (re-)enabled. The keys are strings and the values are command symbols."
  :group 'init-evil
  :type '(alist
          :key-type sexp
          :value-type function))

(defcustom init-evil-insert-bindings '()
  "Keybindings enabled in `init-evil-mode'. This is not a keymap.
Rather it is an alist that is converted into a keymap just before `init-evil-mode'
is (re-)enabled. The keys are strings and the values are command symbols."
  :group 'init-evil
  :type '(alist
          :key-type sexp
          :value-type function))

(defun init-evil ()
  (if (boundp 'evil-normal-state-map) (init-evil-init)
    (with-eval-after-load 'evil (init-evil-init)))

  (when (fboundp 'evil-mode) (evil-mode 1)))

(defun init-evil-init ()
  ;; Color the Evil tag (colors taken from spaceline)
  ;; <https://github.com/Malabarba/smart-mode-line/issues/195#issuecomment-338447042>.
  (setq evil-normal-state-tag   (propertize "NORMAL" 'face '((:foreground "white")))
        evil-insert-state-tag   (propertize "INSERT" 'face '((:background "brightred"  :foreground "white")))
        evil-replace-state-tag  (propertize "REPLAC" 'face '((:background "DarkOrange" :foreground "white")))
        evil-motion-state-tag   (propertize "MOTION" 'face '((:background "blue"       :foreground "white")))
        evil-visual-state-tag   (propertize "VISUAL" 'face '((:background "gray80"     :foreground "black")))
        evil-operator-state-tag (propertize "OPERAT" 'face '((:background "gray50"     :foreground "black")))
        evil-emacs-state-tag    (propertize "EMACS " 'face '((:background "magenta"    :foreground "white"))))

  ;; (evil-set-initial-state 'Buffer-menu-mode 'motion) ; NOTE: Instead used `evil-collection` setup.
  (evil-set-initial-state 'ivy-occur-grep-mode 'normal) ; 'ivy-occur-mode
  (evil-set-initial-state 'shell-mode 'normal) ; 'motion ; 'emacs

  (dolist (b init-evil-bindings)
    (let ((key (car b)) (cmd (cdr b)) (map global-map))
      (define-key map (kbd key) cmd)))

  (dolist (b init-evil-normal-bindings)
    (let ((key (car b)) (cmd (cdr b)) (map global-map))
      (evil-define-key 'normal global-map (kbd key) cmd)))

  (dolist (b init-evil-insert-bindings)
    (let ((key (car b)) (cmd (cdr b)) (map global-map))
      (evil-define-key 'insert global-map (kbd key) cmd)))

  ;; ;; ;; (add-hook 'evil-normal-state-exit-hook  'init-evil-mode-line-high)
  ;; ;; ;; (add-hook 'evil-normal-state-entry-hook 'init-evil-mode-line-low)
  ;; ;; (setq evil-normal-state-cursor '(box "light blue")
  ;; ;;       evil-insert-state-cursor '(bar "medium sea green")
  ;; ;;       evil-visual-state-cursor '(hollow "orange"))
  ;; (unless (display-graphic-p)
  ;;   (require 'evil-terminal-cursor-changer)
  ;;   (evil-terminal-cursor-changer-activate) ; or (etcc-on)
  ;;   (setq evil-motion-state-cursor 'box)  ; █
  ;;   (setq evil-visual-state-cursor 'box)  ; █
  ;;   (setq evil-normal-state-cursor 'box)  ; █
  ;;   (setq evil-insert-state-cursor 'bar)  ; ⎸
  ;;   (setq evil-emacs-state-cursor  'hbar) ; _
  ;;   )
 
  (define-key evil-motion-state-map (kbd "SPC") nil) ; FIXME: A hard coded hotkey string is a anti-pattern instead must use a best practice and do adding of the `init-???-bindings` customizable variable and using it.~~~~<danil@kutkevich.org>
  (define-key evil-motion-state-map (kbd "RET") nil) ; FIXME: A hard coded hotkey string is a anti-pattern instead must use a best practice and do adding of the `init-???-bindings` customizable variable and using it.~~~~<danil@kutkevich.org>
  (define-key evil-motion-state-map (kbd "TAB") nil) ; FIXME: A hard coded hotkey string is a anti-pattern instead must use a best practice and do adding of the `init-???-bindings` customizable variable and using it.~~~~<danil@kutkevich.org>

  ;; Automatically re-enter Normal State after saving with C-x C-s
  ;; <https://reddit.com/r/emacs/comments/4emyt2/how_to_properly_configure_keybindings_for_evil/#t1_d21ia3t>.
  (evil-define-key '(insert emacs) global-map (kbd "C-x C-s") 'init-evil-init-save-and-goto-normal-state)

  (evil-global-set-key 'normal (kbd ".") 'init--evil-repeat)
  (evil-define-key 'normal global-map (kbd "ш") 'evil-insert) ; NOTE: Same keys in English and Russian layouts "i" and "ш".~~~~<danil@kutkevich.org>
  (evil-define-key 'normal global-map (kbd "Ш") 'evil-insert-line) ; NOTE: Same keys in English and Russian layouts "I" and "Ш".~~~~<danil@kutkevich.org>
  (evil-define-key 'normal global-map (kbd "ф") 'evil-append) ; NOTE: Same keys in English and Russian layouts "a" and "ф".~~~~<danil@kutkevich.org>
  (evil-define-key 'normal global-map (kbd "Ф") 'evil-append-line) ; NOTE: Same keys in English and Russian layouts "A" and "Ф".~~~~<danil@kutkevich.org>

  (evil-define-key 'insert global-map (kbd "C-d") 'delete-char) ; NOTE: Overwrited default function `evil-shift-left-line`.~~~~<danil@kutkevivh.org>
  (evil-define-key 'insert global-map (kbd "C-n") 'evil-next-line) ; NOTE: Overwrited default function `evil-complete-next`.~~~~<danil@kutkevivh.org>
  (evil-define-key 'insert global-map (kbd "C-p") 'evil-previous-line) ; NOTE: Overwrited default function `evil-complete-previous`.~~~~<danil@kutkevivh.org>

  ;; (evil-define-key '(normal insert replace motion visual operator emacs) global-map (kbd "C-ы") 'evil-change-to-initial-state) ; NOTE: Same keys in English and Russian layouts "C-s" and "C-ы".~~~~<danil@kutkevich.org>
  ;; (evil-define-key '(normal insert replace motion visual operator emacs) global-map (kbd "C-s") 'evil-change-to-initial-state)
  )

(defun init-evil-mode-line-high ()
  (cond ((equal frame-background-mode 'light) (set-face-attribute 'mode-line nil :background "red"))
        ((equal frame-background-mode 'dark)  (set-face-attribute 'mode-line nil :background "red"))))

(defun init-evil-mode-line-low ()
  (cond ((equal frame-background-mode 'light) (set-face-attribute 'mode-line nil :background "black"))
        ((equal frame-background-mode 'dark)  (set-face-attribute 'mode-line nil :background "black"))))

(defun init-evil-init-save-and-goto-normal-state ()
  "Save buffer and go to normal state."
  (interactive)
  (save-buffer)
  (evil-exit-emacs-state)
  (evil-normal-state))

(provide 'init-evil)
