#!/bin/bash

sbcl <<EOF
(ql-dist:installed-releases (ql-dist:dist "quicklisp"))
(quit)
EOF

