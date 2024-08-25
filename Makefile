
MESON = meson
BUILD_DIR = build
TOOLCHAINS = toolchain
CONFIG = config.ini

.DEFAULT_GOAL = x86

$(BUILD_DIR):
	$(MESON) setup $(BUILD_DIR) --cross-file $(TOOLCHAINS)/x86-none-elf.ini

.PHONY = x86
x86: $(BUILD_DIR)
	cd $(BUILD_DIR); $(MESON) compile

.PHONY = boot-x86
boot-x86:
	cd $(BUILD_DIR); $(MESON) compile boot

.PHONY = boot
boot: boot-x86

clean:
	rm -rf $(BUILD_DIR)
