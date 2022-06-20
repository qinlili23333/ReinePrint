from win32com import client
import os
import time
excel = client.Dispatch("Excel.Application")
workbook = excel.workbooks.Open(os.path.abspath("temp.xls"))
workbook.PrintOut()
workbook.Close()
excel.Quit()
