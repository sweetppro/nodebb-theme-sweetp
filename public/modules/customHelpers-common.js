"use strict";

/* globals */
module.exports = function (utils, Benchpress) {
  const buildSweetPMetaTag = (tag) => {
    const name = tag.name ? `name="${utils.escapeHTML(tag.name)}" ` : "";
    if (tag.name !== "theme-color") {
      const property = tag.property ? `property="${utils.escapeHTML(tag.property)}" ` : "";
      const content = tag.content ? `content="${utils.escapeHTML(tag.content).replace(/\n/g, " ")}" ` : "";
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
