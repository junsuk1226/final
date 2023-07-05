package com.kdt.finalproject.util;

import java.awt.print.PrinterException;
import java.awt.print.PrinterJob;
import javax.print.PrintService;
import javax.print.PrintServiceLookup;

public class print {

    public static void main(String[] args) throws PrinterException {
        // 프린터 선택
        PrintService printService = findPrintService("SLK-TS100");
        String[] asdf = args;
        for (String str : args) {
            System.out.println(str);
        }

        if (printService != null) {
            // 프린터 작업 생성
            PrinterJob printerJob = PrinterJob.getPrinterJob();
            printerJob.setPrintService(printService);
            System.out.println("111");
            try {
                // 영수증 출력
                printerJob.print();
                System.out.println("222");
            } catch (PrinterException e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("프린터를 찾을 수 없습니다.");
        }
    }

    // 프린터 서비스 검색
    private static PrintService findPrintService(String printerName) {
        PrintService[] printServices = PrintServiceLookup.lookupPrintServices(null, null);

        for (PrintService printService : printServices) {
            if (printService.getName().equals(printerName)) {
                return printService;
            }
        }

        return null;
    }
}