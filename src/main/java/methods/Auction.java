package methods;

import app.AuctionItemModel;

public class Auction {

    public static final void view(){}

    public static final double getCurrentPrice(){
        return AuctionItemModel.getInstance().getCurrentPrice();
    }

    //@ requires amt > AuctionItemModel.getInstance().getCurrentPrice();
    //@ onFail <- invalidBid(amt);
    public static final void bid(double amt){
        AuctionItemModel.getInstance().setCurrentPrice(
                amt
        );


    }


    public static final void reset(){
        AuctionItemModel.getInstance().reset();
    }

    public static final void invalidBid(double amt){}

}
