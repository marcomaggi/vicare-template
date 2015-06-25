;;; -*- coding: utf-8-unix -*-
;;;
;;;Part of: Vicare/Template
;;;Contents: Nausicaa API
;;;Date: Mon Sep 30, 2013
;;;
;;;Abstract
;;;
;;;
;;;
;;;Copyright (C) 2013, 2014, 2015 Marco Maggi <marco.maggi-ipsu@poste.it>
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


#!vicare
(library (nausicaa category template)
  (options visit-upon-loading tagged-language)
  (export

    ;; version numbers and strings
    vicare-template-version-interface-current
    vicare-template-version-interface-revision
    vicare-template-version-interface-age
    vicare-template-version

    ;; label
    <template-alpha>
    )
  (import (nausicaa)
    (vicare category template))


;;;; label wrapper for struct "template-alpha"

(define-label <template-alpha>
  (predicate template-alpha?)
  (protocol (lambda () template-alpha-initialise))

;;; common objects stuff

  (virtual-fields
   (mutable {destructor <procedure>}
	    template-alpha-custom-destructor
	    set-template-alpha-custom-destructor!))

  (methods
   (alive?		template-alpha?/alive)
   (finalise		template-alpha-finalise)

   (putprop		template-alpha-putprop)
   (getprop		template-alpha-getprop)
   (remprop		template-alpha-remprop)
   (property-list	template-alpha-property-list)

   (hash		template-alpha-hash))

;;;

  #| end of label |# )


;;;; done

)

;;; end of file
