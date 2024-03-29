examples:
	pandoc examples/code-block.md -o examples/code-block.html -s \
		--lua-filter lua-filters/filter-code-title.lua

docs:
	cd doc && pandoc header.md -o header.html
	cd doc && pandoc filter-code-title.md -o filter-code-title.html \
		--lua-filter ../lua-filters/filter-code-title.lua -s \
		-B header.html
	cd doc && pandoc filter-python.md -o filter-python.html \
		--lua-filter ../lua-filters/filter-python.lua -s \
		-B header.html
	cd doc && htmlark filter-python.html -o temp.html
	cd doc && mv temp.html filter-python.html
	cd doc && pandoc filter-kroki.md -o filter-kroki.html \
		--lua-filter ../lua-filters/filter-kroki.lua -s \
		-B header.html
	cd doc && pandoc filter-link-to-html.md -o filter-link-to-html.html -s \
		--lua-filter ../lua-filters/filter-link-to-html.lua -B header.html
	cd doc && pandoc filter-pikchr.md -o filter-pikchr.html -s \
		--lua-filter ../lua-filters/filter-pikchr.lua -B header.html
	
doc/header.html: doc/header.md
	cd doc && pandoc header.md -o header.html
