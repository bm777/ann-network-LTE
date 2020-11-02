from PySide2.QtCore import *
import xlrd

def percentage(severities, occurences=[]):
    # formula to calculate percentage depending on
    # severities without quantity of occurences
    #    state oof severities: minor := 10%
    #                          major := 30%
    #                          warning := 50%
    #                          critical := 90%
    # counters
    count_minor = 0
    count_major = 0
    count_warning = 0
    count_critical = 0

    #var for final percentage
    percent = 0
    counters = 0

    # states and equiv percent of each severities
    if len(occurences) == 0:
        for sev in severities:
            if sev == "Minor":
                count_minor += 1
            if sev == "Major":
                count_major += 1
            if sev == "Warning":
                count_warning += 1
            if sev == "Critical":
                count_critical += 1
        counters = count_minor+count_major+count_warning+count_critical
        percent = count_minor*10 +count_major*30 +count_warning*50 +count_critical*90
        return float(str(round(percent / counters, 2)))
    else:
        for i in range(len(severities)):
            if severities[i] == "Minor":
                count_minor += int(occurences[i])
            if severities[i] == "Major":
                count_major += int(occurences[i])
            if severities[i] == "Warning":
                count_warning += int(occurences[i])
            if severities[i] == "Critical":
                count_critical += int(occurences[i])
        counters = count_minor+count_major+count_warning+count_critical
        percent = count_minor*10 +count_major*30 +count_warning*50 +count_critical*90
        return float(str(round(percent / counters, 2)))


def read_file(filename):
    wb = xlrd.open_workbook(filename[7:len(filename)])
    sheet = wb.sheet_by_index(0)
    state = True
    st1 = False
    severities = []
    occurences = []
    # stop = True
    # i = 0
    for i in range(sheet.nrows):
        if sheet.cell_value(i, 1) == "Severity" or sheet.cell_value(i, 1) != "":
            if sheet.cell_value(i, 1) == "Severity":
                if sheet.cell_value(i, 7) == "Occurrences":
                    st1 = True
                else:
                    st1 = False
            else:
                # print(i, sheet.cell_value(i, 1), sheet.cell_value(i, 7))
                severities.append(sheet.cell_value(i, 1))
                if st1:
                    occurences.append(sheet.cell_value(i, 7))


        i += 1
    # print(len(severities), len(occurences))
    return severities, occurences

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
        severities, occurences = read_file(link)
        percent = percentage(severities, occurences)
        self.setD1(percent)
        self.setD2(percent/100)
        # _d2 = percent/100
        print("Percentage is : "+str(percent)+"%")
