examples:
	pandoc examples/code-block.md -o examples/code-block.html -s \
		--lua-filter lua-filters/filter-code-title.lua

docs:
	cd doc && pandoc filter-code-title.md -o filter-code-title.html \
		--lua-filter ../lua-filters/filter-code-title.lua -s
