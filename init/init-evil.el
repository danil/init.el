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

(defun init-evil ()
  (if (boundp 'evil-normal-state-map) (init-evil-init)
    (with-eval-after-load 'evil (init-evil-init)))

  (when (fboundp 'evil-mode) (evil-mode 1)))

(defun init-evil-init ()
  (if (boundp 'undo-tree-map) (init-evil-undo-tree)
    (with-eval-after-load 'undo-tree (init-evil-undo-tree)))

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

  (define-key evil-motion-state-map (kbd "SPC") nil) ; FIXME: A hard coded hotkey string is a anti-pattern instead must use a best practice and do adding of the `init-???-bindings` customizable variable and using it.~~~~<danil@kutkevich.org>
  (define-key evil-motion-state-map (kbd "RET") nil) ; FIXME: A hard coded hotkey string is a anti-pattern instead must use a best practice and do adding of the `init-???-bindings` customizable variable and using it.~~~~<danil@kutkevich.org>
  (define-key evil-motion-state-map (kbd "TAB") nil) ; FIXME: A hard coded hotkey string is a anti-pattern instead must use a best practice and do adding of the `init-???-bindings` customizable variable and using it.~~~~<danil@kutkevich.org>

  ;; Automatically re-enter Normal State after saving with C-x C-s
  ;; <https://reddit.com/r/emacs/comments/4emyt2/how_to_properly_configure_keybindings_for_evil/#t1_d21ia3t>.
  (evil-define-key '(insert emacs) global-map (kbd "C-x C-s") 'init-evil-init-save-and-goto-normal-state)

  (evil-global-set-key 'normal (kbd ".") 'init--evil-repeat)
  (evil-define-key 'normal global-map (kbd "ш") 'evil-insert) ; NOTE: Same keys in English and Russian layouts "i" and "ш".~~~~<danil@kutkevich.org>

  (evil-define-key 'insert global-map (kbd "C-d") 'delete-char) ; NOTE: Overwrited default function `evil-shift-left-line`.~~~~<danil@kutkevivh.org>
  (evil-define-key 'insert global-map (kbd "C-n") 'evil-next-line) ; NOTE: Overwrited default function `evil-complete-next`.~~~~<danil@kutkevivh.org>
  (evil-define-key 'insert global-map (kbd "C-p") 'evil-previous-line) ; NOTE: Overwrited default function `evil-complete-previous`.~~~~<danil@kutkevivh.org>

  (let ((keymap '(normal insert replace motion visual operator emacs)))
    ;; (evil-define-key keymap global-map (kbd "C-x C-x s") 'evil-mode)
    (evil-define-key keymap global-map (kbd "C-x C-x S S") 'evil-force-normal-state)
    (evil-define-key keymap global-map (kbd "C-x C-x S n") 'evil-normal-state)
    (evil-define-key keymap global-map (kbd "C-x C-x S i") 'evil-insert-state)
    (evil-define-key keymap global-map (kbd "C-x C-x S r") 'evil-replace-state)
    (evil-define-key keymap global-map (kbd "C-x C-x S m") 'evil-motion-state)
    (evil-define-key keymap global-map (kbd "C-x C-x S v") 'evil-visual-state)
    (evil-define-key keymap global-map (kbd "C-x C-x S e") 'evil-emacs-state))

  (evil-define-key '(normal insert replace motion visual operator emacs) global-map (kbd "C-ы") 'evil-change-to-initial-state) ; NOTE: Same keys in English and Russian layouts "C-s" and "C-ы".~~~~<danil@kutkevich.org>
  (evil-define-key '(normal insert replace motion visual operator emacs) global-map (kbd "C-s") 'evil-change-to-initial-state))

(defun init-evil-undo-tree ()
  ;; <https://github.com/emacs-evil/evil/issues/1382#issuecomment-761087738>.
  (add-hook 'evil-local-mode-hook #'init-evil-turn-on-undo-tree-mode))

(defun init-evil-init-save-and-goto-normal-state ()
  "Save buffer and go to normal state."
  (interactive)
  (save-buffer)
  (evil-exit-emacs-state)
  (evil-normal-state))

(defun init-evil-turn-on-undo-tree-mode ()
  "Enable `undo-tree-mode' if evil is enabled.
This function enables `undo-tree-mode' when Evil is activated in
some buffer, but only if `global-undo-tree-mode' is also
activated."
  (when (and (boundp 'global-undo-tree-mode) global-undo-tree-mode)
    (if (eq major-mode 'dired-mode) (undo-tree-mode 1) (turn-on-undo-tree-mode))))

(provide 'init-evil)
