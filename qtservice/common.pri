exists(config.pri):infile(config.pri, SOLUTIONS_LIBRARY, yes): CONFIG += qtservice-uselib
TEMPLATE += fakelib
QTSERVICE_LIBNAME = qtservice
CONFIG(debug, debug|release) {
	mac:QTSERVICE_LIBNAME = $$member(QTSERVICE_LIBNAME, 0)_debug
   	else:win32:QTSERVICE_LIBNAME = $$member(QTSERVICE_LIBNAME, 0)d
}
TEMPLATE -= fakelib
win32 {
    equals(QT_ARCH, x86_64) {
        QTSERVICE_LIBDIR = $$PWD/lib64
    } else {
        equals(QT_ARCH, i386) {
            QTSERVICE_LIBDIR = $$PWD/lib32
        } else {
            warning("Unsupported platform: $$QT_ARCH")
        }
    }
}
unix:qtservice-uselib:!qtservice-buildlib:QMAKE_RPATHDIR += $$QTSERVICE_LIBDIR
