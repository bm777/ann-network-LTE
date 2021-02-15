from PySide2.QtCore import *
from PySide2 import QtCore
import xlrd
from process_pki import read_pgw, extraction, read_ugw
from model import standalone

# function to extract col and town from


class Worker(QObject):

    list_town  = Signal(list)
    list_col  = Signal(list) # data for percentage
    d  = Signal(list) # data for text

    def __init__(self):
        QObject.__init__(self)
        self._list_town = []
        self._list_col = []
        self._d = []

    def getTown(self):
        return self._list_town
    def getCol(self):
        return self._list_col
    def getD(self):
        return self._d

    def setTown(self, data):
        if self._list_town != data:
            self._list_town = data
            self.list_town.emit(list(data))
    def setCol(self, data):
        if self._list_col != data:
            self._list_col = data
            self.list_col.emit(list(data))
    def setD(self, data):
        if self._d != data:
            self._d = data
            self.d.emit(list(data))

    data_town = Property(list, fget=getTown, fset=setTown, notify=list_town)
    data_col = Property(list, fget=getCol, fset=setCol, notify=list_col)
    data = Property("QVariantList", fget=getD, fset=setD, notify=d)

    @Slot(str, str, str, str, result="QVariantList")
    def predict(self, filename, col, town, nb=1):
        link = filename[7:]

        if col in ["uplink", "downlink"]:
            read_ugw(link, town)
        else:
            read_pgw(link, town)

        axis, y = standalone(col=col, nb_day=nb)
        y = list(y.numpy())
        self.setD([axis, y])
        final_axis = [float(e) for e in axis]
        final_y = [float(e) for e in y]

        return final_axis, final_y

    @Slot(str, result="QVariantList")
    def load_from_python(self, link):

        link = link[7:]
        list1, list2 = extraction(link)
        self.setCol(list1)
        self.setTown(list2)
        return list1, list2
