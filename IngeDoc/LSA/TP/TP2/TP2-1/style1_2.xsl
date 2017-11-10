<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html lang="fr">
            <head>
                <title>Les planètes</title>
            </head>
            <body>
                <!-- Mettre ici vos instructions -->
                <xsl:for-each select="systeme_solaire/planete">
    				<div>
			  			<p>
			  				<b><xsl:value-of select="./nom"/> :</b>
			  			</p>
			  			<ul>
			  				<li>
			  					Distance au Soleil: <xsl:value-of select="./distance"/>
			  				</li>
			  				<li>
			  					Masse: <xsl:value-of select="./masse"/>
			  				</li>
			  				<li>
			  					Diamètre: <xsl:value-of select="./diametre"/>
			  				</li>
			  			</ul>
			  		</div>
    			</xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
