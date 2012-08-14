;;; -*- coding: utf-8-unix -*-
;;;
;;;Part of: Vicare/Template
;;;Contents: unsafe interface to the C language API
;;;Date: Tue Aug 14, 2012
;;;
;;;Abstract
;;;
;;;
;;;
;;;Copyright (C) 2012 Marco Maggi <marco.maggi-ipsu@poste.it>
;;;
;;;This program is free software:  you can redistribute it and/or modify
;;;it under the terms of the  GNU General Public License as published by
;;;the Free Software Foundation, either version 3 of the License, or (at
;;;your option) any later version.
;;;
;;;This program is  distributed in the hope that it  will be useful, but
;;;WITHOUT  ANY   WARRANTY;  without   even  the  implied   warranty  of
;;;MERCHANTABILITY or  FITNESS FOR  A PARTICULAR  PURPOSE.  See  the GNU
;;;General Public License for more details.
;;;
;;;You should  have received a  copy of  the GNU General  Public License
;;;along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;;


#!r6rs
(library (vicare template unsafe-capi)
  (export

    ;; version functions
    vicare-template-version-interface-current
    vicare-template-version-interface-revision
    vicare-template-version-interface-age
    vicare-template-version

;;; --------------------------------------------------------------------
;;; still to be implemented

    )
  (import (vicare))


;;;; helpers

(define-syntax define-inline
  (syntax-rules ()
    ((_ (?name ?arg ... . ?rest) ?form0 ?form ...)
     (define-syntax ?name
       (syntax-rules ()
	 ((_ ?arg ... . ?rest)
	  (begin ?form0 ?form ...)))))))


;;;; version functions

(define-inline (vicare-template-version-interface-current)
  (foreign-call "ikrt_template_version_interface_current"))

(define-inline (vicare-template-version-interface-revision)
  (foreign-call "ikrt_template_version_interface_revision"))

(define-inline (vicare-template-version-interface-age)
  (foreign-call "ikrt_template_version_interface_age"))

(define-inline (vicare-template-version)
  (foreign-call "ikrt_template_version"))


;;;; still to be implemented

#;(define-inline (vicare-template)
  (foreign-call "iktr_template"))


;;;; done

)

;;; end of file
