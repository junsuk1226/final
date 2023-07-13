@echo off
chcp 65001
cd\
cd Mywork\finalproject\final-5\src\main\java\com\kdt\finalproject\util\
start javac -encoding utf-8 -classpath jpos113-controls.jar;jcl.jar JposPrinterReceiptTest.java
start java -classpath .;JposPrinterJavaPOS.jar;jpos113-controls.jar;jcl.jar;xercesimpl.jar;xml-apis.jar JposPrinterReceiptTest.java 죽전(서울)휴게소 갈비탕 14000 1 14000 0062
pause