;;; init-go-mode.el --- This file is part of Danil <https://danil.kutkevich.org> home.

;; Copyright (C) 2021 Danil <https://danil.kutkevich.org>.
;; Author: Danil <https://danil.kutkevich.org>
;; Maintainer: Danil <https://danil.kutkevich.org>
;; URL: https://github.com/danil/init.el

;;; Commentary:

;; Please see README.md for documentation.

;;; License:

;; This file is not part of GNU Emacs.
;; However, it is distributed under the same license.

;; GNU Emacs is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

(defcustom noxrcp-go-mode--rainbow-identifiers-stop-words '()
  "Do not highlight in `go-mode'."
  :group 'noxrcp)

(custom-set-variables
 '(gofmt-command "goimports") ; The 'gofmt' command. Some users may replace this with 'goimports'from https://github.com/bradfitz/goimports.
 '(noxrcp-go-mode--rainbow-identifiers-stop-words
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
     )))

(add-hook 'after-init-hook 'noxrcp-go-mode)
(defun noxrcp-go-mode ()
  "No X recipe init."
    (if (boundp 'go-mode-map) (noxrcp-go-mode--customize)
      (with-eval-after-load 'go-mode (noxrcp-go-mode--customize))))

(defun noxrcp-go-mode--customize ()
  (add-hook 'before-save-hook #'gofmt-before-save)
  (define-key go-mode-map (kbd "C-c C-f e") 'noxrcp-go-mode--end-of-defun)
  (define-key go-mode-map (kbd "C-c C-k") 'xref-pop-marker-stack)
  (define-key go-mode-map (kbd "M-.") 'godef-jump)
  (define-key go-mode-map (nox-kbd "? ? f") 'godoc-at-point))

(defun noxrcp-go-mode--end-of-defun ()
  (interactive)
  (call-interactively 'end-of-defun)
  (when (search-backward "}" nil t) (forward-char)))

(defun noxrcp-go-mode--highlight-static-regexps-init ()
  (when (equal major-mode 'go-mode)
    (make-local-variable 'highlight-static-regexps-filter-functions)
    (add-hook 'highlight-static-regexps-filter-functions
              'noxrcp-go-mode--highlight-static-regexps-filter)

    (make-local-variable 'highlight-static-regexps-faces-to-override)
    (setq highlight-static-regexps-faces-to-override '(font-lock-keyword-face default))

    (when (<= (count-lines (point-min) (point-max)) 50000) ;number of lines in current buffer
      (noxrcp-highlight-static-regexps--lazyinit))))

(defun noxrcp-go-mode--highlight-static-regexps-filter (beg end)
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

(defun noxrcp-go-mode--rainbow-identifiers-init ()
  (when (equal major-mode 'go-mode)
    (make-local-variable 'rainbow-identifiers-filter-functions)
    (add-hook 'rainbow-identifiers-filter-functions
              'noxrcp-go-mode--rainbow-identifiers-filter)

    (when (<= (count-lines (point-min) (point-max)) 50000) ;number of lines in current buffer
      (noxrcp-rainbow-identifiers--lazyinit))))

;; <http://amitp.blogspot.ru/2014/09/emacs-rainbow-identifiers-customized.html>.
(defun noxrcp-go-mode--rainbow-identifiers-filter (beg end)
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
      (not (member str-cur noxrcp-go-mode--rainbow-identifiers-stop-words)))
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
       (not (member str-cur noxrcp-go-mode--rainbow-identifiers-stop-words)))))))

;; (defun noxrcp-go-mode--non-ascii-identifiers-init ()
;;   (when (equal major-mode 'go-mode)
;;     (make-local-variable 'non-ascii-identifiers-filter-functions)
;;     (add-hook 'non-ascii-identifiers-filter-functions
;;               'noxrcp-go-mode--non-ascii-identifiers-filter)

;;     (noxrcp-non-ascii-identifiers--lazyinit)))

;; (defun noxrcp-go-mode--non-ascii-identifiers-filter (beg end)
;;   "My non-ascii-identifiers custom init for symbol between `BEG' and `END'."

;;   (let ((face-cur (or (get-char-property beg 'read-face-name)
;;                       (get-char-property beg 'face)))
;;         (ch-cur (char-after beg))
;;         (ch-before (char-before beg))
;;         (ch-after (char-after end))
;;         (str-cur (buffer-substring-no-properties beg end))
;;         (str-before (buffer-substring-no-properties (point-min) beg))
;;         (str-after (buffer-substring-no-properties end (point-max))))
;;     (or
;;      (and
;;       (or
;;        (eq face-cur nil)
;;        (eq face-cur 'font-lock-constant-face))
;;       (equal (substring str-after 0 2) ": "))
;;      (and
;;       (or
;;        ;; (eq face-cur 'default)
;;        (eq face-cur nil))
;;       (not (member ch-cur
;;                    '(?0 ?1 ?2 ?3 ?4 ?5 ?6 ?7 ?8 ?9 ?? ?_)))
;;       (or (not (equal ch-before ?\s))
;;           (not (string-match-p "package \\'" str-before)))
;;       (not (string-match-p "\\`:\\'" str-after)) ;(equal ch-after ?\:)
;;       (or (not (and (equal ch-before ?\.) (equal ch-after ?\.)))
;;           (string-match-p "\\`\\.[[:space:]\n]*\\(Bool\\|Float32\\|Float64\\|Int8\\|Int16\\|Int32\\|Int64\\|Uint8\\|Uint16\\|Uint32\\|Uint64\\|String\\|Time\\|Valid\\)[^a-zA-Z0-1]"
;;                           str-after))
;;       (not (member str-cur '(
;;                              "adler32"
;;                              "aes"
;;                              "ascii85"
;;                              "asn1"
;;                              "ast"
;;                              "atomic"
;;                              "base32"
;;                              "base64"
;;                              "big"

;;                              "Valid"
;;                              )))))))

;;; init-go-mode.el ends here
