@echo off
chcp 65001
cd\
cd Mywork\finalproject\final-5\src\main\java\com\kdt\finalproject\util\
start javac -encoding utf-8 -classpath jpos113-controls.jar;jcl.jar JposPrinterReceiptTest.java
start java -classpath .;JposPrinterJavaPOS.jar;jpos113-controls.jar;jcl.jar;xercesimpl.jar;xml-apis.jar JposPrinterReceiptTest.java 죽전(서울)휴게소 김치볶음밥/뚝배기불고기/참치김밥 8000/10000/5000 1/2/1 33000 0059
pause