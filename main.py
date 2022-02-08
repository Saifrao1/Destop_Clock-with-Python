# This Python file uses the following encoding: utf-8
import os
from pathlib import Path
import sys
import datetime

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import *

class mainWindow(QObject):
    def __init__(self):
        QObject.__init__(self)

        self.a = QTimer()
        self.a.timeout.connect(lambda:self.showTime()
        )

        self.a.start(1000)

#   Signal to deliver time
    time = Signal(str)
    date =Signal(str)
    printGreeting =Signal(str)

    @Slot(str)
    def showTime(self):
        now =datetime.datetime.now()
        formate =now.strftime(" %I : %M : %S  %p")
        self.time.emit(formate)
        dateformate = now.strftime( "%A / %m / %Y")
        self.date.emit(dateformate)

        message =datetime.datetime.now().hour
        if message < 12:
            greeting = "Good morning, Saif"
        elif message < 18:
            greeting = "Good afternoon, Saif"
        else:
            greeting = "Good night, Saif"

        self.printGreeting.emit(greeting)











if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()      
    main =mainWindow()
    engine.rootContext().setContextProperty("backend",main)

    engine.load(os.fspath(Path(__file__).resolve().parent / "main.qml"))
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
