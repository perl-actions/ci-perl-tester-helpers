SHELL := bash


default:


test: shellcheck bats

shellcheck:
	@echo
ifneq (,$(shell command -v shellcheck))
	shellcheck bin/*
	@echo 'All bin/* files passed shellcheck'
else
	$(warning 'shellcheck' not installed)
endif


bats:
	@echo
ifneq (,$(shell command -v bats))
	bats t/
else
	$(warning 'bats' not installed)
endif


clean:
	find t/test-data \
	    -name 'MANIFEST*.bak' \
	    -o -name 'MYMETA*' \
	    -o -name 'Makefile' \
	    -o -name 'blib' \
	    -o -name 'build_dir' \
	    -o -name 'pm_to_blib' \
	    -o -name '_build' \
	    -o -name 'Build' | \
	xargs $(RM) -r
	$(RM) t/test-data/extutils-makemaker-module-with-manifest.skip/MANIFEST
	$(RM) t/test-data/module-build_module/MANIFEST
