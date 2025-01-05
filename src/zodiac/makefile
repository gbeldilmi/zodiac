#------------------------------------------------------------------------------#
# Project name and installation directories                                    #
#------------------------------------------------------------------------------#
PROJECT_NAME    := zodiac
BINARY_FILE     := $(PROJECT_NAME)
INCLUDE_DIR     := include
SOURCE_DIR      := source
BUILD_DIR       := build
PACKAGE_DIR     := package
H_FILES         := $(wildcard $(INCLUDE_DIR)/*.h)
C_FILES         := $(wildcard $(SOURCE_DIR)/*.c) $(wildcard $(SOURCE_DIR)/*/*.c)
O_FILES         := $(C_FILES:$(SOURCE_DIR)/%.c=$(BUILD_DIR)/%.o)

#------------------------------------------------------------------------------#
# Options for code generation                                                  #
#------------------------------------------------------------------------------#
INCLUDES_FLAGS  := -I $(INCLUDE_DIR)/
LIBRARIES_FLAGS :=
C_FLAGS         := -Wall -Werror -Wextra -O3
LD_FLAGS        :=

#------------------------------------------------------------------------------#
# Commands                                                                     #
#------------------------------------------------------------------------------#
.PHONY : all, test, package, clean
all : $(BUILD_DIR)/$(BINARY_FILE)
test : all
	##
package: all
	mkdir -pv $(PACKAGE_DIR)/usr/bin
	cp -v $(BUILD_DIR)/$(BINARY_FILE) $(PACKAGE_DIR)/usr/bin/
clean :
	rm -rfv $(BUILD_DIR) $(PACKAGE_DIR)

#------------------------------------------------------------------------------#
# Dependencies                                                                 #
#------------------------------------------------------------------------------#
$(BUILD_DIR)/%.o : $(SOURCE_DIR)/%.c
	mkdir -pv $(dir $@)
	gcc -v $(C_FLAGS) -c $< -o $@ $(INCLUDES_FLAGS)
$(BUILD_DIR)/$(BINARY_FILE) : $(O_FILES)
	gcc -v $(LD_FLAGS) $^ -o $@ $(LIBRARIES_FLAGS)
