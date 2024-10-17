package edu.sm;

import edu.sm.util.HttpSendData;

import java.util.Random;

public class Main {
    public static void main(String[] args) {
        String url = "http://127.0.0.1/iot/power";
        String data = "100.0";
        Random r = new Random();
        for(int i = 0; i < 100; i++) {
            float num = r.nextFloat() * 100;
            HttpSendData.send(url, num + "");
            try {
                Thread.sleep(2000);
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            }
        }
    }
}