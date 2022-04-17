dataurify() {
	mimetype=$(file -bN --mime-type "$1")
	content=$(openssl base64 -e -A -in "$1")
	printf 'data:%s;base64,%s' "$mimetype" "$content"
}

dir=$(CDPATH='' cd -- "$(dirname "$0")" && pwd)

cat <<EOF
<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<meta name="author" content="F. Emerson">
<meta name="description" content="The web home of F. Emerson.">
<link rel="shortcut icon" href="$(dataurify "$dir/favicon.png")">
<link rel="canonical" href="https://$SITE/" />
<style>
	*, ::before, ::after {
		box-sizing: border-box;
		margin: 0;
		padding: 0;
	}
	html {
		font-family: sans-serif;
		font-size: 16px;
		line-height: 1.5;
	}
	body {
		display: flex;
		padding: 1.5rem;
		height: 100vh;
		height: var(--wh, 100vh);
	}
	article {
		margin: auto;
		display: flex;
		align-items: center;
		flex-direction: column;
	}
	h1 {
		position: absolute;
		clip: rect(0, 0, 0, 0);
	}
	img {
		width: 256px;
		height: 256px;
		margin-bottom: 1.5rem;
	}
	@media (min-width: 720px) {
		article {
			flex-direction: row;
			align-items: center;
		}
		img {
			margin-bottom: 0;
			margin-right: 1.5rem;
		}
	}
	dl {
		display: grid;
		grid-template-columns: max-content auto;
		column-gap: 1.5rem;
	}
	dt {
		grid-column-start: 1;
		text-align: right;
	}
	dd {
		grid-column-start: 2;
	}
	ul {
		list-style: none;
	}
	li {
		display: inline-flex;
	}
	li:not(:last-child)::after {
		content: ' · ';
		white-space: pre-wrap;
	}
	a {
		color: currentColor;
	}
	a:link, a:visited {
		text-decoration-color: darkgray;
	}
	a:hover, a:active {
		text-decoration-color: currentColor;
	}
</style>
<title>F. Emerson</title>
<article>
	<h1>F. Emerson</h1>
	<img alt="F. Emerson's avatar" src="$(dataurify "$dir/avatar.jpg")">
	<dl>
		<dt>Writing</dt>
		<dd>
			<ul>
				<li><a href="https://staticwords.com/">Static Words</a>
			</ul>
		</dd>
		<dt>Projects</dt>
		<dd>
			<ul>
				<li><a href="https://sr.ht/~fmrsn">Sourcehut</a>
				<li><a href="https://bsid.es/">B-Sides</a>
			</ul>
		</dd>
		<dt>Consultancy</dt>
		<dd>
			<ul>
				<li><a href="https://tria.systems/">Tria</a>
			</ul>
		</dd>
		<dt>Contact</dt>
		<dd>
			<ul>
				<li><a href="mailto:fmrsn@fmrsn.com">Email</a>
				<li><a href="https://www.linkedin.com/in/fmrsn">LinkedIn</a>
			</ul>
		</dd>
	</dl>
</article>
<script>
	(function(window, document) {
		function onResize() {
			document.documentElement.style.setProperty("--wh", window.innerHeight + "px");
		}
		onResize();
		window.addEventListener("resize", onResize);
	})(window, document);
</script>
</html>
EOF