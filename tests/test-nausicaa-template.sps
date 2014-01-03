;;; -*- coding: utf-8-unix -*-
;;;
;;;Part of: Vicare/Template
;;;Contents: tests for Template bindings, Nausicaa API
;;;Date: Mon Sep 30, 2013
;;;
;;;Abstract
;;;
;;;
;;;
;;;Copyright (C) 2013, 2014 Marco Maggi <marco.maggi-ipsu@poste.it>
;;;
;;;This program is free software:  you can redistribute it and/or modify
;;;it under the terms of the  GNU General Public License as published by
;;;the Free Software Foundation, either version 3 of the License, or (at
;;;your option) any later version.
;;;
;;;This program is  distributed in the hope that it  will be useful, but
;;;WITHOUT  ANY   WARRANTY;  without   even  the  implied   warranty  of
;;;MERCHANTABILITY  or FITNESS FOR  A PARTICULAR  PURPOSE.  See  the GNU
;;;General Public License for more details.
;;;
;;;You should  have received  a copy of  the GNU General  Public License
;;;along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;;


#!r6rs
(import (nausicaa)
  (nausicaa category template)
  (vicare arguments validation)
  (vicare checks))

(check-set-mode! 'report-failed)
(check-display "*** testing Vicare Template bindings: Nausicaa API\n")


;;;; helpers



(parametrise ((check-test-name	'version))

  (check
      (fixnum? (vicare-template-version-interface-current))
    => #t)

  (check
      (fixnum? (vicare-template-version-interface-revision))
    => #t)

  (check
      (fixnum? (vicare-template-version-interface-age))
    => #t)

  (check
      (string? (vicare-template-version))
    => #t)

  #t)


(parametrise ((check-test-name		'struct-alpha)
	      (struct-guardian-logger	#t))

  (define who 'test)

;;; --------------------------------------------------------------------

  (check	;this will be garbage collected
      (let (((A <template-alpha>) (<template-alpha> ())))
	;;;(debug-print A)
	(is-a? A <template-alpha>))
    => #t)

  (check
      (let (((A <template-alpha>) (<template-alpha> ())))
	(A alive?))
    => #t)

  (check	;single finalisation
      (let (((A <template-alpha>) (<template-alpha> ())))
  	(A finalise))
    => #f)

  (check	;double finalisation
      (let (((A <template-alpha>) (<template-alpha> ())))
  	(A finalise)
  	(A finalise))
    => #f)

  (check	;alive predicate after finalisation
      (let (((A <template-alpha>) (<template-alpha> ())))
  	(A finalise)
  	(A alive?))
    => #f)

;;; --------------------------------------------------------------------
;;; destructor

  (check
      (with-result
       (let (((A <template-alpha>) (<template-alpha> ())))
	 (set! (A destructor) (lambda (A)
				(add-result 123)))
	 (A finalise)))
    => '(#f (123)))

;;; --------------------------------------------------------------------
;;; hash

  (check-for-true
   (let (((V <template-alpha>) (<template-alpha> ())))
     (integer? (V hash))))

  (check
      (let ((A (<template-alpha> ()))
	    (B (<template-alpha> ()))
	    (T (make-hashtable (lambda ((V <template-alpha>))
				 (V hash))
			       eq?)))
	(hashtable-set! T A 1)
	(hashtable-set! T B 2)
	(list (hashtable-ref T A #f)
	      (hashtable-ref T B #f)))
    => '(1 2))

;;; --------------------------------------------------------------------
;;; properties

  (check
      (let (((S <template-alpha>) (<template-alpha> ())))
	(S property-list))
    => '())

  (check
      (let (((S <template-alpha>) (<template-alpha> ())))
	(S putprop 'ciao 'salut)
	(S getprop 'ciao))
    => 'salut)

  (check
      (let (((S <template-alpha>) (<template-alpha> ())))
	(S getprop 'ciao))
    => #f)

  (check
      (let (((S <template-alpha>) (<template-alpha> ())))
	(S putprop 'ciao 'salut)
	(S remprop 'ciao)
	(S getprop 'ciao))
    => #f)

  (check
      (let (((S <template-alpha>) (<template-alpha> ())))
	(S putprop 'ciao 'salut)
	(S putprop 'hello 'ohayo)
	(list (S getprop 'ciao)
	      (S getprop 'hello)))
    => '(salut ohayo))

;;; --------------------------------------------------------------------
;;; arguments validation

  (check-for-true
   (let (((S <template-alpha>) (<template-alpha> ())))
     (with-arguments-validation (who)
	 ((<template-alpha>	S))
       #t)))

  (check-for-true
   (let (((S <template-alpha>) (<template-alpha> ())))
     (S finalise)
     (with-arguments-validation (who)
	 ((<template-alpha>	S))
       #t)))

  (check-for-true
   (let (((S <template-alpha>) (<template-alpha> ())))
     (with-arguments-validation (who)
	 ((<template-alpha>/alive	S))
       #t)))

;;;

  (let (((S <template-alpha>) (<template-alpha> ())))
    (check-for-procedure-argument-violation
	(begin
	  (S finalise)
	  (with-arguments-validation (who)
	      ((<template-alpha>/alive	S))
	    #t))
      => (list who (list S))))

  (collect))


;;;; done

(check-report)

;;; end of file
