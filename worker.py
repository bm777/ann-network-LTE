# This Python file uses the following encoding: utf-8

import os, sys
from PySide2 import QtCore
from PySide2.QtWidgets import QApplication
from PySide2.QtCore import QCoreApplication, QUrl
from PySide2.QtQml import QQmlApplicationEngine
from PySide2 import QtNetwork


if __name__ == "__main__":


    # application window
    QCoreApplication.setAttribute(QtCore.Qt.AA_EnableHighDpiScaling)
    app = QApplication(sys.argv)

    engine = QQmlApplicationEngine()
    url = QUrl.fromLocalFile(os.path.join(os.path.dirname(__file__), "qml/dashboard.qml"))
    print("Here in main function", url)
    engine.load(url)

    # show the window
    if not engine.rootObjects():
        sys.exit(-1)
    app.exec_()
