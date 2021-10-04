from win32com import client
import os
import time
powerpoint = client.Dispatch("Powerpoint.Application")
presentation = powerpoint.presentations.Open(os.path.abspath("temp.pptx"))
presentation.PrintOut()
time.sleep(1)
presentation.Close()
powerpoint.Quit()
