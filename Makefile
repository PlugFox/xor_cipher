-include *.mk

.PHONY: clean format get upgrade outdated codegen test coverage pana deploy

clean:
	@rm -rf coverage pubspec.lock .packages .dart_tool

format:
	@dart fix --apply .
	@dart format -l 80 --fix .

get:
	@dart pub get

upgrade: get
	@dart pub upgrade

outdated:
	@dart pub outdated --transitive --show-all --dev-dependencies --dependency-overrides

#codegen: get
#	@dart run build_runner build --delete-conflicting-outputs --release
#	@dart format -l 80 --fix .

test:
	@dart test --concurrency=6 --platform vm --coverage=coverage test/*

coverage: test
	@dart run coverage:format_coverage --lcov --in=coverage --out=coverage/lcov.info --packages=.packages --report-on=lib
	@genhtml -o coverage coverage/lcov.info

pana:
	@dart pub global activate pana && pana --json --no-warning --line-length 80

deploy:
	@dart pub publish