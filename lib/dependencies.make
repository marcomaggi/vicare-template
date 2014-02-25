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
nodist_lib_vicare_category_template_fasl_DATA = lib/vicare/category/template.fasl
EXTRA_DIST += lib/vicare/category/template.sls
CLEANFILES += lib/vicare/category/template.fasl

lib/vicare/category/template/constants.fasl: \
		lib/vicare/category/template/constants.sls \
		$(FASL_PREREQUISITES)
	$(VICARE_COMPILE_RUN) --output $@ --compile-library $<

lib_vicare_category_template_constants_fasldir = $(bundledlibsdir)/vicare/category/template
nodist_lib_vicare_category_template_constants_fasl_DATA = lib/vicare/category/template/constants.fasl
CLEANFILES += lib/vicare/category/template/constants.fasl

lib/vicare/category/template/unsafe-capi.fasl: \
		lib/vicare/category/template/unsafe-capi.sls \
		$(FASL_PREREQUISITES)
	$(VICARE_COMPILE_RUN) --output $@ --compile-library $<

lib_vicare_category_template_unsafe_capi_fasldir = $(bundledlibsdir)/vicare/category/template
nodist_lib_vicare_category_template_unsafe_capi_fasl_DATA = lib/vicare/category/template/unsafe-capi.fasl
EXTRA_DIST += lib/vicare/category/template/unsafe-capi.sls
CLEANFILES += lib/vicare/category/template/unsafe-capi.fasl

lib/vicare/category/template/features.fasl: \
		lib/vicare/category/template/features.sls \
		$(FASL_PREREQUISITES)
	$(VICARE_COMPILE_RUN) --output $@ --compile-library $<

lib_vicare_category_template_features_fasldir = $(bundledlibsdir)/vicare/category/template
nodist_lib_vicare_category_template_features_fasl_DATA = lib/vicare/category/template/features.fasl
CLEANFILES += lib/vicare/category/template/features.fasl

lib/nausicaa/category/template.fasl: \
		lib/nausicaa/category/template.vicare.sls \
		lib/vicare/category/template.fasl \
		$(FASL_PREREQUISITES)
	$(VICARE_COMPILE_RUN) --output $@ --compile-library $<

if WANT_NAUSICAA
lib_nausicaa_category_template_fasldir = $(bundledlibsdir)/nausicaa/category
nodist_lib_nausicaa_category_template_fasl_DATA = lib/nausicaa/category/template.fasl
EXTRA_DIST += lib/nausicaa/category/template.vicare.sls
CLEANFILES += lib/nausicaa/category/template.fasl
endif


### end of file
# Local Variables:
# mode: makefile-automake
# End:
