## Process this file with automake to produce Makefile.in

EXTRA_DIST	= \
	vicare/template/constants.sls.in

# These files are hand-written.
nobase_dist_libvicare_DATA = \
	vicare/template.sls			\
	vicare/template/unsafe-capi.sls

# These files are created at configuration or make time.
nobase_nodist_libvicare2_DATA = \
	vicare/template/constants.sls		\
	vicare/template/features.sls

# if WANT_NAUSICAA
# nobase_dist_libvicare_DATA	+= nausicaa/category/template.vicare.sls
# endif

include $(top_srcdir)/meta/makefiles/lib.am

### end of file
