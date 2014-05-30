package app;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Author: John L. Singleton <jsinglet@gmail.com>
 */
public class AuctionItemModel {

    private final static AuctionItemModel instance = new AuctionItemModel();

    private AuctionItemModel() {
    }

    public static AuctionItemModel getInstance() {
        return instance;
    }

    public static double someValue = 100;

    private final double startingPrice       = 100000;
    private final double reserve       = 100;
    private final Date timeRemaining = new Date(new Date().getTime()+(2*(86400*1000L)));

    public double getStartingPrice() {
        return startingPrice;
    }

    public double getReserve() {
        return reserve;
    }

    public void setCurrentPrice(double currentPrice){
        try {

            set(new Double(currentPrice).toString());

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public double getCurrentPrice(){
        try {
            String d = get();
            return Double.parseDouble(d);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return 0;
    }


    public String getTimeRemaining(){

        SimpleDateFormat fmt = new SimpleDateFormat("MMM d, Y");
        return fmt.format(timeRemaining);
    }

    private File getDb(){

        File baseDir = new File(System.getProperty("java.io.tmpdir"));
        File source = new File(baseDir, "demo.db");

        return source;
    }
    private void set(String s) throws FileNotFoundException, UnsupportedEncodingException {

        PrintWriter writer = new PrintWriter(getDb(), "UTF-8");
        writer.println(s);
        writer.close();


    }

    private String get() throws IOException {

        BufferedReader br = new BufferedReader(new FileReader(getDb()));
        try {
            StringBuilder sb = new StringBuilder();
            String line = br.readLine();

            while (line != null) {
                sb.append(line);
                sb.append(System.lineSeparator());
                line = br.readLine();
            }
            return sb.toString();
        } finally {
            br.close();
        }


    }

    public void reset(){
        setCurrentPrice(startingPrice);
    }

}
