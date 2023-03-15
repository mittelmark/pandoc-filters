examples:
	pandoc examples/code-block.md -o examples/code-block.html -s \
		--lua-filter lua-filters/filter-code-title.lua
