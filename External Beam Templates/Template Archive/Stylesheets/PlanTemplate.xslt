<?xml version="1.0" encoding="UTF-8"?>
<!-- 		
			Filename:			PlanTemplate.xslt
			Copyright, Varian Medical systems, Inc., 2004-2005
			All Rights Reserved
			Varian Proprietary
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output omit-xml-declaration="yes" indent="yes" media-type="text/html"/>
    	<!-- Handles fields	output -->
	<xsl:include href="Fields.xslt"/>
	<xsl:template match="/">
		<html>
			<head>
				<meta HTTP-EQUIV="expires" content="0"/>
				<title>Plan Template (v. <xsl:value-of select="PlanTemplate/@Version"/>)</title>
				<link REL="stylesheet" TYPE="text/css" href="..\StyleSheets\ProtocolStyles.css"/>
			</head>
			<body>
				<table border="0" cellpadding="1" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td aling="left" valing="middle" width="640">
								<h1>Plan Template</h1>
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
				<xsl:for-each select="PlanTemplate">
					<xsl:for-each select="Preview">
						<table border="0" cellpadding="1" cellspacing="1">
							<tbody class="protocolinfo">
								<tr>
									<td width="140">Id:</td>
									<td width="140">
										<span style="font-weight:bold; ">
											<xsl:value-of select="@ID"/>
										</span>
									</td>
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
									<td width="140">Treatment Mode:</td>
									<td width="140"><xsl:value-of select="@Mode"/></td>
								</tr>
								<tr>
									<td width="140">Diagnosis:</td>
									<td width="140"><xsl:value-of select="@Diagnosis"/></td>
								</tr>								
								<tr>
									<td width="140">Treatment Style:</td>
									<td width="140"><xsl:value-of select="@TreatmentStyle"/></td>
								</tr>
								<tr>
									<td width="140">Treatment Site:</td>
									<td width="140"><xsl:value-of select="@TreatmentSite"/></td>
								</tr>
								<tr>
									<td width="140">Description:</td>
									<td width="520"><xsl:value-of select="@Description"/></td>
								</tr>
							</tbody>
						</table>
					</xsl:for-each>
					<hr color="black" size="1"/>
					
					<!-- Plan details -->
					
					<h2>Plan</h2>	
					<div class="details">
						<table border="0" cellpadding="1" cellspacing="1">
							<tbody class="infotable">
								<tr>
									<td width="140">Fraction Count:</td>
									<td width="140"><xsl:value-of select="FractionCount"/></td>
									<td width="140">Dose Per Fraction [<xsl:value-of select="DosePerFraction/@Unit"/>]:</td>
									<td width="140"><xsl:value-of select="DosePerFraction"/></td>
								</tr>
								<tr>
									<td width="140">Target Volume:</td>
									<td width="140">
										<xsl:value-of select="PrescriptionSite/VolumeId"/> <xsl:value-of select="PrescriptionSite/VolumeType"/>
									</td>
									<td width="140">Prescribed Percentange %:</td>
									<td width="140"><xsl:value-of select="PrescribedPercentage"/></td>
								</tr>
								<tr>
									<td width="140">Field Alignment Rules:</td>
									<td colspan="4" width="420"><xsl:value-of select="FieldAlignmentRules"/></td>
								</tr>
								<xsl:for-each select="PatientSupportDevice">
									<tr>
										<td width="140">Patient Support Device:</td>
										<td colspan="4" width="420"><xsl:value-of select="@ID"/>
											 (<xsl:value-of select="Type"/>)</td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						<xsl:if test="count(Boluses/Bolus  ) &gt; 0">
							<xsl:for-each select="Boluses">
								<h3>Plan Boluses</h3>
									<table border="0" cellpadding="1" cellspacing="1">
									<thead class="tableheader">
										<tr align="center" valign="middle">																		
											<td width="70">Id</td>
											<td width="90">Thickness (<xsl:value-of select="Bolus/Thickness/@Unit"/>)</td>
										</tr>
									</thead>
									<tbody class="tablebody">
										<xsl:for-each select="Bolus">
											<tr align="center" valign="middle">																		
												<td width="70"><xsl:value-of select="@ID"/></td>
												<td width="90"><xsl:value-of select="Thickness"/></td>
											</tr>
										</xsl:for-each>
									</tbody>
								</table>
								<br/>
							</xsl:for-each>
						</xsl:if>

						<!-- Brachy Solid Applicators -->
						<xsl:if test="count(BrachySolidApplicators/BrachySolidApplicator) &gt; 0">
							<h3>Plan Solid Applicator Details</h3>
							<xsl:for-each select="BrachySolidApplicators">
							<xsl:for-each select="BrachySolidApplicator">
								<h3>Solid Applicator: <xsl:value-of select="@ID"/></h3>
								<table border="0" cellpadding="1" cellspacing="1">
									<tbody class="infotable">
									<tr>	
										<td width="140">SolidApplicatorUID:</td>
										<td width="140">
											<xsl:value-of select="@ApplicatorPartUID"/>
										</td>
										<td width="140">SolidApplicatorFile:</td>
										<td width="140">
											<xsl:value-of select="@ApplicatorPartFileName"/>
										</td>
									</tr>
									</tbody>
								</table>
								<br/>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:if>

					        <!-- Fields --> 
						<xsl:if test="count(Fields/Field) &gt; 0 or count(Fields/BrachyField) &gt; 0">
							<xsl:apply-templates select="Fields"	/>
						</xsl:if>
											
					</div>
				</xsl:for-each>
				<br/>
				<hr color="black" size="1"/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
