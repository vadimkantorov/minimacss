MINIMACOMMITHASH = 10124515953527c8990a2de99ae4ddb2a81ffee3
PYTHON = python

minima:
	git clone https://github.com/jekyll/minima; git checkout $(MINIMACOMMITHASH);

naiveauto.css: minima
	cd $</_sass; $(PYTHON) -c "import sass;print(sass.compile(string='@import \'minima/skins/auto\',\'minima/initialize\''))" > ../../naiveauto.css;
naiveclassic.css: minima
	cd $</_sass; $(PYTHON) -c "import sass;print(sass.compile(string='@import \'minima/skins/classic\',\'minima/initialize\''))" > ../../naiveclassic.css;
naivedark.css: minima
	cd $</_sass; $(PYTHON) -c "import sass;print(sass.compile(string='@import \'minima/skins/dark\',\'minima/initialize\''))" > ../../naivedark.css;


naiveautoamalgamated.css: minima
	cat ./minima/_sass/minima/skins/auto.scss ./minima/_sass/minima/initialize.scss ./minima/_sass/minima/custom-variables.scss ./minima/_sass/minima/_base.scss ./minima/_sass/minima/_layout.scss ./minima/_sass/minima/custom-styles.scss | grep -v -e '@import' -e '"minima' > naiveautoamalgamated.scss
	$(PYTHON) -c "import sass;print(sass.compile(string='@import \'naiveautoamalgamated.scss\''))" > $@

naiveclassicamalgamated.scss: minima
	cat ./minima/_sass/minima/skins/classic.scss ./minima/_sass/minima/skins/auto.scss ./minima/_sass/minima/initialize.scss ./minima/_sass/minima/custom-variables.scss ./minima/_sass/minima/_base.scss ./minima/_sass/minima/_layout.scss ./minima/_sass/minima/custom-styles.scss | grep -v -e '@import' -e '"minima' > $@
	$(PYTHON) -c "import sass;print(sass.compile(string='@import \'naiveclassicamalgamated.scss\''))" > $@

naivedarkamalgamated.scss: minima
	cat ./minima/_sass/minima/skins/dark.scss ./minima/_sass/minima/skins/auto.scss ./minima/_sass/minima/initialize.scss ./minima/_sass/minima/custom-variables.scss ./minima/_sass/minima/_base.scss ./minima/_sass/minima/_layout.scss ./minima/_sass/minima/custom-styles.scss | grep -v -e '@import' -e '"minima' > $@
	$(PYTHON) -c "import sass;print(sass.compile(string='@import \'naivedarkamalgamated.scss\''))" > $@

auto.css:
	$(PYTHON) -c "import sass;print(sass.compile(string='@import \'auto.scss\''))" > $@
classic.css:
	$(PYTHON) -c "import sass;print(sass.compile(string='\$$colorscheme: \"light\"; @import \'auto.scss\''))" > $@
dark.css:
	$(PYTHON) -c "import sass;print(sass.compile(string='\$$colorscheme: \"dark\"; @import \'auto.scss\''))" > $@