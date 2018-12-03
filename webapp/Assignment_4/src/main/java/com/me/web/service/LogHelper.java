package com.me.web.service;

import org.springframework.stereotype.Service;

import java.util.logging.FileHandler;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

@Service
public class LogHelper {

    Logger logger = Logger.getLogger("MyLog");
    FileHandler fh;

    String logLocation="/opt/tomcat/logs/csye6225.log";


    public void logInfoEntry(String msg) throws Exception{
        fh = new FileHandler(logLocation);
        logger.addHandler(fh);
        SimpleFormatter formatter = new SimpleFormatter();
        fh.setFormatter(formatter);
        logger.info(msg);
        fh.close();
    }
}
