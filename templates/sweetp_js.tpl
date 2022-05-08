<script>
window.addEventListener('DOMContentLoaded', function() {

    /* fix iphone toolbar color */
    var themes = document.querySelectorAll("[name='theme-color']");
    themes[0].remove()

    /* fix footer */
    var today = new Date();
    var yyyy = today.getFullYear();

    var footer = document.getElementById('sweetp-footer');
    footer.innerHTML = '<p>Copyright &copy; ' + yyyy + ' <a href="https://sweetpproductions.com">SweetP Productions, Inc.</a> All rights reserved.</p>';

    //observe changes
    const observer = new MutationObserver((event) => {
        //add height to footer with posts to give room for pagination-block
        var posts = document.querySelectorAll("ul.posts.timeline");
        if (posts.length !== 0) {
            footer.classList.add("padded");
        } else {
            footer.classList.remove("padded");
        }
    });
    observer.observe(document.body, {attributes: true, childList: true, subtree: true});
});
</script>