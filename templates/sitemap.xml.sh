today=$(date -u +%F)
cat <<EOF
<urlset>
	<url>
		<loc>https://$SITE/</loc>
		<lastmod>$today</lastmod>
		<priority>1.0</priority>
	</url>
</urlset>
EOF
