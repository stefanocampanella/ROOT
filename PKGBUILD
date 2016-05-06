# Maintainer: Stefano Campanella <stefanocampanella1729@gmail.com>
pkgname=root
pkgver=6.06.02
_pkgid=$pkgname-$pkgver
pkgrel=1
pkgdesc='C++ data analysis framework and interpreter from CERN.'
arch=('i686' 'x86_64')
url='http://root.cern.ch'
license=('LGPL2.1')
depends=('gsl' )
optdepends=('pythia: analisys of Monte Carlo generated events' 'python2: PyROOT support' 'jupyter: ROOT notebook support' 'ipython2-notebook: ROOT notebook support')
makedepends=(
'cmake'
#################################################################################
## marked as building dependencies on https://root.cern.ch/build-prerequisites ##
#################################################################################
'git' # to download builtin library source code
'lsb-release'
'libxpm'
'libxft'
'libxext'
'libx11'
'libpng'
'libjpeg-turbo'
#################################################################################
## marked as optional dependencies on https://root.cern.ch/build-prerequisites ##
#################################################################################
#'gcc-fortran' # for /usr/bin/gfortran - but fortran=OFF
#'openssl' # for /usr/include/openssl/pem.h and /usr/lib/libssl.so and /usr/lib/libcrypto.so
#'fftw' # for /usr/include/fftw3.h and for /usr/lib/libfftw3.so -- builtin_fftw3=OFF but fftw3=ON
'ftgl' # unlisted optional dependency -- for builtin_ftgl=OFF
'freetype2' # for builtin_freetype=OFF
'glew' # for /usr/include/GL/glew.h and for /usr/lib/libGLEW.so -- for builtin_glew=OFF
'pcre' # for /usr/bin/pcre-config -- for builtin_pcre=OFF
'zlib' # unlisted optional dependency -- for builtin_zlib=OFF
'xz' # unlisted optional dependency -- for builtin_lzma=OFF
'gsl' # unlisted optional dependency -- for builtin_gsl=OFF e gsl_shared=ON
#'cfitsio' # for /usr/include/fitsio2.h and for /usr/lib/libcfitsio.so -- for cfitsio=OFF but fitsio=OFF
#############################################################################
## NOTE ON LLVM: look at https://root.cern.ch/phpBB3/viewtopic.php?t=19401 ##
#############################################################################
#'llvm' # unlisted optional dependency -- for builtin_llvm=OFF <-- BROKEN!!
#'llvm-libs' # unlisted optional dependency -- for builtin_llvm=OFF <-- BROKEN!!
'intel-tbb' # unlisted optional dependency -- for builtin_tbb=OFF and tbb=ON
#'libmariadbclient' # for /usr/bin/mysql_config (or ? 'libmysqlclient') but mysql=OFF
'mesa' # for /usr/include/GL/gl.h and for /usr/lib/libGL.so -- for opengl=ON (OpenGL support, requires libGL and libGLU)
'mesa-libgl' # unlisted optional dependency -- for opengl=ON (OpenGL support, requires libGL and libGLU)
'pythia' # unlisted optional dependency -- for pythia8=ON
'python2' # for /usr/include/python2.7/Python.h and for /usr/lib[64]/libpython2.7.so -- for python=ON
#'qt4' # for /usr/include/Qt/qglobal.h and for /usr/lib[64]/libQtCore.so -- but qt=OFF and qtgsi=OFF
#'ssl' # for /usr/include/openssl/pem.h and /usr/lib/libssl.so and /usr/lib/libcrypto.so -- but ssl=OFF
#'graphviz' # for /usr/include/graphviz/gvc.h and for /usr/lib/libgvc.so -- but gviz=OFF
#'avahi' # for /usr/include/dns_sd.h and for /usr/lib/libdns_sd.so -- bonjour=OFF
#'libldap' # for /usr/include/ldap.h and for /usr/lib/libldap.so -- but ldap=OFF
# unlisted dependencies?
#'pkg-config' # for /usr/bin/pkg-config ('ftgl' ?)
'libxml2' # for /usr/bin/xml2-config
# 'ccache' # with ccache=OFF
'giflib'
)
depends=('gsl' 'desktop-file-utils' 'gtk-update-icon-cache' 'shared-mime-info')
install='root.install'
options=('!emptydirs')
source=(
"ftp://root.cern.ch/root/root_v${pkgver}.source.tar.gz"
'ROOT.desktop'
'icons.tar.gz'
'ROOT.sh'
'ROOT.xml'
'settings.cmake')

md5sums=('e9b8b86838f65b0a78d8d02c66c2ec55'
         'd9bb5d9272ef156744af8da8c1b56053'
         '14286a57d602bf3a2d9f6131f5a38514'
         '77e03c6b8b634efa6c8cbba88d32516f'
         '76794a239d7bc924f88eac357b01d5c8'
         'a4288f975f926451f1157d5ed7134baa')

build() {
	cmake -C $srcdir/settings.cmake $srcdir/$_pkgid

	make ${MAKEFLAGS}
}

package() {
	cd $srcdir

	make DESTDIR=$pkgdir install

	install -D $srcdir/ROOT.sh $pkgdir/etc/profile.d/ROOT.sh
	install -D -m644 $srcdir/ROOT.xml $pkgdir/usr/share/mime/packages/ROOT.xml
	install -D -m644 $srcdir/ROOT.desktop $pkgdir/usr/share/applications/ROOT.desktop
	mkdir -p $pkgdir/usr/share/icons/hicolor
	cp -dr --no-preserve=owner $srcdir/icons/* $pkgdir/usr/share/icons/hicolor

	# use a file that pacman can track instead of adding directly to ld.so.conf
	install -d $pkgdir/etc/ld.so.conf.d
	echo '/usr/lib/root' > $pkgdir/etc/ld.so.conf.d/root.conf
}
