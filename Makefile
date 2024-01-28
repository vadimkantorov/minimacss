MINIMACOMMITHASH = 10124515953527c8990a2de99ae4ddb2a81ffee3
PYTHON = python

naiveauto.css: minima
	cd $</_sass; $(PYTHON) -c "import sass;print(sass.compile(string='@import \'minima/skins/auto\',\'minima/initialize\''))" > ../../naiveauto.css;
naiveclassic.css: minima
	cd $</_sass; $(PYTHON) -c "import sass;print(sass.compile(string='@import \'minima/skins/classic\',\'minima/initialize\''))" > ../../naiveclassic.css;
naivedark.css: minima
	cd $</_sass; $(PYTHON) -c "import sass;print(sass.compile(string='@import \'minima/skins/dark\',\'minima/initialize\''))" > ../../naivedark.css;

naiveautoamalgamated.scss: minima
	cat ./minima/_sass/minima/skins/auto.scss ./minima/_sass/minima/initialize.scss ./minima/_sass/minima/custom-variables.scss ./minima/_sass/minima/_base.scss ./minima/_sass/minima/_layout.scss ./minima/_sass/minima/custom-styles.scss | grep -v -e '@import' -e '"minima' > $@
naiveclassicamalgamated.scss: minima
	cat ./minima/_sass/minima/skins/classic.scss ./minima/_sass/minima/skins/auto.scss ./minima/_sass/minima/initialize.scss ./minima/_sass/minima/custom-variables.scss ./minima/_sass/minima/_base.scss ./minima/_sass/minima/_layout.scss ./minima/_sass/minima/custom-styles.scss | grep -v -e '@import' -e '"minima' > $@
naivedarkamalgamated.scss: minima
	cat ./minima/_sass/minima/skins/dark.scss ./minima/_sass/minima/skins/auto.scss ./minima/_sass/minima/initialize.scss ./minima/_sass/minima/custom-variables.scss ./minima/_sass/minima/_base.scss ./minima/_sass/minima/_layout.scss ./minima/_sass/minima/custom-styles.scss | grep -v -e '@import' -e '"minima' > $@
naivesolarizedamalgamated.scss: minima
	cat ./minima/_sass/minima/skins/solarized.scss ./minima/_sass/minima/initialize.scss ./minima/_sass/minima/custom-variables.scss ./minima/_sass/minima/_base.scss ./minima/_sass/minima/_layout.scss ./minima/_sass/minima/custom-styles.scss | grep -v -e '@import' -e '"minima' > $@
naivesolarizedlightamalgamated.scss: minima
	cat ./minima/_sass/minima/skins/solarized-light.scss ./minima/_sass/minima/skins/solarized.scss ./minima/_sass/minima/initialize.scss ./minima/_sass/minima/custom-variables.scss ./minima/_sass/minima/_base.scss ./minima/_sass/minima/_layout.scss ./minima/_sass/minima/custom-styles.scss | grep -v -e '@import' -e '"minima' > $@
naivesolarizeddarkamalgamated.scss: minima
	cat ./minima/_sass/minima/skins/solarized-dark.scss ./minima/_sass/minima/skins/solarized.scss ./minima/_sass/minima/initialize.scss ./minima/_sass/minima/custom-variables.scss ./minima/_sass/minima/_base.scss ./minima/_sass/minima/_layout.scss ./minima/_sass/minima/custom-styles.scss | grep -v -e '@import' -e '"minima' > $@

naiveautoamalgamated.css: naiveautoamalgamated.scss
	$(PYTHON) -c "import sass;print(sass.compile(string='@import \'naiveautoamalgamated.scss\''))" > $@
naiveclassicamalgamated.css: naiveclassicamalgamated.scss
	$(PYTHON) -c "import sass;print(sass.compile(string='@import \'naiveclassicamalgamated.scss\''))" > $@
naivedarkamalgamated.css: naivedarkamalgamated.scss
	$(PYTHON) -c "import sass;print(sass.compile(string='@import \'naivedarkamalgamated.scss\''))" > $@
naivesolarizedamalgamated.css: naivesolarizedamalgamated.scss
	$(PYTHON) -c "import sass;print(sass.compile(string='@import \'naivesolarizedamalgamated.scss\''))" > $@
naivesolarizedlightamalgamated.css: naivesolarizedlightamalgamated.scss
	$(PYTHON) -c "import sass;print(sass.compile(string='@import \'naivesolarizedlightamalgamated.scss\''))" > $@
naivesolarizeddarkamalgamated.css: naivesolarizeddarkamalgamated.scss
	$(PYTHON) -c "import sass;print(sass.compile(string='@import \'naivesolarizeddarkamalgamated.scss\''))" > $@

auto.css:
	$(PYTHON) -c "import sass;print(sass.compile(string='\$$colorscheme: \"auto\"; @import \'auto.scss\''))" > $@
classic.css:
	$(PYTHON) -c "import sass;print(sass.compile(string='\$$colorscheme: \"light\"; @import \'auto.scss\''))" > $@
dark.css:
	$(PYTHON) -c "import sass;print(sass.compile(string='\$$colorscheme: \"dark\"; @import \'auto.scss\''))" > $@
solarized.css:
	$(PYTHON) -c "import sass;print(sass.compile(string='\$$colorscheme: \"auto\"; @import \'solarized.scss\''))" > $@
solarized-light.css:
	$(PYTHON) -c "import sass;print(sass.compile(string='\$$colorscheme: \"light\"; @import \'solarized.scss\''))" > $@
solarized-dark.css:
	$(PYTHON) -c "import sass;print(sass.compile(string='\$$colorscheme: \"dark\"; @import \'solarized.scss\''))" > $@
