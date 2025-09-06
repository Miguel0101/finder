APP = finder
LIB = libfinder.a
CC = g++
CFLAGS = -std=c++23 -O3 -I./include
LDFLAGS =
SRC_DIR = ./src
BUILD_DIR = ./build
LIB_DIR = /usr/lib
INSTALL_DIR = /usr/bin

# Catch all source files
SRCS = $(shell find $(SRC_DIR) -name *.cpp)
OBJS = $(patsubst $(SRC_DIR)/%.cpp,$(BUILD_DIR)/%.o,$(SRCS))

default: build

build: $(BUILD_DIR)/$(LIB) $(BUILD_DIR)/$(APP)

$(BUILD_DIR)/$(APP): $(OBJS)
	@echo "[*] Linking $@..."
	@mkdir -p $(dir $@)
	@$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	@echo "[*] Compiling $<..."
	@mkdir -p $(dir $@)
	@$(CC) $(CFLAGS) -c $< -o $@

$(BUILD_DIR)/$(LIB): $(OBJS)
	@echo "[*] Creating static library $@..."
	@mkdir -p $(dir $@)
	@ar rcs $@ $^

install: $(BUILD_DIR)/$(APP) $(BUILD_DIR)/$(LIB)
	@echo "[*] Installing $(APP)..."
	@cp $(BUILD_DIR)/$(APP) $(INSTALL_DIR)/$(APP)
	@chmod 755 $(INSTALL_DIR)/$(APP)
	@echo "[*] Installing $(LIB)..."
	@cp $(BUILD_DIR)/$(LIB) $(LIB_DIR)/
	@chmod 644 $(LIB_DIR)/$(LIB)

uninstall:
	@echo "[*] Deleting $(INSTALL_DIR)/$(APP)..."
	@rm -f $(INSTALL_DIR)/$(APP)
	@echo "[*] Deleting $(LIB_DIR)/$(LIB)..."
	@rm -f $(LIB_DIR)/$(LIB)

clean:
	@echo "[*] Removing $(BUILD_DIR)..."
	@rm -rf $(BUILD_DIR)

.PHONY: build install uninstall clean
