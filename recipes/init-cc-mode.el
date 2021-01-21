;;; init-cc-mode.el --- This file is part of Danil <https://danil.kutkevich.org> home.

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

(defcustom noxrcp-c-mode-patterns '()
  "Regexp patterns associated with `c-mode'."
  :group 'noxrcp)

(defcustom noxrcp-c-mode--rainbow-identifiers-stop-words '()
  "Do not highlight in `c-mode'."
  :group 'noxrcp)

(custom-set-variables
 '(noxrcp-c-mode-patterns
   '(
     "/etc/portage/savedconfig/www-servers/quark"
     "/etc/portage/savedconfig/x11-misc/dmenu"
     "/etc/portage/savedconfig/x11-misc/slstatus"
     "/etc/portage/savedconfig/x11-misc/tabbed"
     "/etc/portage/savedconfig/x11-terms/st"
     "/etc/portage/savedconfig/x11-wm/dwm"
     ))
 '(noxrcp-c-mode--rainbow-identifiers-stop-words
   '(
     "stdin"
     "stdout"
     "stderr"

     ;; Types
     "char"
     "double"
     "float"
     "int"
     "long"
     "short"
     "signed"
     "unsigned"

     ;; C standard library functions
     "abort"           ;; stdlib.h
     "abs"             ;; stdlib.h
     "acos"            ;; math.h
     "asctime"         ;; time.h
     "asctime_r"       ;; time.h
     "asin"            ;; math.h
     "assert"          ;; assert.h
     "atan"            ;; math.h
     "atan2"           ;; math.h
     "atexit"          ;; stdlib.h
     "atof"            ;; stdlib.h
     "atoi"            ;; stdlib.h
     "atol"            ;; stdlib.h
     "bsearch"         ;; stdlib.h
     "btowc"           ;; stdio.h wchar.h
     "calloc"          ;; stdlib.h
     "catclose"        ;; nl_types.h
     "catgets"         ;; nl_types.h
     "catopen"         ;; nl_types.h
     "ceil"            ;; math.h
     "clearerr"        ;; stdio.h
     "clock"           ;; time.h
     "cos"             ;; math.h
     "cosh"            ;; math.h
     "ctime"           ;; time.h
     "ctime64"         ;; time.h
     "ctime_r"         ;; time.h
     "ctime64_r"       ;; time.h
     "difftime"        ;; time.h
     "difftime64"      ;; time.h
     "div"             ;; stdlib.h
     "erf"             ;; math.h
     "erfc"            ;; math.h
     "exit"            ;; stdlib.h
     "exp"             ;; math.h
     "fabs"            ;; math.h
     "fclose"          ;; stdio.h
     "fdopen"          ;; stdio.h
     "feof"            ;; stdio.h
     "ferror"          ;; stdio.h
     "fflush"          ;; stdio.h
     "fgetc"           ;; stdio.h
     "fgetpos"         ;; stdio.h
     "fgets"           ;; stdio.h
     "fgetwc"          ;; stdio.h wchar.h
     "fgetws"          ;; stdio.h wchar.h
     "fileno"          ;; stdio.h
     "floor"           ;; math.h
     "fmod"            ;; math.h
     "fopen"           ;; stdio.h
     "fprintf"         ;; stdio.h
     "fputc"           ;; stdio.h
     "fputs"           ;; stdio.h
     "fputwc"          ;; stdio.h wchar.h
     "fputws"          ;; stdio.h wchar.h
     "fread"           ;; stdio.h
     "free"            ;; stdlib.h
     "freopen"         ;; stdio.h
     "frexp"           ;; math.h
     "fscanf"          ;; stdio.h
     "fseek"           ;; stdio.h
     "fsetpos"         ;; stdio.h
     "ftell1"          ;; stdio.h
     "fwide6"          ;; stdio.h wchar.h
     "fwprintf6"       ;; stdio.h wchar.h
     "fwrite"          ;; stdio.h
     "fwscanf"         ;; stdio.h wchar.h
     "gamma"           ;; math.h
     "getc"            ;; stdio.h
     "getchar"         ;; stdio.h
     "getenv"          ;; stdlib.h
     "gets"            ;; stdio.h
     "getwc"           ;; stdio.h wchar.h
     "getwchar"        ;; wchar.h
     "gmtime"          ;; time.h
     "gmtime64"        ;; time.h
     "gmtime_r"        ;; time.h
     "gmtime64_r"      ;; time.h
     "hypot"           ;; math.h
     "isalnum"         ;; ctype.h
     "isalpha"         ;; ctype.h
     "isascii"         ;; ctype.h
     "isblank"         ;; ctype.h
     "iscntrl"         ;; ctype.h
     "isdigit"         ;; ctype.h
     "isgraph"         ;; ctype.h
     "islower"         ;; ctype.h
     "isprint"         ;; ctype.h
     "ispunct"         ;; ctype.h
     "isspace"         ;; ctype.h
     "isupper"         ;; ctype.h
     "iswalnum"        ;; wctype.h
     "iswalpha"        ;; wctype.h
     "iswblank"        ;; wctype.h
     "iswcntrl"        ;; wctype.h
     "iswctype"        ;; wctype.h
     "iswdigit"        ;; wctype.h
     "iswgraph"        ;; wctype.h
     "iswlower"        ;; wctype.h
     "iswprint"        ;; wctype.h
     "iswpunct"        ;; wctype.h
     "iswspace"        ;; wctype.h
     "iswupper"        ;; wctype.h
     "iswxdigit"       ;; wctype.h
     "isxdigit"        ;; wctype.h
     "j0"              ;; math.h
     "j1"              ;; math.h
     "jn"              ;; math.h
     "labs"            ;; stdlib.h
     "ldexp"           ;; math.h
     "ldiv"            ;; stdlib.h
     "localeconv"      ;; locale.h
     "localtime"       ;; time.h
     "localtime64"     ;; time.h
     "localtime_r"     ;; time.h
     "localtime64_r"   ;; time.h
     "log"             ;; math.h
     "log10"           ;; math.h
     "longjmp"         ;; setjmp.h
     "malloc"          ;; stdlib.h
     "mblen"           ;; stdlib.h
     "mbrlen"          ;; wchar.h
     "mbrtowc"         ;; wchar.h
     "mbsinit"         ;; wchar.h
     "mbsrtowcs"       ;; wchar.h
     "mbstowcs"        ;; stdlib.h
     "mbtowc"          ;; stdlib.h
     "memchr"          ;; string.h
     "memcmp"          ;; string.h
     "memcpy"          ;; string.h
     "memmove"         ;; string.h
     "memset"          ;; string.h
     "mktime"          ;; time.h
     "mktime64"        ;; time.h
     "modf"            ;; math.h
     "nextafter"       ;; math.h
     "nextafterl"      ;; math.h
     "nexttoward"      ;; math.h
     "nexttowardl"     ;; math.h
     "nl_langinfo"     ;; langinfo.h
     "perror"          ;; stdio.h
     "pow"             ;; math.h
     "printf"          ;; stdio.h
     "putc"            ;; stdio.h
     "putchar"         ;; stdio.h
     "putenv"          ;; stdlib.h
     "puts"            ;; stdio.h
     "putwc"           ;; stdio.h wchar.h
     "putwchar"        ;; wchar.h
     "qsort"           ;; stdlib.h
     "quantexpd32"     ;; math.h
     "quantexpd64"     ;; math.h
     "quantexpd128"    ;; math.h
     "quantized32"     ;; math.h
     "quantized64"     ;; math.h
     "quantized128"    ;; math.h
     "samequantumd32"  ;; math.h
     "samequantumd64"  ;; math.h
     "samequantumd128" ;; math.h
     "raise"           ;; signal.h
     "rand"            ;; stdlib.h
     "rand_r"          ;; stdlib.h
     "realloc"         ;; stdlib.h
     "regcomp"         ;; regex.h
     "regerror"        ;; regex.h
     "regexec"         ;; regex.h
     "regfree"         ;; regex.h
     "remove"          ;; stdio.h
     "rename"          ;; stdio.h
     "rewind"          ;; stdio.h
     "scanf"           ;; stdio.h
     "setbuf"          ;; stdio.h
     "setjmp"          ;; setjmp.h
     "setlocale"       ;; locale.h
     "setvbuf"         ;; stdio.h
     "signal"          ;; signal.h
     "sin"             ;; math.h
     "sinh"            ;; math.h
     "snprintf"        ;; stdio.h
     "sprintf"         ;; stdio.h
     "sqrt"            ;; math.h
     "srand"           ;; stdlib.h
     "sscanf"          ;; stdio.h
     "strcasecmp"      ;; strings.h
     "strcat"          ;; string.h
     "strchr"          ;; string.h
     "strcmp"          ;; string.h
     "strcoll"         ;; string.h
     "strcpy"          ;; string.h
     "strcspn"         ;; string.h
     "strerror"        ;; string.h
     "strfmon"         ;; wchar.h
     "strftime"        ;; time.h
     "strlen"          ;; string.h
     "strncasecmp"     ;; strings.h
     "strncat"         ;; string.h
     "strncmp"         ;; string.h
     "strncpy"         ;; string.h
     "strpbrk"         ;; string.h
     "strptime"        ;; time.h
     "strrchr"         ;; string.h
     "strspn"          ;; string.h
     "strstr"          ;; string.h
     "strtod"          ;; stdlib.h
     "strtod32"        ;; stdlib.h
     "strtod64"        ;; stdlib.h
     "strtod128"       ;; stdlib.h
     "strtof"          ;; stdlib.h
     "strtok"          ;; string.h
     "strtok_r"        ;; string.h
     "strtol"          ;; stdlib.h
     "strtold"         ;; stdlib.h
     "strtoul"         ;; stdlib.h
     "strxfrm"         ;; string.h
     "swprintf"        ;; wchar.h
     "swscanf"         ;; wchar.h
     "system"          ;; stdlib.h
     "tan"             ;; math.h
     "tanh"            ;; math.h
     "time"            ;; time.h
     "time64"          ;; time.h
     "tmpfile"         ;; stdio.h
     "tmpnam"          ;; stdio.h
     "toascii"         ;; ctype.h
     "tolower"         ;; ctype.h
     "toupper"         ;; ctype.h
     "towctrans"       ;; wctype.h
     "towlower"        ;; wctype.h
     "towupper"        ;; wctype.h
     "ungetc"          ;; stdio.h
     "ungetwc"         ;; stdio.h wchar.h
     "va_arg"          ;; stdarg.h
     "va_copy"         ;; stdarg.h
     "va_end"          ;; stdarg.h
     "va_start"        ;; stdarg.h
     "vfprintf"        ;; stdio.h stdarg.h
     "vfscanf"         ;; stdio.h stdarg.h
     "vfwprintf"       ;; stdarg.h stdio.h wchar.h
     "vfwscanf"        ;; stdio.h stdarg.h
     "vprintf"         ;; stdio.h stdarg.h
     "vscanf"          ;; stdio.h stdarg.h
     "vsprintf"        ;; stdio.h stdarg.h
     "vsnprintf"       ;; stdio.h
     "vsscanf"         ;; stdio.h stdarg.h
     "vswprintf"       ;; stdarg.h wchar.h
     "vswscanf"        ;; stdio.h wchar.h
     "vwprintf"        ;; stdarg.h wchar.h
     "vwscanf"         ;; stdio.h wchar.h
     "wcrtomb"         ;; wchar.h
     "wcscat"          ;; wchar.h
     "wcschr"          ;; wchar.h
     "wcscmp"          ;; wchar.h
     "wcscoll"         ;; wchar.h
     "wcscpy"          ;; wchar.h
     "wcscspn"         ;; wchar.h
     "wcsftime"        ;; wchar.h
     "wcslen"          ;; wchar.h
     "wcslocaleconv"   ;; locale.h
     "wcsncat"         ;; wchar.h
     "wcsncmp"         ;; wchar.h
     "wcsncpy"         ;; wchar.h
     "wcspbrk"         ;; wchar.h
     "wcsptime"        ;; wchar.h
     "wcsrchr"         ;; wchar.h
     "wcsrtombs"       ;; wchar.h
     "wcsspn"          ;; wchar.h
     "wcsstr"          ;; wchar.h
     "wcstod"          ;; wchar.h
     "wcstod32"        ;; wchar.h
     "wcstod64"        ;; wchar.h
     "wcstod128"       ;; wchar.h
     "wcstof"          ;; wchar.h
     "wcstok"          ;; wchar.h
     "wcstol"          ;; wchar.h
     "wcstold"         ;; wchar.h
     "wcstombs"        ;; stdlib.h
     "wcstoul"         ;; wchar.h
     "wcsxfrm"         ;; wchar.h
     "wctob"           ;; stdarg.h wchar.h
     "wctomb"          ;; stdlib.h
     "wctrans"         ;; wctype.h
     "wctype"          ;; wchar.h
     "wcwidth"         ;; wchar.h
     "wmemchr"         ;; wchar.h
     "wmemcmp"         ;; wchar.h
     "wmemcpy"         ;; wchar.h
     "wmemmove"        ;; wchar.h
     "wmemset"         ;; wchar.h
     "wprintf"         ;; wchar.h
     "wscanf"          ;; wchar.h
     "y0"              ;; math.h
     "y1"              ;; math.h
     "yn"              ;; math.h
     )))

