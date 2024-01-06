(defpackage #:learn-deploy/core
  (:use :cl))
(in-package #:learn-deploy/core)

(defun some-handler (env)
  "we have two new keys in env plist, path-params and query-params"
  (destructuring-bind (&key path-params query-params &allow-other-keys) env
     (declare (ignore path-params query-params))
     '(200 (:content-type "text/plain") ("Hello, World!"))))

;; meiro router
(defparameter *app*
  (meiro:clack-handler
    (meiro:router
      (list (list "/"
                  :get (list :name "home"
                             :handler #'some-handler))
            (list "/found/:found/sub/:sub"
                  :get (list :handler #'some-handler))
            (list "/not-there"
                  :get (list :handler nil)
                  :post (list :handler #'some-handler))))
    ;; overridee fallback handler for not acceptable (url and method matched but handler is nil. for example: GET "/not-there")
    (meiro:create-fallback-handler
      :not-acceptable (constantly '(406 (:content-type "text/plain") ("it is not acceptable"))))))

(defun start! ()
  (clack:clackup
   *app*
   :address "0.0.0.0"
   :port 9000
   :server :woo
   :use-thread nil))
