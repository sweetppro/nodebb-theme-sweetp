'use strict';

const plugin = {};

plugin.removeThemeColorMetaTag = async (hookData) => {

    var newTags = []
    hookData.tags.forEach((tag) => {

        if (tag.name !== "theme-color") {
            newTags.push(tag);
        }
    });

    hookData.tags = newTags;
    return hookData;
}

module.exports = plugin;