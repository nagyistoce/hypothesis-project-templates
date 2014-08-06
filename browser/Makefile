npmbin := $(shell npm bin)
runner := $(npmbin)/mocha-phantomjs
linter := $(npmbin)/coffeelint
browserify := $(npmbin)/browserify

testfiles := $(wildcard test/tests/*-test.coffee)
testindex := test/index.coffee
testsuite := test/suite.js

define USAGE
Usage instructions:
    make test                 runs the test suite using phantomjs
    make test grep=[filter]   runs the tests matching filter
    make lint                 runs the linter on the project
    make clean                removes any built files
    make help                 displays this message
endef
export USAGE

.DEFAULT: help

.PHONY: help
help:
	@echo "$$USAGE"

.PHONY: clean
clean:
	rm $(testsuite) $(testindex)

reporter ?= dot
.PHONY: test
test: $(testsuite) $(runner)
	"$(runner)" "test/index.html?grep=$(grep)" --reporter=$(reporter)

.PHONY: lint
lint: $(linter)
	"$(linter)" *.coffee test

$(testsuite): $(testindex) $(browserify)
	"$(browserify)" --transform=coffeeify --extension='.coffee' $(testindex) > $@

$(testindex): $(testfiles)
	echo "$?" | tr " " "\n" | sed -e 's/^test\/tests\/\(.*\)\.coffee$$/require(".\/tests\/\1")/g' > $@

$(runner) $(linter) $(browserify): $(npmbin)

$(npmbin):
	npm install --quiet
