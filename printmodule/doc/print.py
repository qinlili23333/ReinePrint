from win32com import client
import os
import time
word = client.Dispatch("Word.Application")
doc = word.documents.Open(os.path.abspath("temp.doc"))
doc.PrintOut(False)
doc.Close()
word.Quit()
