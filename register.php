<html>

<head>
   <title>Dental Clinic Appointment</title>
</head>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
/*custom font*/
    
    @import url(https://fonts.googleapis.com/css?family=Montserrat);
    html {
        height: 100%;
        /*Image only BG fallback*/
        /*background = gradient + image pattern combo*/
        background: linear-gradient(rgba(217, 216, 242, 0.8), rgba(46, 112, 187, 0.8));
    }
    
    body {
        font-family: 'Nunito', sans-serif;
        color: #384047;
    }
    /*form styles*/
    
    #msform {
        width: 400px;
        margin: 50px auto;
        text-align: center;
        position: relative;
    }
    
    #msform fieldset {
        background: white;
        border: 0 none;
        border-radius: 3px;
        box-shadow: 0 0 30px 1px rgba(0, 0, 0, 0.4);
        padding: 20px 30px;
        box-sizing: border-box;
        width: 90%;
        margin: 0 10%;
        /*stacking fieldsets above each other*/
        position: relative;
    }
    /*Hide all except first fieldset*/
    
    #msform fieldset:not(:first-of-type) {
        display: none;
    }
    /*inputs*/
    
    #msform input,
    #msform textarea {
        padding: 15px;
        border: 1px solid #ccc;
        border-radius: 3px;
        margin-bottom: 10px;
        width: 100%;
        box-sizing: border-box;
        font-family: montserrat;
        color: #2C3E50;
        font-size: 13px;
    }
    /*buttons*/
    
    #msform .action-button {
        width: 100px;
        background: #20A7F0;
        /*blue*/
        font-weight: bold;
        color: white;
        border: 0 none;
        border-radius: 1px;
        cursor: pointer;
        padding: 10px 5px;
        margin: 10px 5px;
    }
    
    #msform .action-button:hover,
    #msform .action-button:focus {
        box-shadow: 0 0 0 2px white, 0 0 0 3px #27AE60;
    }
    /*headings*/
    
    .fs-title {
        font-size: 15px;
        text-transform: uppercase;
        color: #2C3E50;
        margin-bottom: 10px;
    }
    
    .fs-subtitle {
        font-weight: normal;
        font-size: 13px;
        color: #666;
        margin-bottom: 20px;
    }
    /*progressbar*/
    
    #progressbar {
        margin-bottom: 30px;
        overflow: hidden;
        /*CSS counters to number the steps*/
        counter-reset: step;
    }
    
    #progressbar li {
        list-style-type: none;
        color: black;
        text-transform: uppercase;
        font-size: 9px;
        width: 33.33%;
        float: left;
        position: relative;
    }
    
    #progressbar li:before {
        content: counter(step);
        counter-increment: step;
        width: 20px;
        line-height: 20px;
        display: block;
        font-size: 10px;
        color: #333;
        background: white;
        border-radius: 3px;
        margin: 0 auto 5px auto;
    }
    /*progressbar connectors*/
    
    #progressbar li:after {
        content: '';
        width: 100%;
        height: 2px;
        background: white;
        position: absolute;
        left: -50%;
        top: 9px;
        z-index: -1;
        /*put it behind the numbers*/
    }
    
    #progressbar li:first-child:after {
        /*connector not needed before the first step*/
        content: none;
    }
    /*marking active/completed steps green*/
    /*The number of the step and the connector before it = green*/
    
    #progressbar li.active:before,
    #progressbar li.active:after {
        background: #20A7F0;
        color: white;
    }
    
    input[type=radio] {
        visibility: hidden;
    }
    
    label.radio {
        cursor: pointer;
        text-indent: 35px;
        overflow: visible;
        display: inline-block;
        position: relative;
        margin-bottom: 1px;
    }
    
    label.radio:before {
        background: #3a57af;
        content: '';
        position: absolute;
        top: 2px;
        left: 0;
        width: 20px;
        height: 20px;
        border-radius: 100%;
    }
    
    label.radio:after {
        opacity: 0;
        content: '';
        position: absolute;
        width: 0.5em;
        height: 0.25em;
        background: transparent;
        top: 7.5px;
        left: 4.5px;
        border: 2px solid #ffffff;
        border-top: none;
        border-right: none;
        -webkit-transform: rotate(-45deg);
        -moz-transform: rotate(-45deg);
        -o-transform: rotate(-45deg);
        -ms-transform: rotate(-45deg);
        transform: rotate(-45deg);
    }
    
    input[type=radio]:checked + label:after {
        opacity: 1;
    }
    
    .gender {
        float: left;
        width: auto;
        margin-left: 3em;
    }
    
    
}
</style>

