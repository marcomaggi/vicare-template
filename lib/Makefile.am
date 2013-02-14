## Process this file with automake to produce Makefile.in

EXTRA_DIST	= \
	vicare/category/template/constants.sls.in

# These files are hand-written.
nobase_dist_libvicare_DATA = \
	vicare/category/template.sls			\
	vicare/category/template/unsafe-capi.sls

# These files are created at configuration or make time.
nobase_nodist_libvicare2_DATA = \
	vicare/category/template/constants.sls		\
	vicare/category/template/features.sls

# if WANT_NAUSICAA
# nobase_dist_libvicare_DATA	+= nausicaa/category/template.vicare.sls
# endif

VICARE_LIB_INFIX	= category/template

include $(top_srcdir)/meta/makefiles/lib.am

### end of file
