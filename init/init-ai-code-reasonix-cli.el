;;; This file is part of Danil Kutkevich <danil@kutkevich.org> home.

(defgroup init-ai-code-reasonix-cli nil
  "DeepSeek Reasonix integration."
  :group 'tools
  :tag    "init-ai-code-reasonix-cli"
  :prefix "init-ai-code-reasonix-cli-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-ai-code-reasonix-cli-program "reasonix"
  "Name of the Reasonix executable file"
  :type 'string
  :group 'init-ai-code-reasonix-cli)

(defcustom init-ai-code-reasonix-cli-program-switches nil
  "Extar arguments for Reasonix command line"
  :type '(repeat string)
  :group 'init-ai-code-reasonix-cli)

(defconst init-ai-code-reasonix-cli--session-prefix "reasonix"
  "Prefix for the name of Reasonix buffers.")

(defvar init-ai-code-reasonix-cli--processes (make-hash-table :test 'equal)
  "Hash-table to store a Reasonix processes.")

(defun init-ai-code-reasonix-cli ()
  (if (boundp 'ai-code-prompt-mode-map) (init-ai-code-reasonix-cli-init)
    (with-eval-after-load 'ai-code (init-ai-code-reasonix-cli-init))))

(defun init-ai-code-reasonix-cli-init ()
  (require 'ai-code-backends)
  (require 'ai-code-backends-infra)

  (defun init-ai-code-reasonix-cli (&optional arg)
    "Run Reasonix session by `ai-code-backends-infra'."
    (interactive "P")
    (ai-code-backends-infra--start-cli-session
     (list :program init-ai-code-reasonix-cli-program
           :switches init-ai-code-reasonix-cli-program-switches
           :label "Reasonix"
           :process-table init-ai-code-reasonix-cli--processes
           :session-prefix init-ai-code-reasonix-cli--session-prefix)
     arg))

  (defun init-ai-code-reasonix-cli-switch-to-buffer (&optional force-prompt)
    "Switch to Reasonix buffer."
    (interactive "P")
    (ai-code-backends-infra--cli-switch-to-buffer
     "Reasonix" init-ai-code-reasonix-cli--session-prefix force-prompt))

  (defun init-ai-code-reasonix-cli-send-command (line)
    "Send command (prompt) to active Reasonix session."
    (interactive "sReasonix> ")
    (ai-code-backends-infra--cli-send-command
     "Reasonix" init-ai-code-reasonix-cli--session-prefix line))

  (defun init-ai-code-reasonix-cli-resume (&optional arg)
    "Resume session (run new Reasonix session)."
    (interactive "P")
    (init-ai-code-reasonix-cli arg))

   (add-to-list 'ai-code-backends
               '(reasonix
                 :label "DeepSeek Reasonix"
                 :require init-ai-code-reasonix-cli
                 :start init-ai-code-reasonix-cli
                 :switch init-ai-code-reasonix-cli-switch-to-buffer
                 :send init-ai-code-reasonix-cli-send-command
                 :resume init-ai-code-reasonix-cli-resume
                 :config "~/.reasonix/config.toml"
                 :agent-file "AGENTS.md"
                 :install "brew tap esengine/reasonix && brew install reasonix"
                 :cli "reasonix")
               'append) 

    (ai-code-set-backend 'reasonix))

(provide 'init-ai-code-reasonix-cli)
