;; libraries.scm --
;;
;;This file is meant to be included by the build dependencies script, so
;;it must be in the sources search path.

(define-constant FROM-TEMPLATES-SOURCE-FILES
  '("lib/vicare/category/template/constants.sls"))

(define-constant BUILT-SOURCE-FILES
  '("lib/vicare/category/template/features.sls"))

(define-constant LIBRARIES-SPECS
  '((()
     (vicare category template)
     (vicare category template unsafe-capi)
     (vicare category template constants)
     (vicare category template features))
    ((WANT_NAUSICAA)
     (nausicaa category template))))

;;; end of file
;; Local Variables:
;; mode: vicare
;; End:
