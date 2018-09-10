# Docker-Imagemagick
![Docker Build Status](https://img.shields.io/docker/build/avitase/docker-imagemagick.svg)

The container exposes Ubuntu's default `imagemagick` installation. 
You can use `convert` for instance as
```
> docker run --rm -it docker-imagemagick /bin/bash -c "convert --version"
Version: ImageMagick 6.9.7-4 Q16 x86_64 20170114 http://www.imagemagick.org
Copyright: © 1999-2017 ImageMagick Studio LLC
License: http://www.imagemagick.org/script/license.php
Features: Cipher DPC Modules OpenMP
Delegates (built-in): bzlib djvu fftw fontconfig freetype jbig jng jpeg lcms lqr ltdl lzma openexr pangocairo png tiff wmf x xml zlib
```

We provide a script [convert.sh](convert.sh) that mounts your current working dir to `/workdir` and calls `imagemagick`'s `convert` with the arguments that you prepend to the bash script, e.g.
```
./convert.sh --version
Version: ImageMagick 6.9.7-4 Q16 x86_64 20170114 http://www.imagemagick.org
Copyright: © 1999-2017 ImageMagick Studio LLC
License: http://www.imagemagick.org/script/license.php
Features: Cipher DPC Modules OpenMP
Delegates (built-in): bzlib djvu fftw fontconfig freetype jbig jng jpeg lcms lqr ltdl lzma openexr pangocairo png tiff wmf x xml zlib
```

This script might help you to achieve more fancy stuff, such as
```
> ls
test.pdf
> ./convert.sh -density 600 -trim -transparent white test.pdf test.png && ls
test.pdf test.png
```

## Docker Pull Command
The container is accessible via the [Docker Hub](https://hub.docker.com/r/avitase/docker-imagemagick/): `docker pull avitase/docker-imagemagick`.
