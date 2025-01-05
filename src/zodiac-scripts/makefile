#------------------------------------------------------------------------------#
# Project name, files and directories                                          #
#------------------------------------------------------------------------------#
PROJECT_NAME    := zodiac-scripts
SOURCE_DIR      := source
BUILD_DIR       := build
PACKAGE_DIR     := package
SOURCE_FILES    := $(wildcard $(SOURCE_DIR)/*.sh)
BUILD_FILES     := $(SOURCE_FILES:$(SOURCE_DIR)/%.sh=$(BUILD_DIR)/%)

#------------------------------------------------------------------------------#
# Commands                                                                     #
#------------------------------------------------------------------------------#
.PHONY : all, test, package, clean
all : $(BUILD_FILES)
test : all
	##
package: all
	mkdir -pv $(PACKAGE_DIR)/usr/bin
	cp -frv $(BUILD_DIR)/* $(PACKAGE_DIR)/usr/bin
clean :
	rm -rfv $(BUILD_DIR) $(PACKAGE_DIR)

#------------------------------------------------------------------------------#
# Dependencies                                                                 #
#------------------------------------------------------------------------------#
$(BUILD_DIR)/% : $(SOURCE_DIR)/%.sh
	mkdir -pv $(dir $@)
	cp -v $< $@
	chmod +x $@
