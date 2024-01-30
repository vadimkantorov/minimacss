SASS = sass

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
	$(SASS) $(basename $@).scss $@
auto.css solarized.css:
	echo '$$colorscheme:"auto";@import"$(basename $@).scss"' | $(SASS) --stdin $@
classic.css dark.css: auto.scss
	echo '$$colorscheme:"light";@import"$<"' | $(SASS) --stdin $@
solarized-light.css solarized-dark.css: solarized.scss
	echo '$$colorscheme:"dark";@import"$<"' | $(SASS) --stdin $@

asis/auto.css asis/classic.css asis/dark.css asis/solarized.css asis/solarized-light.css asis/solarized-dark.css: minima
	echo '@import"minima/skins/$(basename $(notdir $@)).scss","minima/initialize"' | $(SASS) -I $</_sass --stdin $@
