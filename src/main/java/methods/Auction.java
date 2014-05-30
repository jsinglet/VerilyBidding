package methods;

import app.AuctionItemModel;

public class Auction {

    public static final void view(){
    }

    public static final void getCurrentPrice(){

    }

    //@ requires amt > 10;
    //@ onFail <- invalidBid(amt);
    public static final void bid(int amt){
        AuctionItemModel.getInstance().setCurrentPrice(
                amt
        );

//        AuctionItemModel.getInstance().setCurrentPrice(
//                AuctionItemModel.getInstance().getCurrentPrice() + amt
//        );

    }


    public static final void reset(){
        AuctionItemModel.getInstance().reset();
    }

    public static final void invalidBid(int amt){

    }

}