(add-hook 'after-init-hook 'noxrcp-cc-mode)
(defun noxrcp-cc-mode ()
  "No X recipe init."
  (dolist (pattern noxrcp-c-mode-patterns)
    (add-to-list 'auto-mode-alist (cons pattern 'c-mode)))
  (if (boundp 'c-mode) (noxrcp-c-mode--setup)
    (with-eval-after-load 'cc-mode (noxrcp-c-mode--setup))))

(defun noxrcp-c-mode--setup ()
  (define-key c-mode-map (kbd "C-c C-k") 'xref-pop-marker-stack))

(defun noxrcp-c-mode--rainbow-identifiers-init ()
  (when (equal major-mode 'c-mode)
    (make-local-variable 'rainbow-identifiers-filter-functions)
    (add-hook 'rainbow-identifiers-filter-functions
              'rainbow-identifiers-face-overridable)
    (add-hook 'rainbow-identifiers-filter-functions
              'noxrcp-c-mode--rainbow-identifiers-filter)

    (make-local-variable 'rainbow-identifiers-faces-to-override)
    (setq rainbow-identifiers-faces-to-override
          '(
            font-lock-variable-name-face
            font-lock-type-face
            ))

    (noxrcp-rainbow-identifiers--lazyinit)))

;; <http://amitp.blogspot.ru/2014/09/emacs-rainbow-identifiers-customized.html>.
(defun noxrcp-c-mode--rainbow-identifiers-filter (beg end)
  "My rainbow-identifiers custom init for symbol between `BEG' and `END'."

  (let ((ch-cur (char-after beg))
        (str-cur (buffer-substring-no-properties beg end))
        (str-after (buffer-substring-no-properties end (point-max))))
    (and (not (member ch-cur
                      '(?0 ?1 ?2 ?3 ?4 ?5 ?6 ?7 ?8 ?9 ?? ?_ ?& ?| ?= ?+ ?- ?* ?/)))
         (not (string-match-p "[?!]\\'" str-cur))
         (not (string-match-p "\\`[[:space:]]+:[^[:space:]]" str-after))
         (not (member str-cur noxrcp-c-mode--rainbow-identifiers-stop-words)))))

;;; init-cc-mode.el ends here
