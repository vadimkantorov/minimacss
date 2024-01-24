# minimacss
Compiled SASS styles from https://github.com/jekyll/minima for use "as is" in CSS-only, NPM-less small static website projects

Based on commit https://github.com/jekyll/minima/commit/10124515953527c8990a2de99ae4ddb2a81ffee3 from Nov 17, 2023

```shell
# install https://sass.github.io/libsass-python/
python -m pip install libsass

# git clone https://github.com/jekyll/minima; pushd minima/_sass; git checkout 10124515953527c8990a2de99ae4ddb2a81ffee3; python -c "import sass;print(sass.compile(string='@import \'minima/skins/classic\',\'minima/initialize\''))" > ../../naiveclassic.css; popd;

cat ./minima/_sass/minima/skins/classic.scss ./minima/_sass/minima/skins/auto.scss ./minima/_sass/minima/initialize.scss ./minima/_sass/minima/_base.scss ./minima/_sass/minima/_layout.scss | grep -v -e '@import' -e '"minima' > ../naiveclassic.scss
# python -c "import sass;print(sass.compile(string='@import \'naiveclassicamalgamated.scss\''))" > naiveclassicamalgamated.css

# similar to naiveclassic.scss, classic.scss is produced by manual amalgamation of ./assets/css/style.scss -> ./_sass/minima/skins/classic.scss -> ./_sass/minima/skins/auto.scss -> ./_sass/minima/initialize.scss -> ./_sass/minima/_base.scss -> ./_sass/minima/_layout.scss

# compile classic.scss
python -c 'import sass; sass.compile(dirname = (".", "."))'
```
