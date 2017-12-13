from Tkinter import *
import subprocess

def usarBFS():
	#ubprocess.call("pacman.py -l mediumMaze -p SearchAgent -a fn=bfs")
	execfile("C://pacman.py" -l mediumMaze -p SearchAgent -a fn=bfs)
	#os.system("pacman.py -l mediumMaze -p SearchAgent -a fn=bfs")

class App:
  def __init__(self, master):
    frame = Frame(master)
    frame.pack()

    self.button = Button(frame, text="QUIT",command=frame.quit)
    self.button.pack(side=LEFT)

    self.slogan = Button(frame, text="BFS", command=usarBFS)
    self.slogan.pack(side=LEFT)



root = Tk()
app = App(root)
root.mainloop()