'use strict';

module.exports = require('../public/modules/customHelpers-common')(
		nodebb.require('./src/utils'),
    nodebb.require('benchpressjs')
);
