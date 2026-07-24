'use strict';

const factory = require('./customHelpers-common');

define(['utils', 'benchpress', 'translator'], function (utils, Benchpressjs, translator) {
    return factory(utils, Benchpressjs, translator);
});
