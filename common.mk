INCLUDE_DIR := config/makefile
INCLUDE_FILES := color.mk funcs.mk rules.mk flags.mk

ifndef TOPDIR
    $(error TOPDIR is not defined)
endif

# Use foreach to include multiple files
$(foreach file,$(INCLUDE_FILES),$(eval include $(TOPDIR)/$(INCLUDE_DIR)/$(file)))
