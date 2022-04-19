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
<link rel="canonical" href="https://$SITE" />
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
		hyphens: auto;
		-moz-hyphens: auto;
		-webkit-hyphens: auto;
		-ms-hyphens: auto;
	}
	body {
		margin: auto;
		padding: 1.5rem;
		max-width: 33rem;
	}
	h1 {
		position: absolute;
		clip: rect(0, 0, 0, 0);
	}
	img {
		display: block;
		margin: auto;
		width: 256px;
		height: 256px;
	}
	p, ul {
		margin-top: 1.5rem;
	}
	ul {
		padding-left: 1.5rem;
	}
	a {
		color: currentColor;
	}
</style>
<title>F. Emerson</title>
<article>
	<h1>F. Emerson</h1>
	<img alt="F. Emerson's avatar" src="$(dataurify "$dir/avatar.jpg")">
	<p>Hi! I'm <strong>F. Emerson</strong>.
	<ul>
		<li>Writing: <a href="https://staticwords.com">Static Words</a>
		<li>Code: <a href="https://sr.ht/~fmrsn">SourceHut</a>, <a href="https://bsid.es">B-Sides</a>
		<li>Consultancy: <a href="https://tria.systems">Tria</a>
		<li>Contact: <a href="mailto:fmrsn@fmrsn.com">Email</a>, <a href="https://www.linkedin.com/in/fmrsn">LinkedIn</a>
	</ul>
</article>
</html>
EOF
