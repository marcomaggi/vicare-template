;;; -*- coding: utf-8-unix -*-
;;;
;;;Part of: Vicare/Template
;;;Contents: tests for Template bindings
;;;Date: Tue Jan 24, 2012
;;;
;;;Abstract
;;;
;;;
;;;
;;;Copyright (C) 2013, 2015 Marco Maggi <marco.maggi-ipsu@poste.it>
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
(import (vicare)
  (vicare category template)
  (vicare category template constants)
;;;  (prefix (vicare ffi) ffi.)
  (vicare checks))

(check-set-mode! 'report-failed)
(check-display "*** testing Vicare Template bindings\n")


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

  (check	;this will be garbage collected
      (let ((voice (template-alpha-initialise)))
;;;(debug-print voice)
	(template-alpha? voice))
    => #t)

  (check
      (template-alpha?/alive (template-alpha-initialise))
    => #t)

  (check	;single finalisation
      (let ((voice (template-alpha-initialise)))
  	(template-alpha-finalise voice))
    => #f)

  (check	;double finalisation
      (let ((voice (template-alpha-initialise)))
  	(template-alpha-finalise voice)
  	(template-alpha-finalise voice))
    => #f)

  (check	;alive predicate after finalisation
      (let ((voice (template-alpha-initialise)))
  	(template-alpha-finalise voice)
  	(template-alpha?/alive voice))
    => #f)

;;; --------------------------------------------------------------------
;;; destructor

  (check
      (with-result
       (let ((voice (template-alpha-initialise)))
	 (set-template-alpha-custom-destructor! voice (lambda (voice)
							(add-result 123)))
	 (template-alpha-finalise voice)))
    => '(#f (123)))

;;; --------------------------------------------------------------------
;;; hash

  (check-for-true
   (integer? (template-alpha-hash (template-alpha-initialise))))

  (check
      (let ((A (template-alpha-initialise))
	    (B (template-alpha-initialise))
	    (T (make-hashtable template-alpha-hash eq?)))
	(hashtable-set! T A 1)
	(hashtable-set! T B 2)
	(list (hashtable-ref T A #f)
	      (hashtable-ref T B #f)))
    => '(1 2))

;;; --------------------------------------------------------------------
;;; properties

  (check
      (let ((S (template-alpha-initialise)))
	(template-alpha-property-list S))
    => '())

  (check
      (let ((S (template-alpha-initialise)))
	(template-alpha-putprop S 'ciao 'salut)
	(template-alpha-getprop S 'ciao))
    => 'salut)

  (check
      (let ((S (template-alpha-initialise)))
	(template-alpha-getprop S 'ciao))
    => #f)

  (check
      (let ((S (template-alpha-initialise)))
	(template-alpha-putprop S 'ciao 'salut)
	(template-alpha-remprop S 'ciao)
	(template-alpha-getprop S 'ciao))
    => #f)

  (check
      (let ((S (template-alpha-initialise)))
	(template-alpha-putprop S 'ciao 'salut)
	(template-alpha-putprop S 'hello 'ohayo)
	(list (template-alpha-getprop S 'ciao)
	      (template-alpha-getprop S 'hello)))
    => '(salut ohayo))

  (collect 'fullest))


;;;; done

(check-report)

;;; end of file
