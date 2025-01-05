# Maintainer: Guillaume BELDILMI <gbeldilmi@pm.me>
pkgname=zodiac
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="Zodiac package for Arch Linux"
arch=('any')
url=""
license=('custom')
groups=()
depends=('parallel' 'coreutils')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
sha256sums=()
validpgpkeys=()

subpackage() {
  local fn=$1
  local subpkg=$(ls -d $srcdir/*/)
  for sp in $subpkg
  do
    echo "Subpackage : $sp."
    cd $sp && $fn
  done
}

prepare() {
  echo "Preparing..."
  fprepare() {
    if [ -e makefile ]
    then
      make clean
    fi
  }
  subpackage fprepare
}

build() {
  echo "Building..."
  fbuild() {
    if [ -e makefile ]
    then
      make package
    fi
  }
  subpackage fbuild
}

check() {
  echo "Checking..."
}

package() {
  echo "Packaging..."
  fpackage() {
    cp -rv package/* $pkgdir
  }
  subpackage fpackage
}

