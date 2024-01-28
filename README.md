# minimacss
Compiled SASS styles from https://github.com/jekyll/minima for use "as is" in CSS-only, NPM-less small static website projects. All color variables are turned into CSS variables, allowing for modification without rerunning SASS.

Based on commit https://github.com/jekyll/minima/commit/10124515953527c8990a2de99ae4ddb2a81ffee3 from Nov 17, 2023

See the zip-ball in the release https://github.com/vadimkantorov/minimacss/releases/tag/cssrelease to download all the produced CSS files.

```shell
# install https://sass.github.io/libsass-python/
python -m pip install libsass --user
# python -c "import sass;print(sass.compile(string='\$colorscheme:\"light\";@import\'auto.scss\''))" > classic.css # see Makefile for all others
# cd ./minima/_sass; python -c "import sass;print(sass.compile(string='@import \'minima/skins/classic\',\'minima/initialize\''))" > ../../minima_classic.css

make amalgamated/auto.scss amalgamated/solarized.scss amalgamated/classic.scss amalgamated/dark.scss amalgamated/solarized-light.scss amalgamated/solarized-dark.scss
make amalgamated/auto.css amalgamated/classic.css amalgamated/dark.css amalgamated/solarized.css amalgamated/solarized-light.css amalgamated/solarized-dark.css
make asis/auto.css asis/classic.css asis/dark.css asis/solarized.css asis/solarized-light.css asis/solarized-dark.css

# i made auto.scss / solaried.scss and custom-variables_base_layout_custom-styles.scss by manual amalgamation and fixes of ./minima./assets/css/style.scss -> ./minima/_sass/minima/skins/auto.scss -> ./minima/_sass/minima/initialize.scss -> ./minima/_sass/minima/custom-variables.scss -> ./minima/_sass/minima/_base.scss -> ./minima/_sass/minima/_layout.scss -> ./minima/_sass/minima/custom-styles.scss

make auto.css classic.css dark.css PYTHON=python
make solarized.css solarized-light.css solarized-dark.css PYTHON=python
```
