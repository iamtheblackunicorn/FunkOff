build: ; cd .. && tar -cvzf FunkOff.tgz FunkOff && mv FunkOff.tgz FunkOff && ls
test: ; dart pub get && dart analyze && cd example && mv lib bin && mv bin/main.dart bin/example.dart && dart pub get && dart run
