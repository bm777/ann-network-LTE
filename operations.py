from PySide2.QtCore import *
import xlrd
from process_pki import read_pgw, extraction, read_ugw
from model import standalone

# function to extract col and town from


class Worker(QObject):

    list_town  = Signal(list)
    list_col  = Signal(list) # data for percentage
    d3  = Signal(str) # data for text

    def __init__(self):
        QObject.__init__(self)
        self._list_town = []
        self._list_col = []
        self._d3 = ""

    def getTown(self):
        return self._list_town
    def getCol(self):
        return self._list_col
    def getD3(self):
        return self._d3

    def setTown(self, data):
        if self._list_town != data:
            self._list_town = data
            self.list_town.emit(list(data))
    def setCol(self, data):
        if self._list_col != data:
            self._list_col = data
            self.list_col.emit(list(data))
    def setD3(self, data):
        if self._d3 != data:
            self._d3 = data
            self.d3.emit(str(data))

    data_town = Property(list, fget=getTown, fset=setTown, notify=list_town)
    data_col = Property(list, fget=getCol, fset=setCol, notify=list_col)
    data3 = Property(str, fget=getD3, fset=setD3, notify=d3)

    @Slot(str, result="QVariantList")
    def load_from_python(self, link):


        link = link[7:]
        list1, list2 = extraction(link)
        self.setCol(list1)
        self.setTown(list2)
        return list1, list2

    @Slot(str, str, str)
    def predict(self, filename, col, town):
        link = filename[7:]
        print("++++++++++++ before")
        if col in ["uplink", "downlink"]:
            print("++++ ugw")
            read_ugw(link, town)

        else:
            print("++++ pgw")
            read_pgw(link, town)

        axis, y = standalone(col=col, nb_day=1)
        print("+++", axis, y)
