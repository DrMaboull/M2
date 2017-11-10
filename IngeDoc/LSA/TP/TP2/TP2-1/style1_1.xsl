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
                <xsl:apply-templates select="systeme_solaire/planete"></xsl:apply-templates>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="planete">
    	<h1></h1>
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
	</xsl:template>
</xsl:stylesheet>
