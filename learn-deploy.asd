(asdf:defsystem "learn-deploy"
  :author "garlic0x1"
  :license "MIT"
  :depends-on (:clack :meiro :woo)
  :components ((:module "src"
                :components ((:file "core"))))
  :build-operation "program-op"
  :build-pathname "learn-deploy"
  :entry-point "learn-deploy/core::start!")
