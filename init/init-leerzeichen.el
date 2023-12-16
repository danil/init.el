;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

;;; `leerzeichen-mode` is a minor mode to display whitespace characters.
;;; <https://github.com/fgeller/leerzeichen.el>.

(defgroup init-leerzeichen nil
  "init-leerzeichen"
  :group  'editing
  :tag    "init-leerzeichen"
  :prefix "init-leerzeichen-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defun init-leerzeichen ()
  (if (boundp 'leerzeichen-line-feed-glyph) (init-leerzeichen-init)
    (with-eval-after-load 'leerzeichen (init-leerzeichen-init))))

(defun init-leerzeichen-init ()
  (setq leerzeichen-line-feed-glyph (make-glyph-code ?⤎ 'leerzeichen)) ; ﹂﹁┐ ╮ ⌡ ⇋ ￩ ⤵	⤶ ↲ ↵ ↩ ↡↜ ↚ ⇇ ⇠ ⇣ ⟳ ↺ ⤎ ⤦ ⤳ ⤸ ⤾ ⥋ ⥊ ⥌⥍⥰ ⬃ ⬰ ⬱ ⬴ ⬵ ⬶ ⬷ ⬸ ⬹ ⬺ ⬻ ⬼ ⬽ ⬾ ⬿╮ ⌞ ﹁⭁ ⭂ ⭃ ⭄ ⭅ ⭆ ⭇ ⭈ ⭉ ⭊ ⭋ ⭌ ⮠ ⮡ ⮢ ⮣ ⮤ ⮥ ⮦ ⮧ ⬳  ⁜⦻ ⮾ Ø ⌏⌯⌿⌟ ⌑⌘ ⌗⌇⎈ ⌍⌝⌭ ⌽ ⌯⎏⏟⟢⤸✶ <https://key-shortcut.com/en/writing-systems/35-symbols/arrows>.
  (setq leerzeichen-tab-glyph (make-glyph-code ?⏤ 'leerzeichen)) ; ⏤ ― ─ ⭾ ⎯ ━
  (setq leerzeichen-space-glyph (make-glyph-code ?· 'leerzeichen)) ; ·
  )

(provide 'init-leerzeichen)
