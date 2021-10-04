from win32com import client
import os
import time
powerpoint = client.Dispatch("Powerpoint.Application")
presentation = powerpoint.presentations.Open(os.path.abspath("temp.ppt"))
presentation.PrintOut()
count = 1
for slide in presentation.Slides:
    time.sleep(1)
    count += 1
presentation.Close()
powerpoint.Quit()
