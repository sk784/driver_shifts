server:
	cd server && dart run bin/server.dart

run:
	flutter run

web:
	flutter run -d chrome

codegen:
	dart run build_runner build --delete-conflicting-outputs

test:
	cd server && dart test
	flutter test

.PHONY: server run web codegen test
