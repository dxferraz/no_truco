install: ## Default rule, does everything needed to run the project
install: deps loc

check: ## Run linter and tests (automatic before every push)
check: lint test

clean: ## Clean everything
	@echo "╠ Cleaning the project..."
	@fvm flutter clean

lint: ## Lint the code (included in check)
	@dart analyze . --fatal-infos --fatal-warnings

test: ## Run tests (included in check)
	@flutter test || (echo "Error while running tests"; exit 1)

deps: ## Install dependencies (included in install)
	@echo "╠ Installing dependencies..."
	@flutter pub get
	@dart run husky install

loc: ## Generate localization files (included in build)
	@echo "╠ Generating localization files"
	@fvm flutter gen-l10n

run: ## Run the app from the command line
	@echo "╠ Running the app"
	@flutter run --flavor development --dart-define-from-file=.env.json

# From https://gist.github.com/prwhite/8168133#gistcomment-1313022
help:
	@IFS=$$'\n' ; \
	help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
	for help_line in $${help_lines[@]}; do \
		IFS=$$'#' ; \
		help_split=($$help_line) ; \
		help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		printf "%-30s %s\n" $$help_command $$help_info ; \
	done

.PHONY: build test