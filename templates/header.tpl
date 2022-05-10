<!DOCTYPE html>
	<html lang="{function.localeToHTML, userLang, defaultLang}" {{{if languageDirection}}}data-dir="{languageDirection}" style="direction: {languageDirection};"{{{end}}}><head>
	<title>{browserTitle}</title>
	{{{each metaTags}}}{function.buildMetaTag}{{{end}}}
	<meta name="theme-color" content="#fff" media="(prefers-color-scheme: light)">
	<meta name="theme-color" content="#232323" media="(prefers-color-scheme: dark)">
	<link rel="stylesheet" type="text/css" href="{relative_path}/assets/client{{{if bootswatchSkin}}}-{bootswatchSkin}{{{end}}}.css?{config.cache-buster}" />
	{{{each linkTags}}}{function.buildLinkTag}{{{end}}}

	<script>
		var config = JSON.parse('{{configJSON}}');
		var app = {
			user: JSON.parse('{{userJSON}}')
		};
	</script>

    <!-- IMPORT sweetp_js.tpl -->

	{{{if useCustomHTML}}}
	{{customHTML}}
	{{{end}}}
	{{{if useCustomCSS}}}
	<style>{{customCSS}}</style>
	{{{end}}}
</head>

<body class="{bodyClass} skin-{{{if bootswatchSkin}}}{bootswatchSkin}{{{else}}}noskin{{{end}}}">
    <div id="sweetp-wrapper">
        <nav id="menu" class="slideout-menu hidden">
            <!-- IMPORT partials/slideout-menu.tpl -->
        </nav>
        <nav id="chats-menu" class="slideout-menu hidden">
            <!-- IMPORT partials/chats-menu.tpl -->
        </nav>

        <main id="panel" class="slideout-panel">
            <nav class="navbar navbar-default navbar-fixed-top header" id="header-menu" component="navbar">
                <div class="container">
                    <!-- IMPORT partials/menu.tpl -->
                </div>
            </nav>
            <div class="container" id="content">
            <!-- IMPORT partials/noscript/warning.tpl -->
			<!-- IMPORT partials/noscript/message.tpl -->