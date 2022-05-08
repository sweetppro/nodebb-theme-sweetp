<script>
window.addEventListener('DOMContentLoaded', function() {

    /* fix iphone toolbar color */
    var themes = document.querySelectorAll("[name='theme-color']");
    themes[0].remove()

    /* fix footer */
    var today = new Date();
    var yyyy = today.getFullYear();

    document.getElementById('sweetp-footer').innerHTML = '<p>Copyright &copy; ' + yyyy + ' <a href="https://sweetpproductions.com">SweetP Productions, Inc.</a> All rights reserved.</p>';
});
</script>