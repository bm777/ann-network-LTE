# This Python file uses the following encoding: utf-8

import os, sys
from PySide2.QtGui import *
from PySide2.QtWidgets import *
from PySide2.QtCore import *
from PySide2.QtQml import *
from PySide2 import QtNetwork
from PySide2 import QtOpenGL
from operations import  *


if __name__ == "__main__":


    # application window
    QCoreApplication.setAttribute(Qt.AA_EnableHighDpiScaling)
    app = QApplication(sys.argv)

    work = Worker()

    engine = QQmlApplicationEngine()
    engine.rootContext().setContextProperty("bridge", work)
    url = QUrl.fromLocalFile(os.path.join(os.path.dirname(__file__), "qml/dashboard.qml"))
    print("Here in main function", url)
    engine.load(url)

    # show the window
    if not engine.rootObjects():
        sys.exit(-1)

    work.d1.connect(work.setD1)
    app.exec_()
