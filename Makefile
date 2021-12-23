.POSIX:
.SUFFIXES:

SITE = localhost:8000

build: public FORCE

public:
	./scripts/build $(SITE)

clean: FORCE
	rm -rf public

watch: FORCE
	set +e; \
	while true; do \
		find scripts static templates | entr -d -- $(MAKE) clean build; \
	done

serve: public FORCE
	python3 -m http.server --directory public 8000

FORCE:
