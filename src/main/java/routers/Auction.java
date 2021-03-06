package routers;

import app.AuctionItemModel;
import verily.lang.*;

import java.util.HashMap;
import java.util.Map;

public class Auction{

     public static final Content view(){

         Map m = new HashMap();

         m.put("currentPrice", String.format("US $%,.2f", AuctionItemModel.getInstance().getCurrentPrice()));
         m.put("timeRemaining", AuctionItemModel.getInstance().getTimeRemaining());

         return new TemplateHTMLContent("ViewItemResponse.ftl", m);
     }

    public static final Content getCurrentPrice(double currentPrice){
          return new TextContent(String.format("US $%,.2f", currentPrice));
    }


    public static final Content bid(double amt){
        return new TextContent("OK");
    }


    public static final Content reset(){
        return new TextContent("OK");
    }

    public static final Content invalidBid(double amt){

        Map m = new HashMap();


        m.put("validBid", String.format("US $%,.2f", AuctionItemModel.getInstance().getCurrentPrice()));
        m.put("yourBid", amt);

        return new TemplateHTMLContent("InvalidBidResponse.ftl", m);


    }


}
