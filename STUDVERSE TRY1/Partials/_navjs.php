<script type="text/javascript" src="HomePage_js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="HomePage_js/lightbox.js"></script>
<script type="text/javascript" src="HomePage_js/all.js"></script>
<script type="text/javascript" src="HomePage_js/isotope.pkgd.min.js"></script>
<script type="text/javascript" src="HomePage_js/owl.carousel.js"></script>
<script type="text/javascript" src="HomePage_js/jquery.flexslider.js"></script>
<script type="text/javascript" src="HomePage_js/jquery.rateyo.js"></script>
<!-- <script type="text/javascript" src="js/jquery.mmenu.all.js"></script> -->
<!-- <script type="text/javascript" src="js/jquery.meanmenu.min.js"></script> -->
<script type="text/javascript" src="HomePage_js/custom.js"></script>
<script>
    $(window).scroll(function() {
        if ($(this).scrollTop() > 50) {
            $('.scrolltop:hidden').stop(true, true).fadeIn();
        } else {
            $('.scrolltop').stop(true, true).fadeOut();
        }
    });
    $(function() {
        $(".scroll").click(function() {
            $("html,body").animate({
                scrollTop: $(".thetop").offset().top
            }, "1000");
            return false
        })
    })
</script>