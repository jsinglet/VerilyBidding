<@verilyLayouts.simple>
    <@verilyUtils.enableAjaxInterface/>


<script src="/js/jquery-1.10.2.js"></script

<link rel="stylesheet" href="/css/ui-lightness/jquery-ui-1.10.4.min.css"/>
<script src="/js/jquery-ui-1.10.4.min.js"></script>

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
                <div style="background-color: #FFF; padding-top: 40px; padding-bottom: 40px; border:1px solid; border-color: #999; border-radius:5px;">
                    <img src="/images/car.jpg">
                </div>
            </div>

            <div class="span6">
                <form>
                    <fieldset>
                        <legend>Working DeLorean DMC-12 for Sale (Rare Item!)</legend>
                        <label>Item condition: <strong>Used</strong></label>
                        <label>Item Description: "Own a piece of history!"</label>

                        <label>Time left: <span id="countdown"
                                                style="color: orange; font-weight: bold;">&nbsp;</span></label>

                        <br><br>

                        <div class="alert" id="alert" style="display: none">
                        </div>

                        <div style="background-color: lightgray; ">


                            <div class="row">
                                <div class="span6">&nbsp;</div>
                            </div>

                            <div class="row">
                                <div class="span1">Current bid:</div>
                                <div class="span5"><span id="currentBid"
                                                         style="font-weight: bold; font-size: 18px;">${currentPrice}</span>
                                </div>

                            </div>

                            <div class="row">
                                <div class="span1">&nbsp;</div>
                                <div class="span3"><input type="text" style="width: 200px;" id="bid" name="bid"
                                                          placeholder="$0.00"></div>
                                <div class="span2" align="left">
                                    <button type="button" id="doBid" class="btn btn-success">Place Bid</button>
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


<script src="/js/countdown.js"></script>

<script type="text/javascript">


    function updateCurrentBid() {
        $("#currentBid").html(Auction.getCurrentPrice().response);
    }

    setInterval(function () {
        updateCurrentBid();
    }, 1000);


    $("#doBid").click(function () {
        var bid = $("#bid");
        var bidButton = $('#doBid');


        // save state
        var old = bidButton.html();

        bidButton.html("Please wait...");
        bidButton.prop('disabled', true);


        var res = Auction.bid(bid.val()).response;

        if (res != "OK") {

            $('#alert').show();
            $('#alert').html(res);

        } else {

            $('#alert').hide();
            updateCurrentBid();

            $('#currentBid').effect("highlight");

        }

        // restore state
        bidButton.html(old);
        bidButton.prop('disabled', false);


    });



    initCountdown("${timeRemaining}");

</script>



</@verilyLayouts.simple>