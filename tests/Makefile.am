## Process this file with automake to produce Makefile.in

VICARE_TEMPLATE_PLAIN_TESTS		= \
	test-vicare-template.sps

VICARE_TEMPLATE_NAU_TESTS		= \
	test-nausicaa-template.sps

TESTS	= $(VICARE_TEMPLATE_PLAIN_TESTS)
if WANT_NAUSICAA
TESTS	+= $(VICARE_TEMPLATE_NAU_TESTS)
endif

EXTRA_DIST = \
	$(VICARE_TEMPLATE_PLAIN_TESTS)		\
	$(VICARE_TEMPLATE_NAU_TESTS)		\
	\
	demo-for-plain-documentation.sps	\
	demo-for-nausicaa-documentation.sps

include $(top_srcdir)/meta/makefiles/tests.am

### end of file
