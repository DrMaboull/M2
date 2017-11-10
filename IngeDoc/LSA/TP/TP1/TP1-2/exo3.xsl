<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="UTF-8" doctype-public="-//W3C//DTD HTML 4.01//EN" doctype-system="http://www.w3.org/TR/html4/strict.dtd" indent="yes">
	</xsl:output>
	
	
	<!-- MAIN TEMPLATE -->
	
	<xsl:template match="/">
		<html>
	    	<head>
	      	<title>Annuaire</title>
	      	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	    	</head>
	    
		    <body>
		    	
		    	<!-- Table des matières -->
		    	
		    	<h1>Table des matières</h1>
		    	<xsl:for-each select="annuaire/personne">
					<xsl:sort select="./nom_personne/text()" />
					<a>
						<xsl:attribute name="href">
							#<xsl:value-of select="./nom_personne/text()"/>
						</xsl:attribute>
	
						<xsl:value-of select="./nom_personne/text()" /> <br></br>
					</a>
				</xsl:for-each>
				<br></br>
	      		
	      		<!-- Annuaire -->
	      		
	      		<h1>Annuaire</h1>
	      
	      		<!-- Personnes -->
				<h2>Personne</h2>
				<xsl:apply-templates select="annuaire/personne"></xsl:apply-templates>
				
				<!-- Sociétés -->
				<h2>Société</h2>
				<xsl:apply-templates select="annuaire/societe"></xsl:apply-templates>
			</body>
	  	</html>
	</xsl:template>
	
	
	<!-- Templates -->
	
	<!-- template personne -->
	
	<xsl:template match="personne">
		<p><a>
			<xsl:attribute name="name">
				<xsl:value-of select="./nom_personne" />
			</xsl:attribute>
			<xsl:number format="1. "></xsl:number>
			<xsl:value-of select="./nom_personne" />
		</a></p>
  		<p>
  			<xsl:value-of select="./prenom_personne"/>
  		</p>
  		<p>
  			<xsl:value-of select="./mail"/>
  		</p>
  		<p>
  			<xsl:value-of select="./telephones_personne"/>
  		</p>
  		<p>
  			<xsl:value-of select="./secteur"/>
  		</p>
  		<p>
  			<xsl:value-of select="./poste"/>
  		</p>
  		<p>
  			<xsl:value-of select="./commentaire_personne"/>
  		</p>
	</xsl:template>
	
	<!-- template société -->
	
	<xsl:template match="societe">
  		<p><b>
  			<xsl:number format="a. "></xsl:number>
  			<xsl:value-of select="./nom_societe"/>
  		</b></p>
  		
  		<xsl:apply-templates select="branches"></xsl:apply-templates>
  		<xsl:apply-templates select="directeur"></xsl:apply-templates>
  		Commentaire : <xsl:value-of select="./commentaire_societe"/>
	</xsl:template>
	
	<!-- template branches -->
	
	<xsl:template match="branches">
			<xsl:apply-templates select="branche"></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="branche">
		<p>
			Branche : <xsl:number format="1"></xsl:number>
		</p>
		<p>
			<xsl:value-of select="."></xsl:value-of>
		</p>
	</xsl:template>
	
	<!-- template directeur -->
	
	<xsl:template match="directeur">
		<p>
			Directeur : <xsl:number format="1"></xsl:number>
		</p>
		<p>
			<xsl:value-of select="."></xsl:value-of>
		</p>
	</xsl:template>
</xsl:stylesheet>