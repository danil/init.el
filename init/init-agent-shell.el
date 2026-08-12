;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defgroup init-agent-shell nil
  "init-agent-shell"
  :group  'editing
  :tag    "init-agent-shell"
  :prefix "init-agent-shell-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defun init-agent-shell ()
  (if (boundp 'agent-shell-mode-map) (init-agent-shell-init)
    (with-eval-after-load 'agent-shell (init-agent-shell-init))))

(defun init-agent-shell-init ()
  ;; Опционально: добавьте путь к npm-бинарникам, если Emacs не видит команду reasonix
  ;; (add-to-list 'exec-path (expand-file-name "~/.npm-global/bin"))

  (setq agent-shell-agent-configs
        (append agent-shell-agent-configs
                (list (init-agent-shell-reasonix-make-agent-config)))))

(defun init-agent-shell-reasonix-make-client (buffer)
  (agent-shell--make-acp-client
   :command "reasonix"
   :command-params '("acp") ;; Запускает Reasonix как ACP stdio-агент
   ;; Если нужно жестко задать модель, используйте: '("acp" "--model" "deepseek-chat")
   :context-buffer buffer
   ;; Раскомментируйте, если хотите передавать API-ключ из среды Emacs, а не из ~/.reasonix/.env
   ;; :environment-variables (agent-shell-make-environment-variables
   ;;                         "DEEPSEEK_API_KEY" (getenv "DEEPSEEK_API_KEY"))
   ))

(defun init-agent-shell-reasonix-make-agent-config ()
  (agent-shell-make-agent-config
   :identifier 'reasonix
   :mode-line-name "Reasonix"
   :buffer-name "Reasonix"
   :shell-prompt "Reasonix> "
   :shell-prompt-regexp "Reasonix> "
   :client-maker #'init-agent-shell-reasonix-make-client
   :install-instructions "Установите Reasonix: brew tap esengine/reasonix && brew install reasonix"))

(provide 'init-agent-shell)
