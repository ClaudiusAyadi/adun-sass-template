#!/bin/bash

# Compile CSS with SASS and pipe it to autoprefixer and postcss-cli
find scss -name "*.scss" ! -name "_*" -print0 | xargs -0 -I {} sh -c "sass {} --style compressed | postcss --use autoprefixer -b 'last 2 versions' | postcss -o dist/theme.tmp.min.css --map"

# Concatenate and minify CSS files in dist/ directory
postcss dist/*.tmp.min.css -o dist/theme.min.css --map

# Remove temporary files
rm dist/*.tmp.*
