cat <<EOF
<urlset>
	<url>
		<loc>https://$SITE/</loc>
		<lastmod>$(date -u +%F)</lastmod>
		<priority>0.8</priority>
	</url>
</urlset>
EOF
