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
;;;Copyright (C) 2013 Marco Maggi <marco.maggi-ipsu@poste.it>
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
#!(load-shared-library "vicare-template")
(library (vicare category template)
  (export

    ;; version numbers and strings
    vicare-template-version-interface-current
    vicare-template-version-interface-revision
    vicare-template-version-interface-age
    vicare-template-version

;;; --------------------------------------------------------------------
;;; still to be implemented

    )
  (import (vicare)
    (vicare category template constants)
    (prefix (vicare category template unsafe-capi) capi.)
    (vicare syntactic-extensions)
    #;(prefix (vicare words) words.))


;;;; arguments validation

#;(define-argument-validation (fixnum who obj)
  (fixnum? obj)
  (assertion-violation who "expected fixnum as argument" obj))

#;(define-argument-validation (pointer who obj)
  (pointer? obj)
  (assertion-violation who "expected pointer as argument" obj))

#;(define-argument-validation (callback who obj)
  (pointer? obj)
  (assertion-violation who "expected callback as argument" obj))

#;(define-argument-validation (bytevector who obj)
  (bytevector? obj)
  (assertion-violation who "expected bytevector as argument" obj))



;;;; version functions

(define (vicare-template-version-interface-current)
  (capi.vicare-template-version-interface-current))

(define (vicare-template-version-interface-revision)
  (capi.vicare-template-version-interface-revision))

(define (vicare-template-version-interface-age)
  (capi.vicare-template-version-interface-age))

(define (vicare-template-version)
  (ascii->string (capi.vicare-template-version)))


;;;; done

#;(set-rtd-printer! (type-descriptor XML_ParsingStatus) %struct-XML_ParsingStatus-printer)

#;(post-gc-hooks (cons %free-allocated-parser (post-gc-hooks)))

)

;;; end of file
