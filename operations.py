from PySide2.QtCore import *
import xlrd





class Worker(QObject):

    d1  = Signal(str)
    d2  = Signal(float) # data for percentage
    d3  = Signal(str) # data for text

    def __init__(self):
        QObject.__init__(self)
        self._d1 = "..."
        self._d2 = 0.0
        self._d3 = ""

    def getD1(self):
        return self._d1
    def getD2(self):
        return self._d2
    def getD3(self):
        return self._d3

    def setD1(self, data):
        if self._d1 != data:
            self._d1 = data
            self.d1.emit(str(data))
    def setD2(self, data):
        if self._d2 != data:
            self._d2 = data
            self.d2.emit(float(data))
    def setD3(self, data):
        if self._d3 != data:
            self._d3 = data
            self.d3.emit(str(data))

    data1 = Property(str, fget=getD1, fset=setD1, notify=d1)
    data2 = Property(float, fget=getD2, fset=setD2, notify=d2)
    data3 = Property(str, fget=getD3, fset=setD3, notify=d3)

    @Slot(str)
    def loadUrl(self, link):
        # print("Loaded url: ", link[len(link)-4:len(link)])
        self._d1 = link[len(link)-4:len(link)]
        tmp = 0.5
        #self.setD2(tmp)

        print("d2", self._d2)
        percent = 95.25
        self.setD1(percent)
        self.setD2(percent/100)
        # _d2 = percent/100
        print("Percentage is : "+str(percent)+"%")
