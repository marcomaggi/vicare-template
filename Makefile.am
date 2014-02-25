## Process this file with automake to produce Makefile.in

ACLOCAL_AMFLAGS		= -I autotools
AUTOMAKE_OPTIONS	= foreign
EXTRA_DIST		= INSTALL configure.sh

slsdir			= $(srcdir)/lib
fasldir			= $(builddir)/lib
testdir			= $(srcdir)/tests
bundledlibsdir		= $(libdir)/vicare-scheme

CLEANFILES		=
MAINTAINERCLEANFILES	=
BUILT_SOURCES		=

#page
#### documentation

dist_doc_DATA			= README COPYING
AM_MAKEINFOFLAGS		= --no-split
info_TEXINFOS			= doc/vicare-template.texi
doc_vicare_template_TEXINFOS	= doc/fdl-1.3.texi doc/gpl-3.0.texi doc/macros.texi

#page
#### C language library

vicare_template_CURRENT	= @vicare_template_VERSION_INTERFACE_CURRENT@
vicare_template_REVISION= @vicare_template_VERSION_INTERFACE_REVISION@
vicare_template_AGE	= @vicare_template_VERSION_INTERFACE_AGE@
vicare_template_VERSION	= $(vicare_template_CURRENT):$(vicare_template_REVISION):$(vicare_template_AGE)

lib_LTLIBRARIES			= libvicare-template.la
libvicare_template_la_LDFLAGS	= -version-info $(vicare_template_VERSION)
libvicare_template_la_SOURCES	= \
	src/vicare-template-core.c		\
	src/vicare-template-version.c		\
	src/vicare-template-internals.h

#page
#### libraries

VICARE_COMPILE_LIBRARY_PATH	= $(fasldir):$(slsdir):$(VICARE_LIBRARY_PATH)
VICARE_COMPILE_FASL_PATH	= $(fasldir):$(VICARE_FASL_PATH)
VICARE_COMPILE_LD_PATH		= $(builddir)/.libs

VICARE_COMPILE_ENV	= \
	VICARE_LIBRARY_PATH=$(VICARE_COMPILE_LIBRARY_PATH);	export VICARE_LIBRARY_PATH;	\
	VICARE_FASL_PATH=$(VICARE_COMPILE_FASL_PATH);		export VICARE_FASL_PATH;	\
	LD_LIBRARY_PATH=$(VICARE_COMPILE_LD_PATH);		export LD_LIBRARY_PATH;		\
	DYLD_LIBRARY_PATH=$(VICARE_COMPILE_LD_PATH);		export DYLD_LIBRARY_PATH;
VICARE_COMPILE_FLAGS	= --fasl-directory $(fasldir) $(AX_VFLAGS) $(VFLAGS)
VICARE_COMPILE_RUN	= $(VICARE_COMPILE_ENV) vicare $(VICARE_COMPILE_FLAGS)

FASL_PREREQUISTES	= $(lib_LTLIBRARIES)

## --------------------------------------------------------------------

BUILT_SOURCES		+= lib/vicare/category/template/features.sls

noinst_PROGRAMS		= features
features_SOURCES	= lib/features.c

lib/vicare/category/template/features.sls : features
	$(MKDIR_P) lib/vicare/category && ./features >$@

CLEANFILES += lib/vicare/category/template/features.sls

## --------------------------------------------------------------------

EXTRA_DIST += \
	lib/libraries.scm			\
	scripts/build-makefile-rules.sps	\
	scripts/compile-all.sps			\
	scripts/compile-nausicaa.sps

.PHONY: dependencies

dependencies:
	$(VICARE_COMPILE_RUN) --print-loaded-libraries \
		--r6rs-script $(srcdir)/scripts/build-makefile-rules.sps >$(slsdir)/dependencies.make

include $(top_srcdir)/lib/dependencies.make

## --------------------------------------------------------------------

.PHONY: clean-fasl

clean-fasl:
	find $(fasldir) -name \*.fasl -execdir rm -v '{}' ';'

#page
#### running the test suite: test files selection

VICARE_TEMPLATE_PLAIN_TESTS		= \
	tests/test-vicare-template.sps

VICARE_TEMPLATE_NAU_TESTS		= \
	tests/test-nausicaa-template.sps

TESTS	= $(VICARE_TEMPLATE_PLAIN_TESTS)
if WANT_NAUSICAA
TESTS	+= $(VICARE_TEMPLATE_NAU_TESTS)
endif

EXTRA_DIST += \
	$(VICARE_TEMPLATE_PLAIN_TESTS)		\
	$(VICARE_TEMPLATE_NAU_TESTS)		\
	\
	tests/demo-for-plain-documentation.sps	\
	tests/demo-for-nausicaa-documentation.sps

VICARE_SELECTED_TESTS		= $(testdir)/test-*$(file)*.sps
VICARE_SELECTED_DEMOS		= $(testdir)/demo-*$(file)*.sps

#page
#### running the test suite: recipes

VICARE_TEST_FASL_PATH	= $(fasldir):$(VICARE_FASL_PATH)
VICARE_TEST_SEARCH_PATH	= $(testdir):$(slsdir):$(fasldir)
VICARE_TEST_LD_PATH	= $(builddir)/.libs:$(LD_LIBRARY_PATH)
VICARE_TEST_DYLD_PATH	= $(builddir)/.libs:$(DYLD_LIBRARY_PATH)

