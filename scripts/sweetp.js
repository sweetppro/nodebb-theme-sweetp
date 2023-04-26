'use strict';

function checkFooter() {
    //add height to footer with posts to give room for pagination-block
    var footer = document.getElementById('sweetp-footer');
    var posts = document.querySelectorAll("ul.posts.timeline");
    var panel = document.getElementById('panel');
    if (posts.length !== 0) {
        if (!footer.classList.contains("padded")) {
            footer.classList.add("padded");
        }

        if (!panel.classList.contains("padded")) {
            panel.classList.add("padded");
        }
    } else {
        footer.classList.remove("padded");
        panel.classList.remove("padded");
    }
}

/**
 * This file shows how client-side javascript can be included via a plugin.
 * If you check `plugin.json`, you'll see that this file is listed under "scripts".
 * That array tells NodeBB which files to bundle into the minified javascript
 * that is served to the end user.
 *
 * There are two (standard) ways to wait for when NodeBB is ready.
 * This one below executes when NodeBB reports it is ready...
 */

(async () => {
    const hooks = await app.require('hooks');
    hooks.on('action:ajaxify.end', ( /* data */ ) => {
        checkFooter();
    });
})();

/**
 * ... and this one reports when the DOM is loaded (but NodeBB might not be fully ready yet).
 * For most cases, you'll want the one above.
 */

$(document).ready(function() {
    /* update footer date */
    var today = new Date();
    var yyyy = today.getFullYear();

    var footer = document.getElementById('sweetp-footer');
    footer.innerHTML = '<p>Copyright &copy; ' + yyyy + ' <a href="https://sweetpproductions.com">SweetP Productions, Inc.</a> All rights reserved.</p>';

    checkFooter();
});