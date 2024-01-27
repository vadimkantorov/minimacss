# minimacss
Compiled SASS styles from https://github.com/jekyll/minima for use "as is" in CSS-only, NPM-less small static website projects

Based on commit https://github.com/jekyll/minima/commit/10124515953527c8990a2de99ae4ddb2a81ffee3 from Nov 17, 2023

```shell
# install https://sass.github.io/libsass-python/
python -m pip install libsass --user

# git clone https://github.com/jekyll/minima; pushd minima/_sass; git checkout 10124515953527c8990a2de99ae4ddb2a81ffee3; python -c "import sass;print(sass.compile(string='@import \'minima/skins/classic\',\'minima/initialize\''))" > ../../naiveclassic.css; popd;

cat ./minima/_sass/minima/skins/auto.scss ./minima/_sass/minima/initialize.scss ./minima/_sass/minima/custom-variables.scss ./minima/_sass/minima/_base.scss ./minima/_sass/minima/_layout.scss ./minima/_sass/minima/custom-styles.scss | grep -v -e '@import' -e '"minima' > naiveautoamalgamated.scss
cat ./minima/_sass/minima/skins/classic.scss ./minima/_sass/minima/skins/auto.scss ./minima/_sass/minima/initialize.scss ./minima/_sass/minima/custom-variables.scss ./minima/_sass/minima/_base.scss ./minima/_sass/minima/_layout.scss ./minima/_sass/minima/custom-styles.scss | grep -v -e '@import' -e '"minima' > naiveclassicamalgamated.scss
cat ./minima/_sass/minima/skins/dark.scss ./minima/_sass/minima/skins/auto.scss ./minima/_sass/minima/initialize.scss ./minima/_sass/minima/custom-variables.scss ./minima/_sass/minima/_base.scss ./minima/_sass/minima/_layout.scss ./minima/_sass/minima/custom-styles.scss | grep -v -e '@import' -e '"minima' > naivedarkamalgamated.scss
make naiveautoamalgamated.css naiveclassicamalgamated.css naivedarkamalgamated.css

# similar to naiveclassic.scss, auto.scss is produced by manual amalgamation of ./assets/css/style.scss -> ./_sass/minima/skins/auto.scss -> ./_sass/minima/initialize.scss -> ./_sass/minima/_base.scss -> ./_sass/minima/_layout.scss
make auto.css classic.css dark.css

# compile classic.scss
python -c "import sass;print(sass.compile(string='@import \'classic.scss\''))" > classic.css
# python -c 'import sass; sass.compile(dirname = (".", "."))'
```
