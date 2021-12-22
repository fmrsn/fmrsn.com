.POSIX:
.SUFFIXES:

SITE = localhost:8000

build: public FORCE

public:
	SITE=$(SITE) ./scripts/build

clean: FORCE
	rm -rf public

watch: FORCE
	set +e; \
	while true; do \
		find scripts static templates | entr -d -- $(MAKE) clean public; \
	done

serve: public FORCE
	python3 -m http.server --directory public 8000

FORCE:
