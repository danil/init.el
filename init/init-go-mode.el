(defgroup init-go-mode nil
  "init-go-mode"
  :group  'editing
  :tag    "init-go-mode"
  :prefix "init-go-mode-"
  :link   '(url-link :tag "GitHub" "https://github.com/danil/init.el"))

(defcustom init-go-mode-lighter " init-go-mode" "init-go-mode" :group 'init-go-mode)

(defcustom init-go-mode-bindings '()
  "Keybindings enabled in `init-go-mode'. This is not a keymap.
Rather it is an alist that is converted into a keymap just before `init-go-mode'
is (re-)enabled. The keys are strings and the values are command symbols."
  :group 'init-go-mode
  :type '(alist
          :key-type sexp
          :value-type function))

(defcustom init-go-mode-rainbow-identifiers-stop-words
  '(
    "adler32"
    "aes"
    "ascii85"
    "asn1"
    "ast"
    "atomic"
    "base32"
    "base64"
    "big"
    "binary"
    "bufio"
    "build"
    "builtin"
    "bytes"
    "bzip2"
    "cgi"
    "cgo"
    "cipher"
    "cmplx"
    "color"
    "constant"
    "context"
    "cookiejar"
    "crc32"
    "crc64"
    "crypto"
    "csv"
    "debug"
    "des"
    "doc"
    "draw"
    "driver"
    "dsa"
    "dwarf"
    "ecdsa"
    "elf"
    "elliptic"
    "encoding"
    "errors"
    "exec"
    "expvar"
    "fcgi"
    "filepath"
    "flag"
    "flate"
    "fnv"
    "format"
    "gif"
    "gob"
    "gosym"
    "gzip"
    "hash"
    "heap"
    "hex"
    "hmac"
    "html"
    "http"
    "httptest"
    "httptrace"
    "httputil"
    "image"
    "importer"
    "init"
    "internal"
    "io"
    "iotest"
    "ioutil"
    "jpeg"
    "json"
    "jsonrpc"
    "list"
    "log"
    "lzw"
    "macho"
    "mail"
    "main"
    "math"
    "md5"
    "mime"
    "multipart"
    "net"
    "os"
    "palette"
    "parse"
    "parser"
    "path"
    "pe"
    "pem"
    "pkix"
    "plan9obj"
    "png"
    "pprof"
    "pprof"
    "printer"
    "quick"
    "quotedprintable"
    "race"
    "rand"
    "rand"
    "rc4"
    "reflect"
    "regexp"
    "ring"
    "rpc"
    "rsa"
    "runtime"
    "scanner"
    "scanner"
    "sha1"
    "sha256"
    "sha512"
    "signal"
    "smtp"
    "sort"
    "sql"
    "strconv"
    "strings"
    "subtle"
    "suffixarray"
    "sync"
    "syntax"
    "syscall"
    "syslog"
    "tabwriter"
    "tar"
    "template"
    "template"
    "testing"
    "textproto"
    "tls"
    "token"
    "types"
    "unicode"
    "unsafe"
    "url"
    "user"
    "utf16"
    "utf8"
    "x509"
    "xml"
    "zip"
    "zlib"

    "bool" "Bool"
    "byte" "Byte" "Bytes"
    "chan" "Chan"
    "complex128" "Complex128"
    "complex64" "Complex64"
    "error"
    "float32" "Float32"
    "float64" "Float64"
    "fmt" "Stringer"
    "int" "Int"
    "int16" "Int16"
    "int32" "Int32"
    "int64" "Int64"
    "int8" "Int8"
    "rune" "Rune"
    "string" "String"
    "struct" "Struct"
    "time" "Time"
    "uint" "Uint"
    "uint16" "Uint16"
    "uint32" "Uint32"
    "uint64" "Uint64"
    "uint8" "Uint8"
    "uintptr" "Uintptr"

    "DB"
    "DBStats"
    "NullBool"
    "NullFloat64"
    "NullInt64"
    "NullString"
    "RawBytes"
    "Result"
    "Row"
    "Rows"
    "Scanner"
    "Stmt"
    "Tx"

    "Valid"
    )
  "Do not highlight in `go-mode'."
  :group 'init-go-mode)

(defcustom init-go-dot-mod-mode-rainbow-identifiers-stop-words
  '("go" "module" "require" )
  "Do not highlight in `go-dot-mod-mode'."
  :group 'init-go-mode)

(defvar init-go-mode-map (make-sparse-keymap)
  "Keymap for `init-go-mode'. Populated when mode is enabled.
See `init-go-mode-bindings'.")

(define-minor-mode init-go-mode "init-go-mode" nil init-go-mode-lighter init-go-mode-map
  (if init-go-mode (init-go-mode-setup) (init-go-mode-teardown)))

(define-globalized-minor-mode init-global-go-mode init-go-mode
  (lambda () (init-global-go-mode-setup))
  (unless init-global-go-mode (init-global-go-mode-teardown)))

(defun init-go-mode-on () (init-go-mode +1))
(defun init-global-go-mode-on () (init-global-go-mode +1))

(defun init-global-go-mode-setup ()
  (when (eq major-mode 'go-mode) (init-go-mode-on))
  (add-hook 'go-mode-hook 'init-go-mode-on))

(defun init-global-go-mode-teardown () (remove-hook 'go-mode-hook 'init-go-mode-on))

(defun init-go-mode-setup ()
  (dolist (b init-go-mode-bindings)
    (let ((key (car b)) (cmd (cdr b)) (map init-go-mode-map))
      (define-key map (kbd key) cmd)))

  (add-hook 'before-save-hook #'gofmt-before-save))

(defun init-go-mode-teardown ()
  (remove-hook 'before-save-hook #'gofmt-before-save))

(defun init-go-mode-end-of-defun ()
  (interactive)
  (call-interactively 'end-of-defun)
  (when (search-backward "}" nil t) (forward-char)))

(defun init-go-mode-highlight-static-regexps-init ()
  (when (equal major-mode 'go-mode)
    (make-local-variable 'highlight-static-regexps-filter-functions)
    (add-hook 'highlight-static-regexps-filter-functions
              'init-go-mode-highlight-static-regexps-filter)

    (make-local-variable 'highlight-static-regexps-faces-to-override)
    (setq highlight-static-regexps-faces-to-override '(font-lock-keyword-face default))

    (when (<= (count-lines (point-min) (point-max)) 50000) ;number of lines in current buffer
      (init-highlight-static-regexps--lazyinit))))

(defun init-go-mode-highlight-static-regexps-filter (beg end)
  "My highlight-static-regexps custom init for symbol between `BEG' and `END'."

  (let ((face-cur (or (get-char-property beg 'read-face-name)
                      (get-char-property beg 'face)))
        (str-cur (buffer-substring-no-properties beg end)))
    (and
     (not (member face-cur '('font-lock-string-face 'font-lock-comment-face)))
     (and (member str-cur '(
                            "unsafe"
                            " :="
                            ") ("
                            "\tbreak"
                            "\tcontinue"
                            "\tdefer"
                            "\tgo"
                            "\tgoto"
                            "\treturn"
                            ))))))

(defun init-go-mode-rainbow-identifiers-setup ()
  (when (equal major-mode 'go-mode)
    (make-local-variable 'rainbow-identifiers-filter-functions)
    (add-hook 'rainbow-identifiers-filter-functions
              'init-go-mode-rainbow-identifiers-filter)

    (when (<= (count-lines (point-min) (point-max)) 50000) ;number of lines in current buffer
      (init-rainbow-identifiers--lazy-setup))))

;; <http://amitp.blogspot.ru/2014/09/emacs-rainbow-identifiers-customized.html>.
(defun init-go-mode-rainbow-identifiers-filter (beg end)
  "My rainbow-identifiers custom init for symbol between `BEG' and `END'."

  (let ((face-cur (or (get-char-property beg 'read-face-name)
                      (get-char-property beg 'face)))
        (str-cur (buffer-substring-no-properties beg end))
        (ch-cur (char-after beg))
        (ch-before (char-before beg))
        (ch-after (char-after end))
        (ch80-after (let ((i 80))
                      (if (> (point-max) (+ end i))
                          (buffer-substring-no-properties end (+ end i))
                        (buffer-substring-no-properties end (point-max))))))
    (or
     (and
      (or
       (eq face-cur 'font-lock-constant-face)
       (eq face-cur nil))
      (string-match-p "\\`: " ch80-after))
     (and
      (or
       (eq face-cur 'font-lock-function-name-face)
       (eq face-cur 'font-lock-type-face)
       (eq face-cur 'font-lock-variable-name-face))
      (not (member str-cur init-go-mode-rainbow-identifiers-stop-words)))
     (and
      (or
       ;; (eq face-cur 'default)
       ;; (eq face-cur 'digit-groups-default-face)
       (eq face-cur nil))
      (not (member ch-cur
                   '(?0 ?1 ?2 ?3 ?4 ?5 ?6 ?7 ?8 ?9 ?? ?_)))
      (not (string-match-p "\\`:\\'" ch80-after)) ;(equal ch-after ?\:)
      ;; (or (not (and (equal ch-before ?\.) (equal ch-after ?\.)))
      ;;     (string-match-p "\\`\\.[[:space:]\n]*[a-zA-Z0-1]*([^)]*)" ch80-after)
      ;;     (string-match-p "\\`\\.[[:space:]\n]*\\(Bytes\\|Bool\\|Float32\\|Float64\\|Int8\\|Int16\\|Int32\\|Int64\\|Uint8\\|Uint16\\|Uint32\\|Uint64\\|String\\|Time\\|Valid\\)[^a-zA-Z0-1]"
      ;;                     ch80-after))
      (or
       (equal ch-before ?.)
       (not (member str-cur init-go-mode-rainbow-identifiers-stop-words)))))))

(defun init-go-dot-mod-mode-rainbow-identifiers-setup ()
  (when (equal major-mode 'go-dot-mod-mode)
    (make-local-variable 'rainbow-identifiers-filter-functions)
    (add-hook 'rainbow-identifiers-filter-functions
              'rainbow-identifiers-face-overridable)
    (add-hook 'rainbow-identifiers-filter-functions
              'init-go-dot-mod-mode-rainbow-identifiers-filter)

    (make-local-variable 'rainbow-identifiers-faces-to-override)
    (setq rainbow-identifiers-faces-to-override
          '(
            font-lock-keyword-face
            go-dot-mod-module-name
            ))

    (init-rainbow-identifiers--lazy-setup)))

;; <http://amitp.blogspot.ru/2014/09/emacs-rainbow-identifiers-customized.html>.
(defun init-go-dot-mod-mode-rainbow-identifiers-filter (beg end)
  "My rainbow-identifiers custom init for symbol between `BEG' and `END'."

  (let ((ch-cur (char-after beg))
        (ch-before (char-before beg))
        (ch-after (char-after end))
        (str-cur (buffer-substring-no-properties beg end))
        (str-after (buffer-substring-no-properties end (point-max))))
    (and
     (not (member ch-cur '(?0 ?1 ?2 ?3 ?4 ?5 ?6 ?7 ?8 ?9 ?? ?_ ?& ?| ?= ?+ ?- ?* ?/)))
     (not (member str-cur init-go-dot-mod-mode-rainbow-identifiers-stop-words)))))

(provide 'init-go-mode)
