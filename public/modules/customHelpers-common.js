"use strict";

/* globals */

module.exports = function (Benchpress) {
  const buildSweetPMetaTag = (tag) => {
    const name = tag.name ? `name="${escape(tag.name)}" ` : "";
    if (tag.name !== "theme-color") {
      const property = tag.property
        ? `property="${escape(tag.property)}" `
        : "";
      const content = tag.content
        ? `content="${escape(tag.content).replace(/\n/g, " ")}" `
        : "";

      return '<meta ' + name + property + content + '/>\n\t';
    }
    return "";
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
