<@verilyLayouts.simple>


    <@verilyUtils.enableAjaxInterface/>

<div class="row">
    <div class="span9">


<div class="page-header">
    <h1>Verily Bidding Demo</h1>
</div>

    </div>
</div>




<div class="row">
    <div class="span9">
        <div class="row">
            <div class="span3">


                <div style="background-color: whitesmoke; padding-top: 40px; padding-bottom: 40px; border:1px solid; border-color: #999; border-radius:5px;">
                    <img src="http://img2.wikia.nocookie.net/__cb20100125131546/bttf/images/1/13/DeLorean_Time_Machine_with_acquired_parts.jpg">
                </div>

            </div>
            <div class="span6">



                <form>
                    <fieldset>
                        <legend>Working DeLorean DMC-12 for Sale (Rare Item!)</legend>
                        <label>Item condition: <strong>Used</strong></label>
                        <label>Item Description: "Own a piece of history!"</label>

                        <label>Time left: <span id="countdown" style="color: orange; font-weight: bold;">&nbsp;</span></label>

                        <br><br>

                        <div class="alert" id="alert" style="display: none">
                        </div>
                        <!-- border:1px solid; border-radius:5px; -->
                        <div style="background-color: lightgray; ">


                            <div class="row">
                                <div class="span6">&nbsp;</div>
                            </div>

                            <div class="row">
                                <div class="span1">Current bid:</div>
                                <div class="span5"><span id="currentBid" style="font-weight: bold; font-size: 18px;">${currentPrice}</span></div>

                            </div>

                            <div class="row">
                                <div  class="span1">&nbsp;</div>
                                <div  class="span3"><input type="text" style="width: 200px;" id="bid" name="bid" placeholder="$0.00"></div>
                                <div  class="span2" align="left">                        <button type="button" id="doBid" class="btn btn-success">Place Bid</button>
                                </div>

                            </div>
                            <div class="row">
                                <div class="span6">&nbsp;</div>
                            </div>


                        </div>
                    </fieldset>
                </form>



            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    var target_date = new Date("${timeRemaining}").getTime();
    var days, hours, minutes, seconds;
    // get tag element
    var countdown = document.getElementById("countdown");

    setInterval(function () {
        updateTime();

    }, 1000);


    function updateTime(){
        var current_date = new Date().getTime();
        var seconds_left = (target_date - current_date) / 1000;
        days = parseInt(seconds_left / 86400);
        seconds_left = seconds_left % 86400;

        hours = parseInt(seconds_left / 3600);
        seconds_left = seconds_left % 3600;

        minutes = parseInt(seconds_left / 60);
        seconds = parseInt(seconds_left % 60);

        countdown.innerHTML = days + "d, " + hours + "h, "
                + minutes + "m, " + seconds + "s";

    }

    updateTime();


    function updateCurrentBid(){
        var currentBid = document.getElementById("currentBid");

        currentBid.innerHTML = Auction.getCurrentPrice().response;

    }

    setInterval(function () {

        updateCurrentBid();
    }, 1000);


    var bidButton = document.getElementById("doBid");

    bidButton.onclick = function() {
        var bid = document.getElementById("bid");

        var bidButton = jQuery('#doBid');

        var old = bidButton.innerHTML;

        bidButton.innerHTML = "Please wait...";

        bidButton.prop('disabled', true);


        var res = Auction.bid(bid.value).response;

        if(res!="OK"){

            jQuery('#alert').show();
            jQuery('#alert').innerHTML = res;

        }else{

            jQuery('#alert').hide();

            updateCurrentBid();

            jQuery('#currentBid').effect( "highlight");

        }
            bidButton.innerHTML = old;

            bidButton.prop('disabled', false);


    };


</script>


<script src="//code.jquery.com/jquery-1.11.0.min.js"></script

<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/themes/smoothness/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>

</@verilyLayouts.simple>