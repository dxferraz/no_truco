install: ## Default rule, does everything needed to run the project
install: deps loc

check: ## Run linter and tests (automatic before every push)
check: lint test

clean: ## Clean everything
	@echo "╠ Cleaning the project..."
	@flutter clean

lint: ## Lint the code (included in check)
	@dart analyze . --fatal-infos --fatal-warnings

test: ## Run tests (included in check)
	@flutter test || (echo "Error while running tests"; exit 1)

deps: ## Install dependencies (included in install)
	@echo "╠ Installing dependencies..."
	@flutter pub get

loc: ## Generate localization files (included in build)
	@echo "╠ Generating localization files"
	@flutter gen-l10n

run: ## Run the app from the command line
	@echo "╠ Running the app"
	@flutter run