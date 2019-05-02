<?xml version="1.0" encoding="UTF-8"?>
<!-- 		
			Filename:			Structures.xslt
			Copyright, Varian Medical systems, Inc., 2004-2005
			All Rights Reserved
			Varian Proprietary
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output omit-xml-declaration="yes" indent="yes" media-type="text/html"/>
	<xsl:template match="StructureTemplate">
		<xsl:for-each select="Structures">
			<table border="0" cellpadding="1" cellspacing="1">
				<thead class="tableheader">
					<tr align="center" valign="middle">
						<td width="70">ID</td>
						<td width="100">Name</td>
						<td width="120">Identification</td>
						<td width="120">Color</td>
						<td width="60">CT Low</td>
						<td width="60">CT High</td>
						<td width="80">DVH Line Style</td>
						<td width="80">DVH Line Color</td>
						<td width="80">DVH Line Width</td>
						<!-- Not currently in use<td width="65">EUD Alpha</td><td width="65">TCP Alpha</td><td width="65">TCP Beta</td><td width="65">TCP Gamma</td>-->
					</tr>
				</thead>
				<tbody class="tablebody">
					<xsl:for-each select="Structure">
						<tr align="center" valign="middle">
							<td width="70"><xsl:value-of select="@ID"/></td>				
							<td width="100"><xsl:value-of select="@Name"/></td>																	
							<td width="120">
							<xsl:value-of select="Identification/VolumeID"/> 	
							<xsl:value-of select="Identification/VolumeCode"/> 
							<xsl:value-of select="Identification/VolumeType"/> 
							<xsl:value-of select="Identification/VolumeCodeTable"/>
							</td>
							<td width="120"><xsl:value-of select="ColorAndStyle"/></td>				
							<td width="60"><xsl:value-of select="SearchCTLow"/></td>				
							<td width="60"><xsl:value-of select="SearchCTHigh"/></td>		
							<td width="60"><xsl:value-of select="DVHLineStyle"/></td>
							<xsl:if test="DVHLineColor = &quot;Automatic&quot;">
								<td width="80">Automatic</td>
							</xsl:if>
							<xsl:if test="DVHLineColor != &quot;Automatic&quot;">
								<td width="80" bgcolor="{DVHLineColor}"></td>
							</xsl:if>																													
							<td width="60"><xsl:value-of select="DVHLineWidth"/></td>		
							<!-- Not currently in use	<td width="65"><xsl:value-of select="EUDAlpha"/></td><td width="65"><xsl:value-of select="TCPAlpha"/></td><td width="65"><xsl:value-of select="TCPBeta"/></td><<td width="65"><xsl:value-of select="TCPGamma"/></td>-->
						</tr>
					</xsl:for-each>
				</tbody>
			</table>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
