<?xml version="1.0" encoding="UTF-8"?>
<!-- 		
			Filename:			StructureTemplate.xslt
			Copyright, Varian Medical systems, Inc., 2004-2005
			All Rights Reserved
			Varian Proprietary
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output omit-xml-declaration="yes" indent="yes" media-type="text/html"/>
	 
   <!-- Handles structures output -->
	<xsl:include href="Structures.xslt"/>
	
	<xsl:template match="/">
		<html>
			<head>
				<meta HTTP-EQUIV="expires" content="0"/>
				<title>Structure Template (v. <xsl:value-of select="StructureTemplate/@Version"/>)</title>
				<link REL="stylesheet" TYPE="text/css" href="..\StyleSheets\ProtocolStyles.css"/>
			</head>
			<body>
				<table border="0" cellpadding="1" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td aling="left" valing="middle" width="640">
								<h1>Structure Template</h1>
							</td>
							<td align="right" valing="middle" width="200">
								<img border="0">
									<xsl:attribute name="src">
										<xsl:text disable-output-escaping="yes">..\StyleSheets\Logo.bmp</xsl:text>
									</xsl:attribute>
								</img>
							</td>
						</tr>
					</tbody>
				</table>
				
				<!-- Preview -->
				
				<xsl:for-each select="StructureTemplate/Preview">
					<table border="0" cellpadding="1" cellspacing="1">
						<tbody class="protocolinfo">
							<tr>
								<td width="140">Id:</td>
								<td width="140"><span style="font-weight:bold; "><xsl:value-of select="@ID"/></span></td>
							</tr>
							<tr>
								<td width="140">Status:</td>
								<td width="140"><xsl:value-of select="@ApprovalStatus"/></td>						
							</tr>
							<tr>
								<td width="140">Last Modified:</td>
								<td colspan="2" width="520"><xsl:value-of select="@LastModified"/></td>
							</tr>
							<tr>
								<td width="140">Diagnosis:</td>
								<td width="140"><xsl:value-of select="@Diagnosis"/></td>	
							</tr>							
							<tr>
								<td width="140">Treatment Site:</td>
								<td width="140"><xsl:value-of select="@TreatmentSite"/></td>	
							</tr>
							<tr>
								<td width="140">Description:</td>
								<td width="140"><xsl:value-of select="@Description"/></td>	
							</tr>
						</tbody>
					</table>
			 </xsl:for-each>	
			<hr color="black" size="1"/>
			
			<!-- Structures -->
			
			<xsl:if test="count(StructureTemplate/Structures/Structure  ) &gt; 0">						
			<h2>Structures</h2>						
				<div class="details">										
					<xsl:apply-templates select="StructureTemplate"/>
				</div>						
			</xsl:if>	
			<br/>
		    <hr color="black" size="1"/>
		</body>
	 </html>
  </xsl:template>
</xsl:stylesheet>
