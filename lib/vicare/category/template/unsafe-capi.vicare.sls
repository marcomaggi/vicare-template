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
;;;Copyright (C) 2013, 2015 Marco Maggi <marco.maggi-ipsu@poste.it>
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
(library (vicare category template unsafe-capi)
  (export

    ;; version functions
    vicare-template-version-interface-current
    vicare-template-version-interface-revision
    vicare-template-version-interface-age
    vicare-template-version

    ;; template alpha
    template-alpha-initialise
    template-alpha-finalise

;;; --------------------------------------------------------------------
;;; still to be implemented

    )
  (import (vicare))


;;;; version functions

(define-syntax-rule (vicare-template-version-interface-current)
  (foreign-call "ikrt_template_version_interface_current"))

(define-syntax-rule (vicare-template-version-interface-revision)
  (foreign-call "ikrt_template_version_interface_revision"))

(define-syntax-rule (vicare-template-version-interface-age)
  (foreign-call "ikrt_template_version_interface_age"))

(define-syntax-rule (vicare-template-version)
  (foreign-call "ikrt_template_version"))


;;;; template alpha struct

(define-syntax-rule (template-alpha-initialise)
  (foreign-call "ikrt_template_alpha_initialise"))

(define-syntax-rule (template-alpha-finalise alpha)
  (foreign-call "ikrt_template_alpha_finalise" alpha))


;;;; still to be implemented

#;(define-syntax-rule (vicare-template)
  (foreign-call "ikrt_template"))


;;;; done

#| end of library |# )

;;; end of file
