;;; -*- coding: utf-8-unix -*-
;;;
;;;Part of: Vicare/Template
;;;Contents: Template binding backend
;;;Date: Sat Jan 21, 2012
;;;
;;;Abstract
;;;
;;;
;;;
;;;Copyright (C) 2013, 2015, 2017 Marco Maggi <marco.maggi-ipsu@poste.it>
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


#!vicare
(library (vicare category template)
  (foreign-library "vicare-template")
  (export

    ;; version numbers and strings
    vicare-template-version-interface-current
    vicare-template-version-interface-revision
    vicare-template-version-interface-age
    vicare-template-version

    ;; template alpha struct
    template-alpha-initialise
    template-alpha-finalise
    template-alpha?
    template-alpha?/alive		$template-alpha-alive?
    template-alpha-custom-destructor	set-template-alpha-custom-destructor!
    template-alpha-putprop		template-alpha-getprop
    template-alpha-remprop		template-alpha-property-list
    template-alpha-hash

;;; --------------------------------------------------------------------
;;; still to be implemented

    )
  (import (vicare (or (0 4 2015 5 (>= 26))
		      (0 4 2015 (>= 6))
		      (0 4 (>= 2016))))
    (prefix (vicare system structs) structs::)
    (vicare category template constants)
    (prefix (vicare category template unsafe-capi) capi::)
    #;(prefix (vicare ffi (or (0 4 2015 5 (>= 27))
			    (0 4 2015 (>= 6))
			    (0 4 (>= 2016))))
	    ffi::)
    (prefix (vicare ffi foreign-pointer-wrapper) ffi::)
    #;(vicare arguments general-c-buffers)
    #;(vicare language-extensions syntaxes)
    #;(prefix (vicare platform words) words::))


;;;; arguments validation



;;;; version functions

(define (vicare-template-version-interface-current)
  (capi::vicare-template-version-interface-current))

(define (vicare-template-version-interface-revision)
  (capi::vicare-template-version-interface-revision))

(define (vicare-template-version-interface-age)
  (capi::vicare-template-version-interface-age))

(define (vicare-template-version)
  (ascii->string (capi::vicare-template-version)))


;;;; data structures: alpha

(ffi::define-foreign-pointer-wrapper template-alpha
  (ffi::foreign-destructor capi::template-alpha-finalise)
  #;(ffi::foreign-destructor #f)
  (ffi::collector-struct-type #f)
  (ffi::collected-struct-type template-beta))

(module ()
  (structs::set-struct-type-printer! (type-descriptor template-alpha)
    (lambda (S port sub-printer)
      (define-syntax-rule (%display thing)
	(display thing port))
      (define-syntax-rule (%write thing)
	(write thing port))
      (%display "#[template-alpha")
      (%display " pointer=")	(%display ($template-alpha-pointer  S))
      (%display "]"))))

;;; --------------------------------------------------------------------

(define* (template-alpha-initialise)
  (cond ((capi::template-alpha-initialise)
	 => (lambda (rv)
	      (make-template-alpha/owner rv)))
	(else
	 (error __who__ "unable to create alpha object"))))

(define* (template-alpha-finalise {alpha template-alpha?})
  ($template-alpha-finalise alpha))


;;;; data structures: beta

(ffi::define-foreign-pointer-wrapper template-beta
  (ffi::foreign-destructor #f)
  (ffi::collector-struct-type template-alpha))


;;;; done

#| end of library |# )

;;; end of file
;; Local Variables:
;; eval: (put 'ffi::define-foreign-pointer-wrapper	'scheme-indent-function 1)
;; eval: (put 'structs::set-struct-type-printer!	'scheme-indent-function 1)
;; End:
