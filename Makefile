.PHONY: help sync format format-check lint lint-fix document test cov check render ci clean
.DEFAULT_GOAL := help

help: ## Show tasks
	@grep -E '^[a-zA-Z_-]+:.*?## ' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-14s %s\n", $$1, $$2}'

sync: ## Install packages (rv sync)
	rv sync

format: ## Format code (air)
	air format .

format-check: ## Check formatting (air)
	air format . --check

lint: ## Run linter (jarl)
	jarl check .

lint-fix: ## Apply linter fixes (jarl)
	jarl check . --fix

document: ## Update NAMESPACE and man/ (roxygen2)
	Rscript -e 'devtools::document()'

test: ## Run tests
	Rscript -e 'devtools::test()'

cov: ## Compute test coverage
	Rscript -e 'print(covr::package_coverage())'

check: ## R CMD check
	Rscript -e 'devtools::check()'

render: ## Render Quarto notebooks
	quarto render notebooks

ci: format-check lint test check ## Run all CI tasks

clean: ## Remove generated files
	rm -rf coverage.xml docs notebooks/_output notebooks/.quarto *.Rcheck *.tar.gz
