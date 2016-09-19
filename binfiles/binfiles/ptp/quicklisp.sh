cd /tmp/

curl -O https://beta.quicklisp.org/quicklisp.lisp

gpg --verify quicklisp.lisp.asc quicklisp.lisp

sbcl --load quicklisp.lisp <<EOF
(quicklisp-quickstart:install)

EOF
