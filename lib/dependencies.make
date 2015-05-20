## dependencies.make --
#
# Automatically built.

EXTRA_DIST +=  \
	lib/vicare/category/template/constants.vicare.sls.in

lib/vicare/category/template.fasl: \
		lib/vicare/category/template.vicare.sls \
		lib/vicare/category/template/constants.fasl \
		lib/vicare/category/template/unsafe-capi.fasl \
		$(FASL_PREREQUISITES)
	$(VICARE_COMPILE_RUN) --output $@ --compile-library $<

lib_vicare_category_template_fasldir = $(bundledlibsdir)/vicare/category
lib_vicare_category_template_vicare_slsdir  = $(bundledlibsdir)/vicare/category
nodist_lib_vicare_category_template_fasl_DATA = lib/vicare/category/template.fasl
if WANT_INSTALL_SOURCES
dist_lib_vicare_category_template_vicare_sls_DATA = lib/vicare/category/template.vicare.sls
endif
EXTRA_DIST += lib/vicare/category/template.vicare.sls
CLEANFILES += lib/vicare/category/template.fasl

lib/vicare/category/template/constants.fasl: \
		lib/vicare/category/template/constants.vicare.sls \
		$(FASL_PREREQUISITES)
	$(VICARE_COMPILE_RUN) --output $@ --compile-library $<

lib_vicare_category_template_constants_fasldir = $(bundledlibsdir)/vicare/category/template
lib_vicare_category_template_constants_vicare_slsdir  = $(bundledlibsdir)/vicare/category/template
nodist_lib_vicare_category_template_constants_fasl_DATA = lib/vicare/category/template/constants.fasl
if WANT_INSTALL_SOURCES
dist_lib_vicare_category_template_constants_vicare_sls_DATA = lib/vicare/category/template/constants.vicare.sls
endif
CLEANFILES += lib/vicare/category/template/constants.fasl

lib/vicare/category/template/unsafe-capi.fasl: \
		lib/vicare/category/template/unsafe-capi.vicare.sls \
		$(FASL_PREREQUISITES)
	$(VICARE_COMPILE_RUN) --output $@ --compile-library $<

lib_vicare_category_template_unsafe_capi_fasldir = $(bundledlibsdir)/vicare/category/template
lib_vicare_category_template_unsafe_capi_vicare_slsdir  = $(bundledlibsdir)/vicare/category/template
nodist_lib_vicare_category_template_unsafe_capi_fasl_DATA = lib/vicare/category/template/unsafe-capi.fasl
if WANT_INSTALL_SOURCES
dist_lib_vicare_category_template_unsafe_capi_vicare_sls_DATA = lib/vicare/category/template/unsafe-capi.vicare.sls
endif
EXTRA_DIST += lib/vicare/category/template/unsafe-capi.vicare.sls
CLEANFILES += lib/vicare/category/template/unsafe-capi.fasl

lib/vicare/category/template/features.fasl: \
		lib/vicare/category/template/features.vicare.sls \
		$(FASL_PREREQUISITES)
	$(VICARE_COMPILE_RUN) --output $@ --compile-library $<

lib_vicare_category_template_features_fasldir = $(bundledlibsdir)/vicare/category/template
lib_vicare_category_template_features_vicare_slsdir  = $(bundledlibsdir)/vicare/category/template
nodist_lib_vicare_category_template_features_fasl_DATA = lib/vicare/category/template/features.fasl
if WANT_INSTALL_SOURCES
dist_lib_vicare_category_template_features_vicare_sls_DATA = lib/vicare/category/template/features.vicare.sls
endif
CLEANFILES += lib/vicare/category/template/features.fasl

lib/nausicaa/category/template.fasl: \
		lib/nausicaa/category/template.vicare.sls \
		lib/vicare/category/template.fasl \
		$(FASL_PREREQUISITES)
	$(VICARE_COMPILE_RUN) --output $@ --compile-library $<

if WANT_NAUSICAA
lib_nausicaa_category_template_fasldir = $(bundledlibsdir)/nausicaa/category
lib_nausicaa_category_template_vicare_slsdir  = $(bundledlibsdir)/nausicaa/category
nodist_lib_nausicaa_category_template_fasl_DATA = lib/nausicaa/category/template.fasl
if WANT_INSTALL_SOURCES
dist_lib_nausicaa_category_template_vicare_sls_DATA = lib/nausicaa/category/template.vicare.sls
endif
EXTRA_DIST += lib/nausicaa/category/template.vicare.sls
CLEANFILES += lib/nausicaa/category/template.fasl
endif


### end of file
# Local Variables:
# mode: makefile-automake
# End:
