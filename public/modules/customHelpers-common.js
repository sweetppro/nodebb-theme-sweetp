'use strict';

/* globals */

module.exports = function(Benchpress) {
    const buildSweetPMetaTag = (tag) => {
        const name = tag.name ? 'name="' + tag.name + '" ' : '';
        if (tag.name !== "theme-color") {
            const property = tag.property ? 'property="' + tag.property + '" ' : '';
            const content = tag.content ? 'content="' + tag.content.replace(/\n/g, ' ') + '" ' : '';

            return '<meta ' + name + property + content + '/>\n\t';
        }
    };

    const customHelpers = {
        buildSweetPMetaTag,
    };

    function register() {
        Object.keys(customHelpers).forEach((helperName) => {
            Benchpress.registerHelper(helperName, customHelpers[helperName]);
        });
    }

    register();

    return customHelpers;
};