#!/bin/sh
######### Not really intended to be chmod +x'd but be my guest

  printf 'Content-Type: text/plain\r\n\r\n' # 
  set -e

# Assume we're in a CGI bin with a writable parent

  cat >../nec4lgtv.awk <<'AWK_EOF'
#!/bin/sh

AWK_EOF

  cat >./amsr4nec.cgi <<'CGI_EOF'
#!/bin/sh

CGI_EOF
  chmod g+x ./*.cgi 2>&1

# be nice
  echo ""
  ls -lR ..
  echo ""

