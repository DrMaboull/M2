<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	 <xsl:output 

        method="html"

        encoding="UTF-8"

        doctype-public="-//W3C//DTD HTML 4.01//EN"

    doctype-system="http://www.w3.org/TR/html4/strict.dtd"

        indent="yes" ></xsl:output>
	
	<xsl:template match="/">
	  <html>
	    <head>
	      <title><xsl:value-of select="livre/entete/titre" /> </title>
	      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	    </head>
	    
	    <body>
	      <h1><xsl:value-of select="livre/entete/titre" /> </h1>
	      <xsl:value-of select="livre/entete/auteur" />
	      Série : <xsl:value-of select="livre/entete/serie" />
	      <h2>Description du livre</h2>
	     
			<xsl:apply-templates select="livre/description/mots_cles/mot"></xsl:apply-templates>
			<xsl:apply-templates select="livre/description/texte"></xsl:apply-templates>
  			
	    </body>
	  </html>
	</xsl:template>
	
	<xsl:template match="mot">
  		<p>
  			<xsl:number format="1."></xsl:number>
  			<xsl:value-of select="."/>
  		</p>
	</xsl:template>
	
	<xsl:template match="texte">
  		<p>
  			<xsl:number format="1."></xsl:number>
  			<xsl:value-of select="."/>
  		</p>
	</xsl:template>
	
</xsl:stylesheet>