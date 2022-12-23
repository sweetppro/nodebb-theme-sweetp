<!DOCTYPE html>
<html id="sweetp" lang="{function.localeToHTML, userLang, defaultLang}" {{{if languageDirection}}}data-dir="{languageDirection}" style="direction: {languageDirection};"{{{end}}}>
<head>
	<title>{browserTitle}</title>
	<meta name="color-scheme" content="dark light">
	<meta name="theme-color" content="#f5f5f5" media="(prefers-color-scheme: light)">
	<meta name="theme-color" content="#1e1e1e" media="(prefers-color-scheme: dark)">
	{{{each metaTags}}}{function.buildMetaTag}{{{end}}}
	<link rel="stylesheet" type="text/css" href="{relative_path}/assets/client{{{ if (languageDirection=="rtl") }}}-rtl{{{ end }}}.css?{config.cache-buster}" />
	{{{each linkTags}}}{function.buildLinkTag}{{{end}}}

	<script>
		var config = JSON.parse('{{configJSON}}');
		var app = {
			user: JSON.parse('{{userJSON}}')
		};
		document.documentElement.style.setProperty('--panel-offset', `${localStorage.getItem('panelOffset') || 0}px`);
	</script>

	<!-- IMPORT sweetp_js.tpl -->

	{{{if useCustomHTML}}}
	{{customHTML}}
	{{{end}}}
	{{{if useCustomCSS}}}
	<style>{{customCSS}}</style>
	{{{end}}}
</head>

<body class="{bodyClass} skin-noskin">
    <div id="sweetp-wrapper">
        <nav id="menu" class="slideout-menu hidden">
            <!-- IMPORT partials/slideout-menu.tpl -->
        </nav>
        <nav id="chats-menu" class="slideout-menu hidden">
            <!-- IMPORT partials/chats-menu.tpl -->
        </nav>

        <main id="panel" class="slideout-panel">
			<nav class="navbar sticky-top navbar-expand-lg header" id="header-menu" component="navbar">
				<div class="container justify-content-start flex-nowrap">
					<!-- IMPORT partials/menu.tpl -->
				</div>
			</nav>
			<script>
				const rect = document.getElementById('header-menu').getBoundingClientRect();
				const offset = Math.max(0, rect.bottom);
				document.documentElement.style.setProperty('--panel-offset', offset + `px`);
			</script>
			<div class="container" id="content">
			<!-- IMPORT partials/noscript/warning.tpl -->
			<!-- IMPORT partials/noscript/message.tpl -->