'use strict';

const helpers = require.main.require('./src/helpers');

helpers.buildCategoryLabel = (category, className = '') => {
    if (!category) {
        return '';
    }

    // add our custom class if a background image is present
    var sweetp_class = ""
    if (category.backgroundImage) {
        sweetp_class = 'badge-with-icon';
    }

    return `<span class="badge px-1 ${className} ${sweetp_class}" style="${generateCategoryBackground(category)}">
            ${category.icon ? `<i class="fa fa-fw ${category.icon}"></i>` : ''}
            ${category.name}
        </span>`;
};