(defgroup init-leerzeichen-mode nil
  "init-leerzeichen-mode"
  :group  'editing
  :tag    "init-leerzeichen-mode"
  :prefix "init-leerzeichen-mode-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-leerzeichen-mode-lighter "" "init-leerzeichen-mode" :group 'init-leerzeichen-mode)

(defcustom init-leerzeichen-mode-hooks '()
  "Hooks to display whitespace characters."
  :group 'init-leerzeichen-mode)

(defun init-leerzeichen-mode-customize ()
  (if (boundp 'leerzeichen-line-feed-glyph) (init-leerzeichen-mode--customize)
    (with-eval-after-load 'leerzeichen (init-leerzeichen-mode--customize))))

(defun init-leerzeichen-mode--customize ()
  (setq leerzeichen-line-feed-glyph (make-glyph-code ?⌑ 'leerzeichen)) ; ﹂﹁┐ ╮ ⌡ ⇋ ￩ ⤵	⤶ ↲ ↵ ↩ ↡↜ ↚ ⇇ ⇠ ⇣ ⟳ ↺ ⤎ ⤦ ⤳ ⤸ ⤾ ⥋ ⥊ ⥌⥍⥰ ⬃ ⬰ ⬱ ⬴ ⬵ ⬶ ⬷ ⬸ ⬹ ⬺ ⬻ ⬼ ⬽ ⬾ ⬿╮ ⌞ ﹁⭁ ⭂ ⭃ ⭄ ⭅ ⭆ ⭇ ⭈ ⭉ ⭊ ⭋ ⭌ ⮠ ⮡ ⮢ ⮣ ⮤ ⮥ ⮦ ⮧ ☈↵ ☇↯⬳  ⇴ ⇵ ⇷ ⇸ ⇹ ⇺ ⇑ ⇓ ⤪ ⤨ ⤧ ⤩ ⤭ ⤮ ⤯ ⤰ ⤱ ⤲ ⤫ ⤬ ⇽ ⇾ ⇿ ⬳ ⟿ ⤉ ⤈ ⇻ ⇼ ⬴⁜⦻ ⮾ Ø ⌏⌯⌿⌟ ⌑⌘ ⌗⌇⎈ ⌍⌝⌭ ⌽ ⌯⎏⏟⟢⤸✶ <https://key-shortcut.com/en/writing-systems/35-symbols/arrows>, <https://symbolspy.com/arrow-symbol.html>.
  (setq leerzeichen-tab-glyph (make-glyph-code ?⏤ 'leerzeichen)) ; ⏤ ― ─ ⭾ ⎯ ━
  (setq leerzeichen-space-glyph (make-glyph-code ?· 'leerzeichen)) ; ·
  )

(define-globalized-minor-mode init-global-leerzeichen-mode init-leerzeichen-mode
  init-global-leerzeichen-mode-setup
  (unless init-global-leerzeichen-mode (init-global-leerzeichen-mode-teardown)))

(defun init-global-leerzeichen-mode-on ()  (interactive) (init-global-leerzeichen-mode +1))
(defun init-global-leerzeichen-mode-off () (interactive) (init-global-leerzeichen-mode -1))

(defun init-global-leerzeichen-mode-setup ()
  (dolist (hook init-leerzeichen-mode-hooks)
    (add-hook hook 'init-global-leerzeichen-mode-lazy-setup)))

(defun init-global-leerzeichen-mode-lazy-setup ()
  (init-lazy init-lazy-seconds nil 'init-leerzeichen-mode-on))

(defun init-global-leerzeichen-mode-teardown ()
  (dolist (hook init-leerzeichen-mode-hooks)
    (remove-hook hook 'init-global-leerzeichen-mode-lazy-setup)))

(define-minor-mode init-leerzeichen-mode "init-leerzeichen-mode" :init-value nil :lighter init-leerzeichen-mode-lighter
  (if init-leerzeichen-mode (init-leerzeichen-mode-setup) (init-leerzeichen-mode-teardown)))

(defun init-leerzeichen-mode-setup ()
  (when (fboundp 'leerzeichen-mode) (leerzeichen-mode t)))

(defun init-leerzeichen-mode-teardown ()
  (when (fboundp 'leerzeichen-mode) (leerzeichen-mode -1)))

(defun init-leerzeichen-mode-on ()  (interactive) (init-leerzeichen-mode +1))
(defun init-leerzeichen-mode-off () (interactive) (init-leerzeichen-mode -1))

(provide 'init-leerzeichen-mode)
