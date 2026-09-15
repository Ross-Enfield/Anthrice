#!/bin/sh
######### Not really intended to be chmod +x'd but be my guest ###############
##############################################################################

  printf 'Content-Type: text/plain\r\n' \
         'Cache-Control: no-cache\r\n' \
         '\r\n' # be nice
  set -e

# Assume we're in a CGI bin with a writable parent

  cat >../nec4lgtv.awk <<'AWK_EOF'
  
        function hx(d) {
          return 16 - index("FEDCBA9876543210", toupper(d))
        }
        function nib(n,  b, s) {
          for (b = 8; b >= 1; b /= 2)
            s = s M "," (int(n / b) % 2 ? W : M) ","
          return s
        }
        BEGIN { sep = ""
        }
        NF < 2 { next
        }
        {
          c1 = hx(substr($2, 1, 1))
          c2 = hx(substr($2, 2, 1))
          printf "%s%s%s%s%s%s%s%s%s%s%s%s%s",
            sep,
            P, $1, I,
            nib(H), nib(L), nib(31 - H), nib(31 - L),
            nib(c1), nib(c2), nib(31 - c1), nib(31 - c2),
            S
          sep = ",\n"
        }

AWK_EOF

  mkdir -p ${TMPDIR:-/tmp}/amsr4nec/
  cat >./amsr4nec.cgi <<'CGI_EOF'
#!/bin/sh
##############################################################################

        TEMPDIR=${TMPDIR:-/tmp}/amsr4nec/cgi$$
        mkdir "$TEMPDIR"
        trap 'rm -rf "$TEMPDIR"' EXIT HUP INT TERM

        printf '//%s//\n' "$PATH_INFO" |
          tr '/' '\n' |
          egrep -v '^$' |
          tr "()'" '{}"' >"$TEMPDIR/format.txt"
        head -n -4 "$TEMPDIR/format.txt" >"$TEMPDIR/output.txt"
        tail -n 4 "$TEMPDIR/format.txt" |
          head -n 1 >"$TEMPDIR/prefix.txt"
        tail -n 3 "$TEMPDIR/format.txt" |
          head -n 1 >"$TEMPDIR/infix.txt"
        tail -n 2 "$TEMPDIR/format.txt" |
          head -n 1 >"$TEMPDIR/suffix.txt"
        tail -n 1 "$TEMPDIR/format.txt" >"$TEMPDIR/outro.txt"
        printf '%s\n' "$QUERY_STRING" |
          tr '&=' '\n\t' >"$TEMPDIR/input.txt"
        awk -F '\t' -v H=2 -v L=0 -v M=21 -v W=63          \
                    -v P="$(cat    "$TEMPDIR/prefix.txt")" \
                    -v I="$(cat    "$TEMPDIR/infix.txt")"  \
                    -v S="$(cat    "$TEMPDIR/suffix.txt")" \
            -f ../nec4lgtv.awk     "$TEMPDIR/input.txt"    \
                                 >>"$TEMPDIR/output.txt"
        cat "$TEMPDIR/outro.txt" >>"$TEMPDIR/output.txt"

        printf 'Content-Type: application/octet-stream\r\n' \
               'Cache-Control: no-cache\r\n'                \
               'Content-Disposition: attachment; filename="lg-tv-ir.amsr"\r\n'
        printf 'Content-Length: '
        wc -c <"$TEMPDIR/output.txt" | tr -d '\n'
        printf '\r\n\r\n'
        cat "$TEMPDIR/output.txt"

CGI_EOF
  chmod g+x ./*.cgi 2>&1

# be nice
  echo ""
  ls -lR ..
  echo ""

