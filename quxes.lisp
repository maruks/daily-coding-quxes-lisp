(defpackage :quxes
  (:use :common-lisp :prove))

(in-package :quxes)

(defparameter *all-colors* '(:R :G :B))

(defun other-color (color-1 color-2)
  (car (remove-if (lambda (e) (member e (list color-1 color-2))) *all-colors*)))

(defun transform (prefix colors)
  (if colors
      (if prefix
	  (let ((pref (car prefix))
		(color (car colors)))
	    (if (eq pref color)
		(transform (cons color prefix) (cdr colors))
		(let* ((add-color (other-color pref color))
		       (next-colors (append (reverse (cdr prefix)) (cons add-color (cdr colors)))))
		  (append (transform nil next-colors) (transform (cons color prefix) (cdr colors))))))
	  (transform (list (car colors)) (cdr colors)))
      (list (length prefix))))

(defun min-transform (quxes)
  (when quxes
    (reduce #'min (transform nil quxes))))

(subtest "min-transform test"
  (plan 4)
  (is (min-transform '(:R :G :B :G :B)) 1)
  (is (min-transform '(:R :G :B :B)) 1)
  (is (min-transform '(:R :G :B)) 2)
  (is (min-transform '(:G :G :G)) 3)
  (finalize))
