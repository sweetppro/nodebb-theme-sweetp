<!DOCTYPE html>
<html id="sweetp" lang="{function.localeToHTML, userLang, defaultLang}" {{{if languageDirection}}}data-dir="{languageDirection}" style="direction: {languageDirection};"{{{end}}}>
<head>
	<title>{browserTitle}</title>
	<meta name="color-scheme" content="dark light">
	<meta name="theme-color" content="#ffffff" media="(prefers-color-scheme: light)">
	<meta name="theme-color" content="#1e1e1e" media="(prefers-color-scheme: dark)">
	{{{each metaTags}}}{function.buildSweetPMetaTag}{{{end}}}
	<link rel="stylesheet" type="text/css" href="{relative_path}/assets/client{{{if bootswatchSkin}}}-{bootswatchSkin}{{{end}}}{{{ if (languageDirection=="rtl") }}}-rtl{{{ end }}}.css?{config.cache-buster}" />
	{{{each linkTags}}}{function.buildLinkTag}{{{end}}}

	<script>
		var config = JSON.parse('{{configJSON}}');
		var app = {
			user: JSON.parse('{{userJSON}}')
		};

		document.documentElement.style.setProperty('--panel-offset', `${localStorage.getItem('panelOffset') || 0}px`);
	</script>

	{{{if useCustomHTML}}}
	{{customHTML}}
	{{{end}}}
	{{{if useCustomCSS}}}
	<style>{{customCSS}}</style>
	{{{end}}}
</head>

<body class="{bodyClass} skin-{{{if bootswatchSkin}}}{bootswatchSkin}{{{else}}}noskin{{{end}}}">
    {{{ if config.theme.topMobilebar }}}
	<!-- IMPORT partials/mobile-header.tpl -->
	{{{ end }}}

	<div id="sweetp-wrapper">
		<div class="d-flex justify-content-between pb-4 pb-md-0">
			<!-- IMPORT partials/sidebar-left.tpl -->

			<main id="panel" class="d-flex flex-column gap-3 flex-grow-1 mt-3" style="min-width: 0;">
				<!-- IMPORT partials/header/brand.tpl -->
				<!-- IMPORT sweetp_header.tpl -->
				<script>
					const headerEl = document.getElementById('header-menu');
					if (headerEl) {
						const rect = headerEl.getBoundingClientRect();
						const offset = Math.max(0, rect.bottom);
						document.documentElement.style.setProperty('--panel-offset', offset + `px`);
					} else {
						document.documentElement.style.setProperty('--panel-offset', `0px`);
					}
				</script>
				<div class="container d-flex flex-column gap-3" id="content">
				<!-- IMPORT partials/noscript/warning.tpl -->
				<!-- IMPORT partials/noscript/message.tpl -->
