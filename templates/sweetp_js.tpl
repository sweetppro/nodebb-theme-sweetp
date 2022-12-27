<script>
function updateMobileNav() {
    //apply active class to mobile menu
    //get active tab from main menu
     var active = document.querySelectorAll("#main-nav > .active")[0];
    if (active !== undefined) {
        //get title from child
        var child = active.querySelectorAll("a")[0];
        var title = child.dataset.originalTitle;
        if (title === undefined) {
            title = child.title;
        }

        //get mobile element
        var mobileMenu = document.querySelector(".menu-section-list");
        var mobileElems = mobileMenu.querySelectorAll('.navigation-link');
        mobileElems.forEach((elem) => {
            var mobileTitle = elem.title;

            //add selected class
              if (mobileTitle == title) {
                elem.classList.add("selected");
            } else {
                elem.classList.remove("selected");
             }
        });
    }
}

$(window).on('action:ajaxify.updateTitle', function() {
    updateMobileNav();
});

window.addEventListener('DOMContentLoaded', function() {

    /* fix iphone toolbar color */
    var themes = document.querySelectorAll("[name='theme-color']");
    themes[0].remove()

    /* fix footer */
    var today = new Date();
    var yyyy = today.getFullYear();

    var footer = document.getElementById('sweetp-footer');
    footer.innerHTML = '<p>Copyright &copy; ' + yyyy + ' <a href="https://sweetpproductions.com">SweetP Productions, Inc.</a> All rights reserved.</p>';

    function checkFooterHeight() {
        //add height to footer with posts to give room for pagination-block
        var posts = document.querySelectorAll("ul.posts.timeline");
        if (posts.length !== 0) {
            footer.classList.add("padded");
        } else {
            footer.classList.remove("padded");
        }
    }

    //observe changes
    $(window).on('action:ajaxify.end', function(ev, data) {
        checkFooterHeight();
    });
    
});
</script>