VICARE_TEST_FLAGS	= $(AX_VFLAGS) $(VFLAGS) --r6rs-script
VICARE_TEST_ENV		= \
	VICARE_LIBRARY_PATH=$(VICARE_TEST_SEARCH_PATH);	export VICARE_LIBRARY_PATH;	\
	VICARE_FASL_PATH=$(VICARE_TEST_FASL_PATH);	export VICARE_FASL_PATH;	\
	CHECK_TEST_NAME=$(name);			export CHECK_TEST_NAME;		\
	LD_LIBRARY_PATH=$(VICARE_TEST_LD_PATH);		export LD_LIBRARY_PATH;		\
	DYLD_LIBRARY_PATH=$(VICARE_TEST_DYLD_PATH);	export DYLD_LIBRARY_PATH;
VICARE_TEST_RUN		= $(VICARE_TEST_ENV) $(GDB) $(VICARE) $(VICARE_TEST_FLAGS)

## --------------------------------------------------------------------
## interface to "make check"

# Read "Parallel Test Harness" in the documentation of GNU Automake to
# understand how to use this interface for "make check".
#
# We must make sure that this ends with a semicolon!!!
AM_TESTS_ENVIRONMENT	= VICARE_CHECK_QUIET=yes; export VICARE_CHECK_QUIET; $(VICARE_TEST_ENV)
TEST_EXTENSIONS		= .sps
SPS_LOG_COMPILER	= $(VICARE)
AM_SPS_LOG_FLAGS	= $(AX_VFLAGS) $(VFLAGS)

## --------------------------------------------------------------------

.PHONY: test tests demo demos

test tests:
	@echo
	@for f in $(VICARE_SELECTED_TESTS); do $(VICARE_TEST_RUN) $$f; done
	@echo

demo demos:
	@echo
	@for f in $(VICARE_SELECTED_DEMOS); do $(VICARE_TEST_RUN) $$f; done
	@echo

#page
#### interface to "make installcheck"

VICARE_INSTCHECK_LIBRARY_PATH	= $(DESTDIR)$(bundledlibsdir):$(VICARE_LIBRARY_PATH)
VICARE_INSTCHECK_FASL_PATH	= $(DESTDIR)$(bundledlibsdir):$(VICARE_FASL_PATH)
VICARE_INSTCHECK_LD_PATH	= $(DESTDIR)$(libdir):$(LD_LIBRARY_PATH)
VICARE_INSTCHECK_DYLD_PATH	= $(DESTDIR)$(libdir):$(DYLD_LIBRARY_PATH)

VICARE_INSTCHECK_FLAGS	= --print-loaded-libraries $(AX_VFLAGS) $(VFLAGS)
VICARE_INSTCHECK_ENV	= \
	VICARE_LIBRARY_PATH=$(VICARE_INSTCHECK_LIBRARY_PATH);	export VICARE_LIBRARY_PATH;	\
	VICARE_FASL_PATH=$(VICARE_INSTCHECK_FASL_PATH);		export VICARE_FASL_PATH;	\
	LD_LIBRARY_PATH=$(VICARE_INSTCHECK_LD_PATH);		export LD_LIBRARY_PATH;		\
	DYLD_LIBRARY_PATH=$(VICARE_INSTCHECK_DYLD_PATH);	export DYLD_LIBRARY_PATH;	\
	VICARE_SRC_DIR=$(srcdir);				export VICARE_SRC_DIR;		\
	VICARE_CHECK_QUIET=no;					export VICARE_CHECK_QUIET;
VICARE_INSTCHECK_RUN	= $(VICARE_INSTCHECK_ENV) $(VICARE) $(VICARE_INSTCHECK_FLAGS)

installcheck-local:
	@for f in $(TESTS); do $(VICARE_INSTCHECK_RUN) $(srcdir)/$$f; done

#page
#### running vicare with the path for loading libraries

VICARE_TERMINAL_FASL_PATH	= $(fasldir):$(VICARE_FASL_PATH)
VICARE_TERMINAL_SEARCH_PATH	= $(testdir):$(slsdir):$(fasldir)
VICARE_TERMINAL_LD_PATH		= $(builddir)/.libs:$(LD_LIBRARY_PATH)
VICARE_TERMINAL_DYLD_PATH	= $(builddir)/.libs:$(DYLD_LIBRARY_PATH)

VICARE_TERMINAL_RUN_FLAGS	= --print-loaded-libraries $(AX_VFLAGS) $(VFLAGS)
VICARE_TERMINAL_RUN_ENV		= \
	VICARE_FASL_PATH=$(VICARE_TERMINAL_FASL_PATH);		export VICARE_FASL_PATH;	\
	VICARE_LIBRARY_PATH=$(VICARE_TERMINAL_SEARCH_PATH);	export VICARE_LIBRARY_PATH;	\
	VICARE_SRC_DIR=$(srcdir);				export VICARE_SRC_DIR;		\
	VICARE_BUILDDIR=$(builddir);				export VICARE_BUILDDIR;		\
	LD_LIBRARY_PATH=$(VICARE_TERMINAL_LD_PATH);		export LD_LIBRARY_PATH;		\
	DYLD_LIBRARY_PATH=$(VICARE_TERMINAL_DYLD_PATH);		export DYLD_LIBRARY_PATH;
VICARE_TERMINAL_RUN	= $(VICARE_TERMINAL_RUN_ENV) $(VICARE) $(VICARE_TERMINAL_RUN_FLAGS)
VICARE_TERMINAL_VIE	= $(VICARE_TERMINAL_RUN_ENV) vie $(VICARE_TERMINAL_RUN_FLAGS)

.PHONY: test-vie test-run

test-run:
	$(VICARE_TERMINAL_RUN)

test-vie:
	$(VICARE_TERMINAL_VIE)

### end of file
