@echo off
chcp 65001
cd\
cd Mywork\finalproject\final-5\src\main\java\com\kdt\finalproject\util\
start javac -encoding utf-8 -classpath jpos113-controls.jar;jcl.jar JposPrinterReceiptTest.java
start java -classpath .;JposPrinterJavaPOS.jar;jpos113-controls.jar;jcl.jar;xercesimpl.jar;xml-apis.jar JposPrinterReceiptTest.java 건천(부산)휴게소 누구나돌솥비빔밥 8900 1 8900 0009
pause