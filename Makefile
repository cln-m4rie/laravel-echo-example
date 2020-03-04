default: | help

format:  ## format code
	php-cs-fixer fix app/ && \
	php-cs-fixer fix routes/ && \
	php-cs-fixer fix config/ && \
	php-cs-fixer fix database/ && \
	php-cs-fixer fix tests/

init:
	php artisan key:generate && \
	php artisan jwt:secret && \
	php artisan migrate

help:  ## Show all of tasks
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
