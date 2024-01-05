##
# Project Title
#
# @file
# @version 0.1

LISP ?= qlot exec sbcl

build:
	$(LISP) --load learn-deploy.asd \
		--eval '(ql:quickload :learn-deploy)' \
		--eval '(asdf:make :learn-deploy)' \
		--eval '(quit)'


# end
