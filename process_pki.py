# /usr/bin/pyton3
import xlrd
import pandas as pd

column_names = ["Start Time",
                "NE Name",      # the name of town
                "ratio",        # label is the output predicted
                "maximum",      # S+PGW maximum simultaneously active bearers (numbers)
                "success"      # S+PGW successful bearer creations (times)
                ]        #

columns = [#"maximum",      # S+PGW maximum simultaneously active bearers (number)s
                #"success",      # S+PGW successful bearer creations (times)
                "uplink",       # S1-U uplink user traffic in KB (kB)
                "downlink",]     # S1-U downlink user traffic in KB (kB)
                #"ratio"]        # label is the output predicted

def read_pgw(filename, town):
    wb = xlrd.open_workbook(filename)
    sheet = wb.sheet_by_index(0)
    rows = []

    for i in range(8,sheet.nrows):
        if sheet.cell_value(i, 0) == "Start Time" or sheet.cell_value(i, 0) != "":
            if sheet.cell_value(i, 0) == "Start Time":
                st = True
            else:
                if town == sheet.cell_value(i, 2):
                    print( sheet.cell_value(i, 0), sheet.cell_value(i, 2), sheet.cell_value(i, 5), sheet.cell_value(i, 7), sheet.cell_value(i, 8))
                    rows.append([sheet.cell_value(i, 0), sheet.cell_value(i, 2), sheet.cell_value(i, 5), sheet.cell_value(i, 7), sheet.cell_value(i, 8)])
                    # severities.append(sheet.cell_value(i, 1))

    # print(rows)
    df = pd.DataFrame(rows)
    df.to_csv("dataset.csv", index=False, header=column_names)
    return

def get_town(filename):
    wb = xlrd.open_workbook(filename)
    sheet = wb.sheet_by_index(0)
    rows = []

    for i in range(8,sheet.nrows):
        if sheet.cell_value(i, 0) == "Start Time" or sheet.cell_value(i, 0) != "":
            if sheet.cell_value(i, 0) == "Start Time":
                st = True
            else:
                rows.append(sheet.cell_value(i, 2))
    final = []
    for e in rows:
        if e not in final:
            final.append(e)
    return final

def read_ugw(filename, town):
    wb = xlrd.open_workbook(filename)
    sheet = wb.sheet_by_index(0)
    rows = []

    for i in range(8,sheet.nrows):
        if sheet.cell_value(i, 0) == "Start Time" or sheet.cell_value(i, 0) != "" :
            if sheet.cell_value(i, 0) == "Start Time":
                st = True
            else:
                if town == sheet.cell_value(i, 2):
                    print(i, sheet.cell_value(i, 4), sheet.cell_value(i, 5))
                    rows.append([sheet.cell_value(i, 4), sheet.cell_value(i, 5)])
                # severities.append(sheet.cell_value(i, 1))

    # print(rows)
    df = pd.DataFrame(rows)
    df.to_csv("dataset2.csv", index=False, header=columns)
    return

def concat(ds1, ds2):
    df1 = pd.read_csv(ds1)
    df2 = pd.read_csv(ds2)
    df = pd.concat([df1, df2], axis=1)
    print(df)
    df.to_csv("final_ds.csv", index=False)

if __name__ == '__main__':
    filename = "ugw"
    print("result : ",get_town("ugw.xlsx"))
    # if "ugw" in filename:
    #     read_ugw("ugw.xlsx", "YDE")
    # else:
    #     read_pgw("s_pgw.xlsx", "YDE")

    # concat("dataset.csv", "dataset2.csv")