<body>

   

    <center><br><br><br>

        <h1> Account Registration </h1> </center>
    <!-- multistep form -->
    <form id="msform" action="register-process.php" method="POST">
        <!-- progressbar -->
        <ul id="progressbar">
            <li class="active">Account Setup</li>
            <li>Personal Details</li>
            <li>Contact Details</li>
        </ul>
        <!-- fieldsets -->
        <fieldset>
            <h2 class="fs-title">Create your account</h2>
            <h3 class="fs-subtitle"></h3>
            <input type="text" id="username" name="username" placeholder="username" />
            <input type="password" id="password" name="password" placeholder="password" /><span id="message"></span>
            <input type="password" id="confirm_password" name="confirm_password" placeholder="confirm password" />
            <input type="button" name="next" class="next action-button" value="Next" />
        </fieldset>

        <fieldset>
            <h2 class="fs-title">Personal Detail</h2>
            <h3 class="fs-subtitle">Your personal detail</h3>
            <input type="text" id="fullname" name="fullname" placeholder="fullname" />

            <input type="text" id="IC" name="IC" placeholder="IC number" maxlength="12" />

            <label>Date of birth</label>
            <br>
            <br>
            <input type="text" id="datepicker" name="DOB" placeholder="DOB" />

            <label for="gender" style=" float: left">Gender</label>
            </br>
            </br>

            <select name="gender" style=" float: left" id="time" placeholder="Choose your preffered time">
                <option>---Gender--</option>
                <option value="male">Male</option>
                <option value="female">Female</option>
            </select>
            <br>
            <br>

            <input type="button" name="previous" class="previous action-button" value="Previous" />
            <input type="button" name="next" class="next action-button" value="Next" />
        </fieldset>

        <fieldset>
            <h2 class="fs-title">Contact Details</h2>
            <h3 class="fs-subtitle"></h3>
            <input type="text" id="phoneNo" name="phoneNo" placeholder="phone number" maxlength="11" />
            <input type="email" id="email" name="email" placeholder="email" />
            <textarea name="address" placeholder="Address"></textarea>
            <input type="button" name="previous" class="previous action-button" value="Previous" />
            <button type="submit" name="submit" class="add" onclick="myFunction()">submit</button>
        </fieldset>
    </form>
</body>
<script>
    function myFunction() {
        alert("Your Data is Successfully added!");
    }
</script>

<script>
    $('#password, #confirm_password').on('keyup', function() {

        if ($('#password').val() == $('#confirm_password').val()) {
            $('#message').html('Match').css('color', 'green');
        } else
            $('#message').html('Not Match').css('color', 'red');
    });

    $(function() {
        $("#datepicker").datepicker({
            dateFormat: 'dd-M-yy',
            changeMonth: true,
            changeYear: true,
            yearRange: '1990:2013'
        });
    });

    //jQuery time
    var current_fs, next_fs, previous_fs; //fieldsets
    var left, opacity, scale; //fieldset properties which we will animate
    var animating; //flag to prevent quick multi-click glitches

    $(".next").click(function() {
        if (animating) return false;
        animating = true;

        current_fs = $(this).parent();
        next_fs = $(this).parent().next();

        //activate next step on progressbar using the index of next_fs
        $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

        //show the next fieldset
        next_fs.show();
        //hide the current fieldset with style
        current_fs.animate({
            opacity: 0
        }, {
            step: function(now, mx) {
                //as the opacity of current_fs reduces to 0 - stored in "now"
                //1. scale current_fs down to 80%
                scale = 1 - (1 - now) * 0.2;
                //2. bring next_fs from the right(50%)
                left = (now * 50) + "%";
                //3. increase opacity of next_fs to 1 as it moves in
                opacity = 1 - now;
                current_fs.css({
                    'transform': 'scale(' + scale + ')',
                    'position': 'absolute'
                });
                next_fs.css({
                    'left': left,
                    'opacity': opacity
                });
            },
            duration: 800,
            complete: function() {
                current_fs.hide();
                animating = false;
            },
            //this comes from the custom easing plugin
            easing: 'easeInOutBack'
        });
    });

    $(".previous").click(function() {
        if (animating) return false;
        animating = true;

        current_fs = $(this).parent();
        previous_fs = $(this).parent().prev();

        //de-activate current step on progressbar
        $("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");

        //show the previous fieldset
        previous_fs.show();
        //hide the current fieldset with style
        current_fs.animate({
            opacity: 0
        }, {
            step: function(now, mx) {
                //as the opacity of current_fs reduces to 0 - stored in "now"
                //1. scale previous_fs from 80% to 100%
                scale = 0.8 + (1 - now) * 0.2;
                //2. take current_fs to the right(50%) - from 0%
                left = ((1 - now) * 50) + "%";
                //3. increase opacity of previous_fs to 1 as it moves in
                opacity = 1 - now;
                current_fs.css({
                    'left': left
                });
                previous_fs.css({
                    'transform': 'scale(' + scale + ')',
                    'opacity': opacity
                });
            },
            duration: 800,
            complete: function() {
                current_fs.hide();
                animating = false;
            },
            //this comes from the custom easing plugin
            easing: 'easeInOutBack'
        });
    });

    $(".submit").click(function() {
        return false;
    })
</script>

</html>