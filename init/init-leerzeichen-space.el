;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

;;; `leerzeichen-mode` is a minor mode to display whitespace characters.
;;; <https://github.com/fgeller/leerzeichen.el>.

(defgroup init-leerzeichen-space nil
  "init-leerzeichen-space"
  :group  'editing
  :tag    "init-leerzeichen-space"
  :prefix "init-leerzeichen-space-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defun init-leerzeichen-space ()
  (if (boundp 'leerzeichen-line-feed-glyph) (init-leerzeichen-space-init)
    (with-eval-after-load 'leerzeichen (init-leerzeichen-space-init))))

(defun init-leerzeichen-space-init ()
  (setq leerzeichen-line-feed-glyph (make-glyph-code ?⇠ 'leerzeichen)) ; ﹂﹁┐ ╮ ⌡ ⇋ ￩ ⤵	⤶ ↲ ↵ ↩ ↡↜ ↚ ⇇ ⇠ ⇣ ⟳ ↺ ⤎ ⤦ ⤳ ⤸ ⤾ ⥋ ⥊ ⥌⥍⥰ ⬃ ⬰ ⬱ ⬴ ⬵ ⬶ ⬷ ⬸ ⬹ ⬺ ⬻ ⬼ ⬽ ⬾ ⬿╮ ⌞ ﹁⭁ ⭂ ⭃ ⭄ ⭅ ⭆ ⭇ ⭈ ⭉ ⭊ ⭋ ⭌ ⮠ ⮡ ⮢ ⮣ ⮤ ⮥ ⮦ ⮧ ⬳  ⁜⦻ ⮾ Ø ⌏⌯⌿⌟ ⌑⌘ ⌗⌇⎈ ⌍⌝⌭ ⌽ ⌯⎏⏟⟢⤸✶ <https://key-shortcut.com/en/writing-systems/35-symbols/arrows>.
  (setq leerzeichen-tab-glyph (make-glyph-code ?⏤ 'leerzeichen)) ; ⏤ ― ─ ⭾ ⎯ ━
  (setq leerzeichen-space-glyph (make-glyph-code ?· 'leerzeichen)) ; ·
  )

(provide 'init-leerzeichen-space)
