## dependencies.make --
#
# Automatically built.

EXTRA_DIST +=  \
	lib/vicare/category/template/constants.sls.in

lib/vicare/category/template.fasl: \
		lib/vicare/category/template.sls \
		lib/vicare/category/template/constants.fasl \
		lib/vicare/category/template/unsafe-capi.fasl \
		$(FASL_PREREQUISITES)
	$(VICARE_COMPILE_RUN) --output $@ --compile-library $<

lib_vicare_category_template_fasldir = $(bundledlibsdir)/vicare/category
lib_vicare_category_template_slsdir  = $(bundledlibsdir)/vicare/category
nodist_lib_vicare_category_template_fasl_DATA = lib/vicare/category/template.fasl
if WANT_INSTALL_SOURCES
dist_lib_vicare_category_template_sls_DATA = lib/vicare/category/template.sls
endif
EXTRA_DIST += lib/vicare/category/template.sls
CLEANFILES += lib/vicare/category/template.fasl

lib/vicare/category/template/constants.fasl: \
		lib/vicare/category/template/constants.sls \
		$(FASL_PREREQUISITES)
	$(VICARE_COMPILE_RUN) --output $@ --compile-library $<

lib_vicare_category_template_constants_fasldir = $(bundledlibsdir)/vicare/category/template
lib_vicare_category_template_constants_slsdir  = $(bundledlibsdir)/vicare/category/template
nodist_lib_vicare_category_template_constants_fasl_DATA = lib/vicare/category/template/constants.fasl
if WANT_INSTALL_SOURCES
dist_lib_vicare_category_template_constants_sls_DATA = lib/vicare/category/template/constants.sls
endif
CLEANFILES += lib/vicare/category/template/constants.fasl

lib/vicare/category/template/unsafe-capi.fasl: \
		lib/vicare/category/template/unsafe-capi.sls \
		$(FASL_PREREQUISITES)
	$(VICARE_COMPILE_RUN) --output $@ --compile-library $<

lib_vicare_category_template_unsafe_capi_fasldir = $(bundledlibsdir)/vicare/category/template
lib_vicare_category_template_unsafe_capi_slsdir  = $(bundledlibsdir)/vicare/category/template
nodist_lib_vicare_category_template_unsafe_capi_fasl_DATA = lib/vicare/category/template/unsafe-capi.fasl
if WANT_INSTALL_SOURCES
dist_lib_vicare_category_template_unsafe_capi_sls_DATA = lib/vicare/category/template/unsafe-capi.sls
endif
EXTRA_DIST += lib/vicare/category/template/unsafe-capi.sls
CLEANFILES += lib/vicare/category/template/unsafe-capi.fasl

lib/vicare/category/template/features.fasl: \
		lib/vicare/category/template/features.sls \
		$(FASL_PREREQUISITES)
	$(VICARE_COMPILE_RUN) --output $@ --compile-library $<

lib_vicare_category_template_features_fasldir = $(bundledlibsdir)/vicare/category/template
lib_vicare_category_template_features_slsdir  = $(bundledlibsdir)/vicare/category/template
nodist_lib_vicare_category_template_features_fasl_DATA = lib/vicare/category/template/features.fasl
if WANT_INSTALL_SOURCES
dist_lib_vicare_category_template_features_sls_DATA = lib/vicare/category/template/features.sls
endif
CLEANFILES += lib/vicare/category/template/features.fasl


### end of file
# Local Variables:
# mode: makefile-automake
# End:
