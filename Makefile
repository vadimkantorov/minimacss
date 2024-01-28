MINIMACOMMITHASH = 10124515953527c8990a2de99ae4ddb2a81ffee3
PYTHON = python

minima_auto.css: minima
	cd $</_sass; $(PYTHON) -c "import sass;print(sass.compile(string='@import \'minima/skins/auto\',\'minima/initialize\''))" > ../../$@
minima_classic.css: minima
	cd $</_sass; $(PYTHON) -c "import sass;print(sass.compile(string='@import \'minima/skins/classic\',\'minima/initialize\''))" > ../../$@
minima_dark.css: minima
	cd $</_sass; $(PYTHON) -c "import sass;print(sass.compile(string='@import \'minima/skins/dark\',\'minima/initialize\''))" > ../../$@

amalgamated/auto.scss amalgamated/solarized.scss: minima
	cat ./minima/_sass/minima/skins/$(notdir $@) ./minima/_sass/minima/initialize.scss ./minima/_sass/minima/custom-variables.scss ./minima/_sass/minima/_base.scss ./minima/_sass/minima/_layout.scss ./minima/_sass/minima/custom-styles.scss | grep -v -e '@import' -e '"minima' > $@
amalgamated/classic.scss: amalgamated/auto.scss minima
	cat ./minima/_sass/minima/skins/$(notdir $@) $< | grep -v -e '@import' -e '"minima' > $@
amalgamated/dark.scss: amalgamated/auto.scss minima
	cat ./minima/_sass/minima/skins/$(notdir $@) $< | grep -v -e '@import' -e '"minima' > $@
amalgamated/solarized-light.scss: amalgamated/solarized.scss minima
	cat ./minima/_sass/minima/skins/$(notdir $@) $< | grep -v -e '@import' -e '"minima' > $@
amalgamated/solarized-dark.scss: amalgamated/solarized.scss minima
	cat ./minima/_sass/minima/skins/$(notdir $@) $< | grep -v -e '@import' -e '"minima' > $@

amalgamated/auto.css amalgamated/classic.css amalgamated/dark.css amalgamated/solarized.css amalgamated/solarized-light.css amalgamated/solarized-dark.css: 
	$(PYTHON) -c "import sass;print(sass.compile(string='@import \'$(basename $@).scss\''))" > $@
auto.css solarized.css:
	$(PYTHON) -c "import sass;print(sass.compile(string='\$$colorscheme: \"auto\" ; @import \'$(basename $@).scss\''))" > $@
classic.css solarized-light.css:
	$(PYTHON) -c "import sass;print(sass.compile(string='\$$colorscheme: \"light\"; @import \'$(basename $@).scss\''))" > $@
dark.css solarized-dark.css:
	$(PYTHON) -c "import sass;print(sass.compile(string='\$$colorscheme: \"dark\" ; @import \'$(basename $@).scss\''))" > $@
