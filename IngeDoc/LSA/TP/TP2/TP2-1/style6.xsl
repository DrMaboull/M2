<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
    <xsl:output method="html"/>
    
    <xsl:template match="/systeme_solaire">
        <html lang="fr">
            <head>
                <title>Les planètes</title>
            </head>
            <body>
                <!-- Mettre ici vos instructions -->
                <xsl:apply-templates select="./planete">
                	<xsl:sort select="diametre" data-type="number" />
                </xsl:apply-templates>
                  
			    <val>
					<xsl:call-template name="sum">
						<xsl:with-param name="nodes" select="planete" />
					</xsl:call-template>
			    </val>
			    
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="planete">
    	<xsl:if test="not(./nom='Terre')">
	  		<div>
	  			<p>
	  				<b><xsl:value-of select="./nom"/> :</b>
	  			</p>
	  			<ul>
	  				<li>
	  					Distance au Soleil: <xsl:value-of select="./distance"/> <xsl:value-of select="./distance/@unit" />
	  				</li>
	  				<li>
	  					Masse: <xsl:value-of select="./masse"/> <xsl:value-of select="./masse/@unit" />
	  				</li>
	  				<li>
	  					Diamètre: <xsl:value-of select="./diametre"/> <xsl:value-of select="./diametre/@unit" />
	  				</li>
	  				<xsl:if test="./satellite">
	  					<li>
	  						Nombre de satellites: <xsl:value-of select="./satellite"/>
	  					</li>
	  				</xsl:if>
	  			</ul>
	  		</div>
  		</xsl:if>
	</xsl:template>
	
	
	<xsl:template name="sum">
    	<xsl:param name="nodes" />
    	<xsl:param name="sum" select="0" />

    	<xsl:variable name="curr" select="$nodes[1]" />
    	<xsl:variable name="terre" select="$nodes[1]" />

    	<!-- if we have a node, calculate & recurse -->
    	<xsl:if test="$curr">
      		<xsl:variable name="runningsum" select="
    		$sum + $curr/diametre * $terre/diametre
      		" />
      		<xsl:call-template name="sum">
        		<xsl:with-param name="nodes" select="$nodes[position() &gt; 1]" />
        		<xsl:with-param name="sum"   select="$runningsum" />
      		</xsl:call-template>
    	</xsl:if>

	    <!-- if we don't have a node (last recursive step), return sum -->
	    <xsl:if test="not($curr)">
	      	Fin: <xsl:value-of select="$sum" />
	    </xsl:if>
	    
	    

  	</xsl:template>
</xsl:stylesheet>

