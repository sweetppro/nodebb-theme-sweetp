'use strict';

const nconf = require.main.require('nconf');
const meta = require.main.require('./src/meta');
const _ = require.main.require('lodash');
const user = require.main.require('./src/user');

const controllers = require('../../nodebb-theme-harmony/lib/controllers');

const library = module.exports;

const defaults = {
    enableQuickReply: 'on',
    centerHeaderElements: 'off',
    mobileTopicTeasers: 'off',
    stickyToolbar: 'on',
    topicSidebarTools: 'on',
    topMobilebar: 'off',
    autohideBottombar: 'off',
    openSidebars: 'off',
    chatModals: 'off',
};

library.init = async function (params) {
    const { router, middleware } = params;
    const routeHelpers = require.main.require('./src/routes/helpers');

    routeHelpers.setupAdminPageRoute(router, '/admin/plugins/harmony', [], controllers.renderAdminPage);

    routeHelpers.setupPageRoute(router, '/user/:userslug/theme', [
        middleware.exposeUid,
        middleware.ensureLoggedIn,
        middleware.canViewUsers,
        middleware.checkAccountPermissions,
    ], controllers.renderThemeSettings);

    require('./customHelpers');
};

library.addAdminNavigation = async function (header) {
    header.plugins.push({
        route: '/plugins/harmony',
        icon: 'fa-paint-brush',
        name: '[[themes/harmony:theme-name]]',
    });
    return header;
};

library.addProfileItem = async (data) => {
    data.links.push({
        id: 'theme',
        route: 'theme',
        icon: 'fa-paint-brush',
        name: '[[themes/harmony:settings.title]]',
        visibility: {
            self: true,
            other: false,
            moderator: false,
            globalMod: false,
            admin: false,
        },
    });

    return data;
};

async function loadThemeConfig(uid) {
    const [themeConfig, userConfig] = await Promise.all([
        meta.settings.get('harmony'),
        user.getSettings(uid),
    ]);

    const config = { ...defaults, ...themeConfig, ...(_.pick(userConfig, Object.keys(defaults))) };
    config.enableQuickReply = config.enableQuickReply === 'on';
    config.centerHeaderElements = config.centerHeaderElements === 'on';
    config.mobileTopicTeasers = config.mobileTopicTeasers === 'on';
    config.stickyToolbar = config.stickyToolbar === 'on';
    config.topicSidebarTools = config.topicSidebarTools === 'on';
    config.autohideBottombar = config.autohideBottombar === 'on';
    config.topMobilebar = config.topMobilebar === 'on';
    config.openSidebars = config.openSidebars === 'on';
    config.chatModals = config.chatModals === 'on';
    return config;
}

library.getThemeConfig = async function (config) {
    config.theme = await loadThemeConfig(config.uid);
    config.openDraftsOnPageLoad = false;
    return config;
};

library.getAdminSettings = async function (hookData) {
    if (hookData.plugin === 'harmony') {
        hookData.values = {
            ...defaults,
            ...hookData.values,
        };
    }
    return hookData;
};

library.saveUserSettings = async function (hookData) {
    Object.keys(defaults).forEach((key) => {
        if (hookData.data.hasOwnProperty(key)) {
            hookData.settings[key] = hookData.data[key] || undefined;
        }
    });
    return hookData;
};

library.filterMiddlewareRenderHeader = async function (hookData) {
    hookData.templateData.bootswatchSkinOptions = await meta.css.getSkinSwitcherOptions(hookData.req.uid);
    return hookData;
};
