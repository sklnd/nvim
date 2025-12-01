.PHONY: lint format check

# Lua files are in nvim/
# Nix files are in the root and nix/

lint:
	@echo "Linting Lua files..."
	luacheck nvim/
	@echo "Linting Nix files..."
	statix check .
	deadnix .

format:
	@echo "Formatting with treefmt..."
	treefmt

check: lint
	@echo "Checking formatting with treefmt..."
	treefmt --fail-on-change
