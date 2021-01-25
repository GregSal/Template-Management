<?xml version="1.0" encoding="UTF-8"?>
	<!-- 		
			Filename:			Objectives.xslt
			Copyright, Varian Medical systems, Inc., 2004-2005
			All Rights Reserved
			Varian Proprietary
-->
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output omit-xml-declaration="yes" indent="yes" media-type="text/html"/>
	<xsl:template match="ObjectiveTemplate">
    <xsl:for-each select="Helios">
      <h3>IMRT</h3>
      <table border="0" cellpadding="1" cellspacing="1">
				<tbody class="infotable">
					<tr>
						<td width="140">Default Smoothing X:</td>
						<td width="140"><xsl:value-of select="DefaultSmoothingX"/></td>												
						<td width="140">Default Smoothing Y:</td>
						<td width="140"><xsl:value-of select="DefaultSmoothingY"/></td>	
					</tr>
					<tr>
						<td width="140">Default Minimize Dose:</td>
						<td width="140"><xsl:value-of select="DefaultMinimizeDose"/></td>	
						<td width="140">Default Optimization Type:</td>
						<td width="140"><xsl:value-of select="DefaultOptimizationType"/></td>											
					</tr>
						<tr>
						<td width="140">Max Iterations:</td>
						<td width="140"><xsl:value-of select="MaxIterations"/></td>										
						<td width="140">Max Optimize Time [min]:</td>
						<td width="140"><xsl:value-of select="MaxTime"/></td>										
					</tr>
					<tr>
						<td width="140">Default Fixed Jaws:</td>
						<td width="140">
						  <xsl:if test="@DefaultFixedJaws = &quot;true&quot;">
							  <img src="..\stylesheets\tick.gif" border="0"/>
						  </xsl:if>
					  </td>
            <td width="140">Interpolate:</td>
						<td width="140">
						  <xsl:if test="@Interpolate = &quot;true&quot;">
							  <img src="..\stylesheets\tick.gif" border="0"/>
						  </xsl:if>
					  </td>
					</tr>
					<tr>
						<td width="140">Use Colors:</td>
						<td width="140">
						  <xsl:if test="@UseColors = &quot;true&quot;">
							  <img src="..\stylesheets\tick.gif" border="0"/>
						  </xsl:if>
					  </td>
            <td width="140">Target Autocrop:</td>
            <td width="140">
              <xsl:if test="@TargetAutocrop = &quot;true&quot;">
                <img src="..\stylesheets\tick.gif" border="0"/>
              </xsl:if>
            </td>
          </tr>
          <tr>
            <td width="140">Automatic Lower Dose Objective:</td>
            <td width="140">
              <xsl:if test="@Aldo = &quot;true&quot;">
                <img src="..\stylesheets\tick.gif" border="0"/>
              </xsl:if>
            </td>
          </tr>
        </tbody>
		</table>
		<xsl:for-each select="Geos">
      <h3>Beam Angle Optimization</h3>
      <table border="0" cellpadding="1" cellspacing="1">
				<tbody class="infotable">
					<tr>
						<td width="140">Initial Field Distribution:</td>
						<td width="140"><xsl:value-of select="InitialFieldDistribution"/></td>												
					</tr>
					<tr>
						<td width="140">Minimum Number of Fields:</td>
						<td width="140"><xsl:value-of select="MinimumNumberOfFields"/></td>												
					</tr>
					<tr>
						<td width="140">Maximum Number of Fields:</td>
						<td width="140"><xsl:value-of select="MaximumNumberOfFields"/></td>												
					</tr>
					<tr>
						<td width="140">Maximum Elevation Angle for Non-Coplanar Fields:</td>
						<td width="140"><xsl:value-of select="MaximumElevationAngleForNonCoplanarFields"/></td>												
					</tr>
					<tr>
						<td width="140">Maximum Collimator Variation:</td>
						<td width="140"><xsl:value-of select="MaximumCollimatorVariation"/></td>												
					</tr>
					<tr>
						<td width="140">Local Geometric Optimization Mode:</td>
						<td width="140"><xsl:value-of select="LocalGeometricOptimizationMode"/></td>												
					</tr>
				</tbody>
			</table>
		</xsl:for-each>
    <xsl:for-each select="NormalTissueObjective">
        <h3>Normal Tissue Objective</h3>
        <table border="0" cellpadding="1" cellspacing="1">
				<tbody class="infotable">
          <xsl:choose>
            <xsl:when test="count(Mode)=0 or Mode=''">
              <tr>
                <td width="140">Use:</td>
                <td width="140">
                  <xsl:if test="Use = &quot;true&quot;">
                    <img src="..\stylesheets\tick.gif" border="0"/>
                  </xsl:if>
                </td>
              </tr>
              <tr>
                <td width="140">Automatic:</td>
                <td width="140">
                  <xsl:if test="Auto = &quot;true&quot;">
                    <img src="..\stylesheets\tick.gif" border="0"/>
                  </xsl:if>
                </td>
              </tr>
            </xsl:when>
            <xsl:otherwise>
              <tr>
                <td width="140">Mode:</td>
                <td width="140">
                  <xsl:choose>
                    <xsl:when test="Mode='Off'">Off</xsl:when>
                    <xsl:when test="Mode='Manual'">Manual</xsl:when>
                    <xsl:when test="Mode='Auto'">Automatic NTO</xsl:when>
                    <xsl:when test="Mode='Srs'">Auto (SRS NTO)</xsl:when>
                  </xsl:choose>
                </td>
              </tr>
            </xsl:otherwise>
          </xsl:choose>
					<tr>
						<td width="140">Priority:</td>
						<td width="140"><xsl:value-of select="Priority"/></td>												
					</tr>
					<tr>
						<td width="140">Distance From Target Border:</td>
						<td width="140"><xsl:value-of select="DistanceFromTargetBorder"/></td>												
					</tr>
					<tr>
						<td width="140">Start Dose:</td>
						<td width="140"><xsl:value-of select="StartDose"/></td>												
					</tr>
					<tr>
						<td width="140">End Dose:</td>
						<td width="140"><xsl:value-of select="EndDose"/></td>												
					</tr>
					<tr>
						<td width="140">Fall-off:</td>
						<td width="140"><xsl:value-of select="FallOff"/></td>												
					</tr>
				</tbody>
			</table>
		</xsl:for-each>
    <xsl:for-each select="Imat">
        <h3>Arc Optimization</h3>
        <table border="0" cellpadding="1" cellspacing="1">
				<tbody class="infotable">
					<tr>
						<td width="140">Use MU Objective:</td>
						<td width="140">		
							<xsl:if test="@UseMU = &quot;true&quot;">
							<img src="..\stylesheets\tick.gif" border="0"/>
							</xsl:if>
						</td>												
					</tr>
					<tr>
						<td width="140">MU Objective Strength:</td>
						<td width="140"><xsl:value-of select="MUWeight"/></td>												
					</tr>
					<tr>
						<td width="140">Minimum MU:</td>
						<td width="140"><xsl:value-of select="MinMU"/></td>												
					</tr>
					<tr>
						<td width="140">Maximum MU:</td>
						<td width="140"><xsl:value-of select="MaxMU"/></td>												
					</tr>
					<tr>
						<td width="140">Jaw Tracking:</td>
						<td width="140">		
							<xsl:if test="@JawTracking = &quot;true&quot;">
							<img src="..\stylesheets\tick.gif" border="0"/>
							</xsl:if>
						</td>												
					</tr>
				</tbody>
			</table>
		</xsl:for-each>
		</xsl:for-each>
    <xsl:for-each select="Brachy">
      <h3>Brachy</h3>
      <h3>Dwell Time Objectives</h3>
      <table border="0" cellpadding="1" cellspacing="1">
        <tbody class="infotable">
          <tr>
            <td width="140" />
            <td width="140" />
          </tr>
          <tr>
            <td width="140">Max [s]:</td>
            <td width="140"><xsl:value-of select="MaxDwellTime"/></td>											
          </tr>
          <tr>
            <td width="140">Min [s]:</td>
            <td width="140">
              <xsl:value-of select="MinAllowedDwellTime"/>
            </td>
          </tr>
          <tr>
            <td width="140">Smooth:</td>
            <td width="140">
              <xsl:value-of select="SmoothPower"/>
            </td>
          </tr>
          <tr>
            <td width="140">Priority:</td>
            <td width="140">
              <xsl:value-of select="TimeConstraintWeight * 100"/>
            </td>
          </tr>
        </tbody>
      </table>
      <xsl:if test="@HotspotEnabled = 'true'">
        <h3>Basal Dose Objectives</h3>
        <table border="0" cellpadding="1" cellspacing="1">
          <tbody class="infotable">
            <tr>
              <td width="140" />
              <td width="140" />
            </tr>
            <tr>
              <td width="140">Enabled:</td>
              <td width="140">
                Yes
              </td>
            </tr>
            <tr>
              <td width="140">Max Basal Dose [Gy]:</td>
              <td width="140">
                <xsl:value-of select="BasalDesiredGy"/>
              </td>
            </tr>
            <tr>
              <td width="140">Priority:</td>
              <td width="140">
                <xsl:value-of select="HotspotConstraintWeight * 100"/>
              </td>
            </tr>
          </tbody>
        </table>
      </xsl:if>
      <xsl:if test="@TouchedByAcurosBV = 'true'">
        <div class="details">
          <h3>Acuros BV Calculation Options</h3>
          <table border="0" cellpadding="1" cellspacing="1">
				    <tbody class="infotable">
                <tr>
                  <td width="140">Calculation Medium:</td>
                  <td width="140">
                    <xsl:choose>
                      <xsl:when test="CalculationMedium[1] = 'CT'">CT values</xsl:when>
                      <xsl:when test="CalculationMedium[1] = 'Water'">Water</xsl:when>
                      <xsl:otherwise>Air</xsl:otherwise>
                    </xsl:choose>
                  </td>
                </tr>
                <tr>
                  <td width="140">Max Mass Density [g/cm^3]:</td>
                  <td width="140">
                    <xsl:value-of select="MassDensityCutOff"/>
                  </td>
                </tr>
                <tr>
                  <td width="140">Reporting Medium:</td>
                  <td width="140">
                    <xsl:choose>
                      <xsl:when test="ReportDoseToMedium[1] = 'true'">Medium</xsl:when>
                      <xsl:otherwise>Water</xsl:otherwise>
                    </xsl:choose>
                  </td>
                </tr>
                <tr>
                  <td width="140">Clear Dose In Applicator(s):</td>
                  <td width="140">
                  <xsl:choose>
                    <xsl:when test="ClearDoseInApplicator[1] = 'true'">Yes</xsl:when>
                    <xsl:otherwise>No</xsl:otherwise>
                  </xsl:choose>
                  </td>
                </tr>
            </tbody>
			    </table>
        </div>
      </xsl:if>
		</xsl:for-each>
				
		<!-- Structure objectives -->
		
		<xsl:for-each select="ObjectivesAllStructures">
      <xsl:if test="count(ObjectivesOneStructure/StructureObjectives/Objective) &gt; 0 or count(ObjectivesOneStructure[AvoidanceStructureMode!='' and AvoidanceStructureMode!='OPT_AVOIDANCE_NONE']) &gt; 0">
				<h3>Structure Objectives</h3>
				<div class="details">
					<xsl:for-each select="ObjectivesOneStructure">
						<xsl:if test="count(StructureObjectives/Objective ) &gt; 0 or (AvoidanceStructureMode!='OPT_AVOIDANCE_NONE' and AvoidanceStructureMode!='')">
							<h3>Structure Objective: <xsl:value-of select="@ID"/>
							</h3>
							<table border="0" cellpadding="1" cellspacing="1">
								<tbody class="infotable">														
									<tr>
										<td width="140">Volume Type:</td>
										<td width="140">
											<xsl:value-of select="StructureTarget/VolumeType"/> 
										</td>
									</tr>
									<xsl:if test="StructureTarget/VolumeCode!=''">
										<tr>
												<td width="140">Volume code (table):</td>
											<td width="140">
												<xsl:value-of select="StructureTarget/VolumeCode"/>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;(</xsl:text>
												<xsl:value-of select="StructureTarget/VolumeCodeTable"/>
												<xsl:text>)</xsl:text>
											</td>
										</tr>
									</xsl:if>
									<xsl:if test="StructureTarget/StructureCode">
									<tr>
										<td width="140">Structure code:</td>
										<td width="140">
											<xsl:value-of select="StructureTarget/StructureCode/@Code"/>
										</td>
										<td width="140">Scheme (version):</td>
										<td width="140">
											<xsl:value-of select="StructureTarget/StructureCode/@CodeScheme"/>
											<xsl:text disable-output-escaping="yes">&amp;nbsp;(</xsl:text>
											<xsl:value-of select="StructureTarget/StructureCode/@CodeSchemeVersion"/>
											<xsl:text>)</xsl:text>
										</td>
									</tr>
									</xsl:if>
									<tr>
										<td width="140">Resolution  [mm]:</td>
										<td width="140"><xsl:value-of select="Distance"/></td>										
									</tr>
									<tr>
										<td width="140">Surface Only:
											<xsl:if test="@SurfaceOnly = &quot;true&quot;">
												<img src="..\stylesheets\tick.gif" border="0"/>
											</xsl:if>
										</td>
                  </tr>
                  <tr>
                    <td width="140">Avoidance Type:</td>
                    <td width="140">
                      <xsl:choose>
                        <xsl:when test="AvoidanceStructureMode='OPT_AVOIDANCE_ENTRY_ONLY'">Entry</xsl:when>
                        <xsl:when test="AvoidanceStructureMode='OPT_AVOIDANCE_ENTRY_AND_EXIT'">Entry and Exit</xsl:when>
                      </xsl:choose>
                    </td>
                  </tr>
                </tbody>
              </table>
							
							<!--  Objectives -->
							
							<xsl:for-each select="StructureObjectives">
								<xsl:if test="count( Objective  ) &gt; 0">
									<h3>Objectives</h3>
									<table border="0" cellpadding="1" cellspacing="1">
										<thead class="tableheader">
											<tr align="center" valign="middle">
												<td width="80">Type</td>
												<td width="80">Limit</td>
												<td width="80">Volume [%]</td>
												<td width="100">Total Dose [<xsl:value-of select="//ObjectivesAllStructures/@Unit"/>]</td>
												<td width="80">Priority</td>
												<td width="80">gEUD a</td>
												<td width="80">Group</td>
											</tr>
										</thead>
										<tbody class="tablebody">
											<xsl:for-each select="Objective">
												<tr align="center" valign="middle">
												   <td width="80"><xsl:value-of select="Type"/></td>
													<td width="80"><xsl:value-of select="Operator"/></td>
													<td width="80"><xsl:value-of select="Volume"/></td>
													<td width="100"><xsl:value-of select="Dose"/></td>
													<td width="80"><xsl:value-of select="Priority"/></td>
													<td width="80"><xsl:value-of select="ParameterA"/></td>
													<td width="70"><xsl:value-of select="Group"/></td>																		
												</tr>
											</xsl:for-each>
										</tbody>
									</table>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
					</xsl:for-each>
				</div>
			</xsl:if>
		</xsl:for-each>					
	</xsl:template>	
</xsl:stylesheet>
