# check the Python filter
# with inline statements without cache
# with code chunks with and without cache
example:
	pandoc example.md --lua-filter ../lua-filters/filter-python.lua \
		--lua-filter ../lua-filters/filter-links-to-html.lua
		-o example-out.html -s  --css pydoc.css
	pandoc example-kroki.md --lua-filter ../lua-filters/filter-kroki.lua \
		-o example-kroki.html -s  --css pydoc.css
