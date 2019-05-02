<?xml version="1.0" encoding="UTF-8"?>
<!-- 		
			Filename:			Protocol.xslt
			Copyright, Varian Medical systems, Inc., 2004-2005
			All Rights Reserved
			Varian Proprietary
-->
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">	
	<xsl:output omit-xml-declaration="yes" indent="yes" media-type="text/html"/>
   <!-- Handles structures output -->
	<xsl:include href="Structures.xslt"/>
    <!-- Handles fields output -->
	<xsl:include href="Fields.xslt"/>
	<!-- Handles optimization objectives output -->
	<xsl:include href="Objectives.xslt"/>
	
	<!-- Helper template for recursively looping through line objective group and wrapping it to single line -->
	<xsl:template name="LineObjectives">
		<xsl:param name="StructureObjectives"/>
		<xsl:param name="i"/>
		<xsl:param name="PlanID"/>
		<xsl:param name="StructureID"/>
	   <xsl:if test="$i &lt;= 32"> <!-- support for 32 line objective groups should be enough ... -->
			  <xsl:if test="count($StructureObjectives/Objective[Group=$i]) &gt; 0">
					<tr align="center" valign="middle">
						<td width="100"><xsl:value-of select="$PlanID"/></td>
						<td width="100"><xsl:value-of select="$StructureID"/></td>
						<td width="100"><xsl:value-of select="$StructureObjectives/Objective/Type[../Group=$i]"/></td>								
						<td width="100"><xsl:value-of select="$StructureObjectives/Objective/Operator[../Group=$i]"/></td>
						<td width="140">[<xsl:for-each select="$StructureObjectives/Objective[Group=$i]">																																														
								<xsl:if test="position() = 1"><xsl:value-of select="Volume"/></xsl:if>
								<xsl:if test="position() = last()">, <xsl:value-of select="Volume"/></xsl:if>
					   </xsl:for-each>]</td>	
						<td width="120">[<xsl:for-each select="$StructureObjectives/Objective[Group=$i]">										
								<xsl:if test="position() = 1"><xsl:value-of select="Dose"/></xsl:if>
								<xsl:if test="position() = last()">, <xsl:value-of select="Dose"/></xsl:if>																														
						</xsl:for-each>]</td>																	
						<td width="100"><xsl:value-of select="$StructureObjectives/Objective/Priority"/></td>																
					</tr>																																					
			</xsl:if>
		 <xsl:call-template name="LineObjectives">
			 <xsl:with-param name="StructureObjectives" select='$StructureObjectives'/>
			 <xsl:with-param name="i" select="$i + 1"/>
			 <xsl:with-param name="PlanID" select="$PlanID"/>
			<xsl:with-param name="StructureID" select="$StructureID"/>
		</xsl:call-template>	
	   </xsl:if>
	</xsl:template>

	<!-- Start from root -->

	<xsl:template match="/">
		<html>
			<head>
				<meta HTTP-EQUIV="expires" content="0"/>
				<title>Clinical Protocol (v. <xsl:value-of select="Protocol/@Version"/>)</title>
				<link REL="stylesheet" TYPE="text/css" href="..\StyleSheets\ProtocolStyles.css"/>
			</head>
			<body>

			<!-- Protocol header -->
			
				<table border="0" cellpadding="1" cellspacing="1" width="100%">
					<tbody>
						<tr>
							<td aling="left" valing="middle" width="640">
								<h1>Clinical Protocol</h1>
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
				<xsl:for-each select="Protocol">
					<xsl:for-each select="Preview">
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
					
					<!-- Protocol summary -->
					
					<hr color="black" size="1"/>
					<h2>Protocol Summary</h2>									
					<xsl:for-each select="Phases">					
					    <xsl:if test="count(Phase/PlanTemplate) &gt; 0">
					        <h3>Plan Summary</h3>
					       <div class="details"> 						       		
							<table border="0" cellpadding="1" cellspacing="1">
								<thead class="tableheader">
									<tr align="center" valign="middle">
									   <td width="100">Plan Id</td>
									   <td width="100">Field Count</td>																																										
									   <td width="120">Default Treament Unit</td>		
									   <td width="100">Default Energy</td>
									   <td width="100">Mode</td>																																													
									   <td width="140">Primary Fraction Dose  [<xsl:value-of select="Phase/Prescription/@Unit"/>]</td>		
									   <td width="80">Fraction Count</td>									   									   																					  
									</tr>
								</thead>
								<tbody class="tablebody">
									<xsl:for-each select="Phase">
										<tr align="center" valign="middle">
										 <td width="100"><xsl:value-of select="@ID"/></td>	
										 <td width="100"><xsl:value-of select="count(PlanTemplate/Fields/Field)"/></td>	
										 <td width="120"><xsl:value-of select="TreatmentUnit"/></td>	
										 <td width="100"><xsl:value-of select="DefaultEnergyKV"/></td>	
										 <td width="100"><xsl:value-of select="Mode"/></td>
										 <td width="140">
										 <xsl:for-each select="Prescription/Item">	
										   <xsl:if test="@Primary = &quot;true&quot;">
											   <xsl:value-of select="Dose"/>
										   </xsl:if>
										 </xsl:for-each>	
										 </td>
										 <td width="80"><xsl:value-of select="FractionCount"/></td>										  
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
							</div>	
						</xsl:if>
					    <xsl:if test="count(Phase/Prescription/Item) &gt; 0">
					        <h3>Plan Primary Objectives Summary</h3>
					         <div class="details"> 				
							<table border="0" cellpadding="1" cellspacing="1">
								<thead class="tableheader">
									<tr align="center" valign="middle">
										<td width="100">Plan Id</td>
										<td width="80">Primary Prescription</td>		
										<td width="320" colspan="3">Prescription</td>		
										<td width="80">Fraction Dose [<xsl:value-of select="Phase/Prescription/@Unit"/>]</td>		
										<td width="80">Fraction Count</td>		
										<td width="80">Total Dose [<xsl:value-of select="Phase/Prescription/@Unit"/>]</td>																						
									</tr>
								</thead>
								<tbody class="tablebody">
									<xsl:for-each select="Phase">
									 <xsl:variable name="PlanID" select="@ID"/>
									 <xsl:variable name="FractionCount" select="FractionCount"/>										
										<xsl:for-each select="Prescription/Item">
										 <xsl:if test="@Primary = &quot;true&quot;">
											 <tr align="center" valign="middle">
											 <td width="100"><xsl:value-of select="$PlanID"/></td>
											 <td width="80"><img src="..\stylesheets\tick.gif" border="0"/></td>
											 <td width="80"><xsl:value-of select="Type"/></td>																							
											 <td width="80"><xsl:value-of select="Modifier"/></td>
											<td width="160" align="left"><xsl:value-of select="Parameter"/></td>
											 <td width="80"><xsl:value-of select="Dose"/></td>				
											 <td width="80"><xsl:value-of select="$FractionCount"/></td>																	
											 <td width="80"><xsl:value-of select="TotalDose"/></td>
											</tr>
										</xsl:if>
										</xsl:for-each>
									</xsl:for-each>	
								</tbody>
							</table>
							</div>	
						</xsl:if>
						</xsl:for-each>	
						<xsl:if test="count(StructureTemplate/Structures/Structure) &gt; 0">
						  <h3>Protocol Structure Summary</h3>
						   <div class="details"> 							       
							<table border="0" cellpadding="1" cellspacing="1">
								<thead class="tableheader">
									<tr align="center" valign="middle">
										<td width="200">Id</td>
										<td width="200">Type</td>		
										<td width="340">Color and Style</td>																												
									</tr>
								</thead>
								<tbody class="tablebody">			
								    <xsl:for-each select="StructureTemplate/Structures/Structure">						
									<tr align="center" valign="middle">
									    <td width="200"><xsl:value-of select="@ID"/></td>
										<td width="200"><xsl:value-of select="Identification/VolumeType"/></td>
										<td width="340"><xsl:value-of select="ColorAndStyle"/></td>
									</tr>
									</xsl:for-each>
								</tbody>
							</table>
							</div>	
						</xsl:if>
						<xsl:for-each select="Phases">
							<xsl:if test="count(Phase/ObjectiveTemplate/ObjectivesAllStructures/ObjectivesOneStructure/StructureObjectives/Objective) &gt; 0">
							   <h3>Plan Dose Optimization Objectives Summary</h3>	
							    <div class="details"> 					      
								<table border="0" cellpadding="1" cellspacing="1">
									<thead class="tableheader">
										<tr align="center" valign="middle">
										    <td width="100">Plan Id</td>
											<td width="100">Structure Id</td>
											<td width="100">Type</td>
											<td width="100">Limit</td>
											<td width="140">Volume [%]</td>
											<td width="120">Total Dose [<xsl:for-each select="Phase/ObjectiveTemplate/ObjectivesAllStructures/@Unit"><xsl:value-of select="."/></xsl:for-each>]</td>
											<td width="100">Priority</td>																											
										</tr>
									</thead>
									<tbody class="tablebody">	
									<xsl:for-each select="Phase">
										 <xsl:variable name="PlanID" select="@ID"/>										
										  <xsl:for-each select="ObjectiveTemplate/ObjectivesAllStructures/ObjectivesOneStructure">
												<xsl:if test="count(StructureObjectives/Objective) &gt; 0">
													<xsl:variable name="StructureID" select="@ID"/>												
													<!-- Each point objectives to single table row -->
													<xsl:for-each select="StructureObjectives/Objective[Group ='0']">																				
														<tr align="center" valign="middle">
															<td width="100"><xsl:value-of select="$PlanID"/></td>
															<td width="100"><xsl:value-of select="$StructureID"/></td>
															<td width="100"><xsl:value-of select="Type"/></td>																											
															<td width="100"><xsl:value-of select="Operator"/></td>
															<td width="140"><xsl:value-of select="Volume"/></td>
															<td width="120"><xsl:value-of select="Dose"/></td>																														
															<td width="100"><xsl:value-of select="Priority"/></td>																
														</tr>					
													</xsl:for-each>
													
													<!-- Group line objectives to single line.  -->																			
													<xsl:call-template name="LineObjectives">
															<xsl:with-param name="StructureObjectives" select="StructureObjectives"/>
															<xsl:with-param name="i" select="number(1)"/>
															<xsl:with-param name="PlanID" select="$PlanID"/>
															<xsl:with-param name="StructureID" select="$StructureID"/>
												  </xsl:call-template>

												</xsl:if>		
										   </xsl:for-each>
										</xsl:for-each>				
									</tbody>
								</table>
								</div>								
							</xsl:if>
						</xsl:for-each>	
				       <br/>				       										
					<hr class ="pagebreak" color="black" size="1"/>
					
					<!-- Protocol details  -->
					
					<h2>Protocol Details</h2>
					
					<!-- Protocol  structures -->
					
					<xsl:if test="count(StructureTemplate/Structures/Structure) &gt; 0">					
					   <h2>Protocol Structure Details</h2>											
						<div class="details">										
							<xsl:apply-templates select="StructureTemplate"/>
						</div>						
					</xsl:if>	
					
					<!-- Protocol plans -->
					
					<xsl:for-each select="Phases">
						<h2>Protocol Plan Details</h2>
						<xsl:for-each select="Phase">
							<h3>Plan: <xsl:value-of select="@ID"/></h3>						
							<div class="details">
								<table border="0" cellpadding="1" cellspacing="1">
									<tbody class="infotable">
										<tr>
											<td width="140">Plan Mode:</td>
											<td width="140"><xsl:value-of select="Mode"/></td>
											<td width="140">Default Treatment Unit:</td>
										    <td width="140" colspan="2"><xsl:value-of select="TreatmentUnit"/></td>												
										</tr>
										<tr>
											<td width="140">Default Energy:</td>
											<td width="140"><xsl:value-of select="DefaultEnergyKV"/></td>											
											<td width="140">Treatment Style:</td>
												<td width="140"><xsl:value-of select="TreatmentStyle"/></td>
										</tr>
										<tr>
											<td width="140">Fraction Count:</td>
											<td width="140"><xsl:value-of select="FractionCount"/></td>
											<td width="140">Fractions Per Day:</td>
											<td width="140"><xsl:value-of select="FractionsPerDay"/></td>							
										</tr>
										<tr>
											<td width="140">Fractions Per Week:</td>
											<td width="140"><xsl:value-of select="FractionsPerWeek"/></td>										
										</tr>
										<tr>
											<td width="140">Immobilization Device:</td>
											<td width="140"><xsl:value-of select="ImmobilizationDevice"/></td>
											<td width="140">Localization Technique:</td>
											<td width="140"><xsl:value-of select="LocalizationTechnique"/></td>							
										</tr>
										<tr>
											<td width="140">Field Alignment Rules:</td>
											<td width="140" colspan="4"><xsl:value-of select="PlanTemplate/FieldAlignmentRules"/></td>											
										</tr>
										<xsl:for-each select="PlanTemplate/PatientSupportDevice">
											<tr>
												<td width="140">Patient Support Device:</td>
												<td colspan="4" width="420"><xsl:value-of select="@ID"/> (<xsl:value-of select="Type"/>)</td>
											</tr>
									   </xsl:for-each>
									</tbody>
								</table>
								
								<xsl:for-each select="Prescription">
									<xsl:if test="count(Item) &gt; 0">
										<h3>Plan Objective Details</h3>
										<table border="0" cellpadding="1" cellspacing="1">
											<thead class="tableheader">
												<tr align="center" valign="middle">
													<td width="80">Primary</td>
													<td width="320" colspan="3">Prescription</td>																				
													<td width="100">Fraction Dose [<xsl:value-of select="@Unit"/>]</td>
													<td width="90">Total Dose [<xsl:value-of select="@Unit"/>]</td>
												</tr>
											</thead>
											<tbody class="tablebody">
												<xsl:for-each select="Item">
													<tr align="center" valign="middle">
													  <td width="80"> 
														  <xsl:if test="@Primary = &quot;true&quot;">
															<img src="..\stylesheets\tick.gif" border="0"/>
														 </xsl:if>	
													 </td>
													  <td width="80"><xsl:value-of select="Type"/></td>																							
													  <td width="80"><xsl:value-of select="Modifier"/></td>
													  <td width="160" align="left"><xsl:value-of select="Parameter"/></td>
													 <td width="100"><xsl:value-of select="Dose"/></td>																
													 <td width="90"><xsl:value-of select="TotalDose"/></td>														
													</tr>
												</xsl:for-each>
											</tbody>
										</table>
									</xsl:if>
									<xsl:if test="count(MeasureItem) &gt; 0">
										<h3>Plan Measure Details</h3>
										<table border="0" cellpadding="1" cellspacing="1">
											<thead class="tableheader">
												<tr align="center" valign="middle">
													<td width="120">Structure</td>
													<td width="200">Measure</td>
													<td width="190">Criterion</td>
													<td width="90">Target Value</td>
												</tr>
											</thead>
											<tbody class="tablebody">
												<xsl:for-each select="MeasureItem">
													<tr align="center" valign="middle">
													  <td width="120"><xsl:value-of select="@ID"/></td>																							
													  <td width="200"><xsl:value-of select="Type"/></td>																							
													  <td width="190"><xsl:value-of select="Modifier"/></td>
													  <td width="90"><xsl:value-of select="Value"/></td>														
													</tr>
												</xsl:for-each>
											</tbody>
										</table>
									</xsl:if>
								</xsl:for-each>
								
								<xsl:for-each select="PlanTemplate">	
								    <xsl:if test="count(  Boluses/Bolus  ) &gt; 0">							
										<xsl:for-each select="Boluses">
											<h3>Plan Boluses</h3>
												<table border="0" cellpadding="1" cellspacing="1">
												<thead class="tableheader">
													<tr align="center" valign="middle">																		
														<td width="70">Id</td>
														<td width="90">Thickness [<xsl:value-of select="Bolus/Thickness/@Unit"/>]</td>
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
                        <h3>
                          Solid Applicator: <xsl:value-of select="@ID"/>
                        </h3>
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
													
								</xsl:for-each> <!-- Plan template -->
								
								<!-- Optimization objectives -->				
																	
								<xsl:if test="count( ObjectiveTemplate/ObjectivesAllStructures/ObjectivesOneStructure/StructureObjectives/Objective  )&gt; 0">
									<h3>Plan Optimization Objective Details</h3>									
									<xsl:apply-templates select="ObjectiveTemplate"/>
								</xsl:if>
														
							</div>		
						</xsl:for-each> <!-- Phase -->
					</xsl:for-each> <!-- Phases -->
					
					<!-- Protocol review -->
					
					<xsl:for-each select="Review">
						<h2>Protocol Review Details</h2>
						<div class="details">
							<table border="0" cellpadding="1" cellspacing="1">
								<tbody class="infotable">
									<tr>
										<td width="140">Show Min:</td>
										<td width="140">		
										<xsl:if test="@ShowMin = &quot;true&quot;">
											<img src="..\stylesheets\tick.gif" border="0"/>
										 </xsl:if>
									   </td>													
										<td width="140">Show Max:</td>
										<td width="140">		
										<xsl:if test="@ShowMax = &quot;true&quot;">
											<img src="..\stylesheets\tick.gif" border="0"/>
										 </xsl:if>
									   </td>						
									</tr>
									<tr>
										<td width="140">Show Mean:</td>
										<td width="140">		
										<xsl:if test="@ShowMean = &quot;true&quot;">
											<img src="..\stylesheets\tick.gif" border="0"/>
										 </xsl:if>
									   </td>						
										<td width="140">Show Modal:</td>
										<td width="140">		
										<xsl:if test="@ShowModal = &quot;true&quot;">
											<img src="..\stylesheets\tick.gif" border="0"/>
										 </xsl:if>
									   </td>						
									</tr>
									<tr>
										<td width="140">Show Median:</td>
										<td width="140">		
										<xsl:if test="@ShowMedian = &quot;true&quot;">
											<img src="..\stylesheets\tick.gif" border="0"/>
										 </xsl:if>
									   </td>						
										<td width="140">Show Std Dev:</td>
										<td width="140">		
										<xsl:if test="@ShowStdDev = &quot;true&quot;">
											<img src="..\stylesheets\tick.gif" border="0"/>
										 </xsl:if>
									   </td>						
									</tr>
									<!-- <xsl:if test="count(/Phases/Phase/PlanTemplate/Fields/BrachyField) &gt; 0"> -->
										<tr>
											<td width="140">Show NDR:</td>
											<td width="140" colspan="2"	>		
											<xsl:if test="@ShowNDR = &quot;true&quot;">
												<img src="..\stylesheets\tick.gif" border="0"/>
											 </xsl:if>
										   </td>							
										</tr>	
									<!-- </xsl:if>	 -->								
								</tbody>
							</table>
							
							<xsl:if test="count( ReviewStructures/ReviewStructure ) &gt; 0">
								<xsl:for-each select="ReviewStructures">
									<h3>DVH Structures</h3>
									<table border="0" cellpadding="1" cellspacing="1">
										<thead class="tableheader">
											<tr align="center" valign="middle">
												<td width="140">Item</td>
												<td width="140">Type</td>
											</tr>
										</thead>
										<tbody class="tablebody">
											<xsl:for-each select="ReviewStructure">
											<xsl:if test="Type = 'Structure' or @Selected = &quot;true&quot;">
												<tr align="center" valign="middle">
													<td width="140"><xsl:value-of select="Item"/></td>
													<td width="140"><xsl:value-of select="Type"/></td>
												</tr>
											</xsl:if>	
											</xsl:for-each>										
										</tbody>
									</table>
								</xsl:for-each>
							</xsl:if>
							
						</div>
					</xsl:for-each>
					<br/>
					<hr color="black" size="1"/>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
