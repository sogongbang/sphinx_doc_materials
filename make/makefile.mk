###############################################################################

LIBRARY_DIR ?= ../..

###############################################################################

include $(LIBRARY_DIR)/ubinos/make/common.mk
-include $(LIBRARY_DIR)/ubinos/make/custom.mk

###############################################################################

include $(_CONFIG_DIR)/$(_CONFIG_NAME).mk

###############################################################################

config:
	$(call begin_message)
	$(_PRECMD) && mkdir -p "$(_OUTPUT_DIR)"
	$(call end_message)

menuconfig:
	$(call begin_message)
	$(call end_message)

xconfig:
	$(call begin_message)
	$(call end_message)

build: doc
	$(call begin_message)
	$(call end_message)

load:
	$(call begin_message)
	$(call end_message)

reset:
	$(call begin_message)
	$(call end_message)

run:
	$(call begin_message)
	$(call end_message)

xrun: xopendoc
	$(call begin_message)
	$(call end_message)

doc:
	$(call begin_message)
	$(_PRECMD) && sphinx-build -M html     "$(_CONFIG_DIR)/$(APP__NAME)/doc" "$(_OUTPUT_DIR)"
	# $(_PRECMD) && sphinx-build -M latexpdf "$(_CONFIG_DIR)/$(APP__NAME)/doc" "$(_OUTPUT_DIR)"
	$(call end_message)

xopendoc:
	$(call begin_message)
	$(shell python "$(_TOOLBOX)" get_open_command_for_cmake) "$(_OUTPUT_DIR)/html/index.html"
	# $(shell python "$(_TOOLBOX)" get_open_command_for_cmake) "$(_OUTPUT_DIR)/latex/$(LATEX_FILE_NAME).pdf"
	$(call end_message)

cleandoc:
	$(call begin_message)
	$(_PRECMD) && sphinx-build -M clean    "$(_CONFIG_DIR)/$(APP__NAME)/doc" "$(_OUTPUT_DIR)"
	$(call end_message)

clean: cleandoc
	$(call begin_message)
	$(call end_message)

cleand:
	$(call begin_message)
	$(_PRECMD) && rm -rf "$(_OUTPUT_DIR)"
	$(call end_message)

%: common-% ;

###############################################################################


