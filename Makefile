
define module_gen =
    $1_BUILD_DIR := $(BUILD_DIR)/$($1_DIR)
    $1_FULL_SRCS := $(addprefix $($1_DIR)/,$($1_SOURCES))
    $1_OBJECTS := $$(patsubst %.c,$(BUILD_DIR)/%.o,$$($1_FULL_SRCS))
    $1_OBJ_DEP := $$($1_OBJECTS:.o=.d)

$1: $1_MKDIR
	echo target $@

endef

# lists of sources and objects
#mod_a_BUILD:=$(BUILD_DIR)/$(mod_a_DIR)
#common_FULL_SOURCES:=$(addprefix $(common_DIR)/,$(common_SOURCES))
#mod_a_obj:=$(patsubst %.c,$(BUILD_DIR)/%.o,$(mod_a_FULL_SOURCES))
#mod_a_obj_dep:=$(mod_a_obj:.o=.d)
#$(info $$(mod_a_obj) is [${mod_a_obj}])

BUILD_DIR := build
mod_a_DIR := module_a
mod_a_SOURCES := a.c a_util.c

.PHONY: all
all: mod_a

%_MKDIR:
	echo $*
	mkdir -p $($*_BUILD_DIR)

#mod_a: mod_a_MKDIR
#	echo $@

$(eval $(call module_gen,mod_a))

$(info $(mod_a_BUILD_DIR))
$(info $(mod_a_FULL_SRCS))
$(info $(mod_a_OBJECTS))
$(info $(mod_a_OBJ_DEP))

