.POSIX:
.SUFFIXES:

public: clean FORCE
	cp -r static $@
	sh templates/index.html.sh >$@/index.html
	sh templates/sitemap.xml.sh >$@/sitemap.xml
	minify -ro ./ $@/

watch: FORCE
	{ python3 -m http.server --directory public & }; \
	python3=$$! ; \
	trap "kill $$python3" EXIT INT TERM; \
	find static templates | entr -d -- $(MAKE) public

clean: FORCE
	rm -rf public

FORCE:
