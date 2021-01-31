(in-package #:test-exercises)

(defun slurp-exercise-config (dir)
  (let ((config-file (merge-pathnames ".meta/config.json" dir)))
    (if (probe-file config-file)
        (cl-json:decode-json-from-source config-file)
        ;; this is a v2 exercise not yet converted let's try to do something useful
        (let ((slug (first (last (pathname-directory dir)))))
          (pairlis '(:files :v2)
                   (list (pairlis '(:test :solution :exemplar)
                                  (list (list (format nil "~A-test.lisp" slug))
                                        (list (format nil "~A.lisp" slug))
                                        (list "example.lisp")))
                         t))))))

(defun gather-exercise-data (dir)
  (destructuring-bind (type slug)
      (mapcar #'keywordize (last (pathname-directory dir) 2))
    (let ((config (slurp-exercise-config dir)))
      (pairlis '(:directory :type :slug :files :v2)
               (list dir type slug (aget :files config) (aget :v2 config))))))

(defun load-exercise-file (exercise file)
  (let ((*default-pathname-defaults* (aget :directory exercise))
        (*load-verbose* t))
    (load file)))

(defun find-exercise-package (exercise &key (test nil))
  (let ((slug (symbol-name (aget :slug exercise))))
   (find-package (string-upcase (format nil "~A~@[-TEST~]" slug test)))))
