<?xml version="1.0" encoding="UTF-8"?>
<!-- 		
			Filename:			Fields.xslt
			Copyright, Varian Medical systems, Inc., 2004-2005
			All Rights Reserved
			Varian Proprietary
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <xsl:output omit-xml-declaration="yes" indent="yes" media-type="text/html"/>
  <xsl:template match="Fields">

    <!-- Field Summary (for normal fields) -->
    <xsl:if test="count(Field) &gt;  0">
      <h3>Plan Fields Summary</h3>
      <table border="0" cellpadding="1" cellspacing="1">
        <thead class="tableheader">
          <tr align="center" valign="middle">
            <td width="80">Id</td>
            <td width="80">Technique</td>
            <td width="80">Energy</td>
            <td width="80">Primary Fluence Mode</td>
            <td width="80">Gantry [deg]</td>
            <td width="80">Collimator [deg]</td>
            <td width="80">Couch [deg]</td>
            <td width="80">MLC/Block</td>
            <td width="80">Wedge</td>
            <td width="80">Field Size [<xsl:value-of select="Field/Collimator/@Unit"/>] </td>
            <td width="80">Isocenter</td>
          </tr>
        </thead>
        <tbody class="tablebody">
          <xsl:for-each select="Field">
            <tr align="center" valign="middle">
              <td width="80"><xsl:value-of select="@ID"/></td>
              <td width="80"><xsl:value-of select="Technique"/></td>
              <td width="80"><xsl:value-of select="Energy/EnergyKV"/><xsl:value-of select="Energy/Type"/>
                <xsl:if test="count(Energy/MaxEnergyKV/@xsi:nil) = 0">-<xsl:value-of select="Energy/MaxEnergyKV"/><xsl:value-of select="Energy/Type"/>
                </xsl:if>
              </td>
              <td width="80"><xsl:value-of select="PrimaryFluenceMode"/></td>
              <td width="80"><xsl:value-of select="Gantry/Rtn"/></td>
              <td width="80"><xsl:value-of select="Collimator/Rtn"/></td>
              <td width="80"><xsl:value-of select="TableRtn"/></td>
              <td width="80">
                <xsl:if test="count(MLCPlans/MLCPlan) = 0 and count(Blocks/Block)= 0">-</xsl:if>
                <xsl:if test="count(MLCPlans/MLCPlan) &gt; 0 and count(Blocks/Block) &gt; 0">MLC and Block</xsl:if>
                <xsl:if test="count(MLCPlans/MLCPlan) = 1 and  count(Blocks/Block) = 0"><xsl:value-of select="MLCPlans/MLCPlan/@ID"/></xsl:if>
                <xsl:if test="count(Blocks/Block) = 1 and count(MLCPlans/MLCPlan) = 0"><xsl:value-of select="Blocks/Block/@ID"/></xsl:if>
                <xsl:if test="count(Blocks/Block) &gt; 1 and count(MLCPlans/MLCPlan) = 0">Blocks</xsl:if>
              </td>
              <td width="80">
                <xsl:if test="count(Wedges/Wedge)  = 0 ">-</xsl:if>
                <xsl:if test="count(Wedges/Wedge)  &gt; 1 ">Multiple</xsl:if>
                <xsl:if test="count(Wedges/Wedge)  = 1 and count(Wedges/Wedge/MotoWeight/@xsi:nil) = 0">Motorized</xsl:if>
                <xsl:if test="count(Wedges/Wedge)  = 1 and count(Wedges/Wedge/MotoWeight/@xsi:nil) = 1">
                  <xsl:value-of select="Wedges/Wedge/AngleDeg"/> (deg)
                </xsl:if>
              </td>
              <td width="80">
                <xsl:for-each select="Collimator">
                  <xsl:variable name="XSize" select="X2 - X1"/>
                  <xsl:variable name="YSize" select="Y2 - Y1"/>
                  <xsl:value-of select="format-number($XSize, '#.00')" /> x 
                  <xsl:value-of select="format-number($YSize, '#.00')" />
                </xsl:for-each>
              </td>
              <td width="80">
                <xsl:choose>
                  <xsl:when test="Target/VolumeID = &quot;&quot;">Relative</xsl:when>
                  <xsl:otherwise><xsl:value-of select="Target/VolumeID"/></xsl:otherwise>	
                </xsl:choose>
              </td>
            </tr>
          </xsl:for-each>
        </tbody>
      </table>
      <br/>
    </xsl:if>

    <!-- Field Details -->
    <xsl:if test="count(Field) &gt;  0">
      <h3>Plan Field Details</h3>
    </xsl:if>
    <xsl:if test="count(BrachyField) &gt;  0">
      <h3>Plan Applicator Details</h3>
    </xsl:if>

    <xsl:for-each select="Field">
      <div class="details">
			  <h3>Field: <xsl:value-of select="@ID"/></h3>
        <table border="0" cellpadding="1" cellspacing="1">
          <tbody class="infotable">
            <tr>
              <td width="140">Treatment Unit:</td>
              <td width="140"><xsl:value-of select="TreatmentUnit"/></td>
              <td width="140">Using Dynamic MLC:</td>
              <td width="140">
                <xsl:if test="@UsingMLC = &quot;true&quot;">
                  <img src="..\stylesheets\tick.gif" border="0"/>
                </xsl:if>
              </td>
            </tr>
            <tr>
              <td width="140">Energy:</td>
              <td width="140"><xsl:value-of select="Energy/EnergyKV"/><xsl:value-of select="Energy/Type"/>
                <xsl:if test="count(Energy/MaxEnergyKV/@xsi:nil) = 0">-<xsl:value-of select="Energy/MaxEnergyKV"/><xsl:value-of select="Energy/Type"/>
                </xsl:if>
              </td>
              <td width="140">Using Compensator:</td>
              <td width="140">
                <xsl:if test="@UsingCompensator = &quot;true&quot;">
                  <img src="..\stylesheets\tick.gif" border="0"/>
                </xsl:if>
              </td>
            </tr>
            <tr>
              <td width="140">Primary Fluence Mode:</td>
              <td width="140">
                <xsl:value-of select="PrimaryFluenceMode"/>
              </td>
            </tr>
            <tr>
              <td width="140">Technique:</td>
              <td width="140"><xsl:value-of select="Technique"/></td>
              <td width="140">DRR Template:</td>
							<td width="240">
							<xsl:if test="DRRTemplate != &quot;&quot;"><xsl:value-of select="DRRTemplate"/>, 
								<xsl:choose>
                    <xsl:when test="@DRRVisible = &quot;true&quot;">created automatically </xsl:when>
                    <xsl:otherwise>not created automatically</xsl:otherwise>
                  </xsl:choose>
                </xsl:if>
              </td>
            </tr>
            <tr>
              <td width="140">Dose Rate [MU/min]:</td>
              <td width="140"><xsl:value-of select="DoseRate"/></td>
              <td width="140">SFED [<xsl:value-of select="SFED/@Unit"/>]:</td>
              <td width="140"><xsl:value-of select="SFED"/></td>
            </tr>
            <tr>
              <td width="140">Tolerance Table:</td>
              <td width="140"><xsl:value-of select="ToleranceTableID"/></td>
              <td width="140">Field Weight:</td>
              <td width="140"><xsl:value-of select="Weight"/></td>
              <td width="140"/>
            </tr>
            <tr>
              <td width="140">Skin Flash Margin [<xsl:value-of select="SkinFlashMargin/@Unit"/>]:</td>
              <td width="140"><xsl:value-of select="SkinFlashMargin"/></td>
              <td width="140">Boluses:</td>
              <td width="140"><xsl:value-of select="FieldBoluses"/></td>
            </tr>
            <tr>
              <td width="140">Gantry Angle [deg]:</td>
              <td width="140"><xsl:value-of select="Gantry/Rtn"/></td>
              <td width="140">Gantry Stop Angle [deg]:</td>
              <td width="140"><xsl:value-of select="Gantry/StopRtn"/></td>
            </tr>
            <tr>
              <td width="140">Gantry Direction:</td>
              <td width="140"><xsl:value-of select="Gantry/RtnDirection"/></td>
              <td width="140">Table Angle [deg]:</td>
              <td width="140"><xsl:value-of select="TableRtn"/></td>
            </tr>
            <tr>
								<td width="140">Target Volume:</td>
								<td colspan="4" width="420">
									<xsl:value-of select="Target/VolumeID"/> (<xsl:value-of select="Target/VolumeType"/>)					
								</td>	
						</tr>
            <tr>
              <td width="140">Collimator Size [<xsl:value-of select="Collimator/@Unit"/>]:</td>
              <td colspan="4" width="420">
                X1:<xsl:value-of select="Collimator/X1"/> 
                X2:<xsl:value-of select="Collimator/X2"/> 
                Y1:<xsl:value-of select="Collimator/Y1"/> 
                Y2:<xsl:value-of select="Collimator/Y2"/>
              </td>
            </tr>
            <tr>
              <td width="140">Collimator Angle [deg]:</td>
              <td width="140"><xsl:value-of select="Collimator/Rtn"/></td>
              <td width="140">Collimator Mode:</td>
              <td width="140"><xsl:value-of select="Collimator/Mode"/></td>
            </tr>
            <tr>
              <td width="140">Field Margin [<xsl:value-of select="FieldMargin/@Unit"/>]:</td>
              <td colspan="4" width="420">
                <xsl:for-each select="FieldMargin">
                  <xsl:if test="@BEVMarginFlag  = &quot;true&quot; and @EllipticalMarginFlag  = &quot;true&quot;">
                    L:<xsl:value-of select="Left"/> 
                    R:<xsl:value-of select="Right"/> 
                    T:<xsl:value-of select="Top"/> 
                    B:<xsl:value-of select="Bottom"/>
                  </xsl:if>
                  <xsl:if test="@BEVMarginFlag  = &quot;false&quot; and @EllipticalMarginFlag  = &quot;true&quot;">
                    X1:<xsl:value-of select="Left"/> 
                    X2:<xsl:value-of select="Right"/> 
                    Y1:<xsl:value-of select="Top"/> 
                    Y2:<xsl:value-of select="Bottom"/>
                  </xsl:if>
                  <xsl:if test="@EllipticalMarginFlag  = &quot;false&quot;">
                    <xsl:value-of select="Left"/>
                  </xsl:if>
                </xsl:for-each>
              </td>
            </tr>
            <tr>
							<td width="210">Relative Isocenter, <xsl:value-of select="Isocenter/@Placement"/> [<xsl:value-of select="Isocenter/@Unit"/>]:</td>
							<td colspan="4" width="210">[<xsl:value-of select="Isocenter/@X"/>, <xsl:value-of select="Isocenter/@Y"/>, <xsl:value-of select="Isocenter/@Z"/>]
							</td>
						</tr>												
						<xsl:for-each select="Proton">
              <tr>
                <td width="140">Snout Id:</td>
                <td width="140"><xsl:value-of select="SnoutID"/></td>
                <td width="140">SkinMargin [<xsl:value-of select="SkinMargin/@Unit"/>]:</td>
                <td width="140"><xsl:value-of select="SkinMargin"/></td>
              </tr>
              <tr>
                <td width="140">Distal Margin [<xsl:value-of select="DistalMargin/@Unit"/>]:</td>
                <td width="140"><xsl:value-of select="DistalMargin"/></td>
                <td width="140">Proximal Margin [<xsl:value-of select="ProximalMargin/@Unit"/>]:</td>
                <td width="140"><xsl:value-of select="ProximalMargin"/></td>
              </tr>
              <tr>
                <td width="140">Uncertainity Margin [<xsl:value-of select="UncertaintyMargin/@Unit"/>]:</td>
                <td colspan="4" width="420">
                  X1:<xsl:value-of select="UncertaintyMargin/X1"/> 
                  X2:<xsl:value-of select="UncertaintyMargin/X2"/> 
                  Y1:<xsl:value-of select="UncertaintyMargin/Y1"/> 
                  Y2:<xsl:value-of select="UncertaintyMargin/Y2"/> 
                </td>
              </tr>
              <tr>
                <td width="140">Isocenter Margin:</td>
                <td colspan="4" width="140"><xsl:value-of select="@IsocenterMarginFlag"/></td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
        <br/>

        <!-- Blocks -->
        <xsl:if test="count(  Blocks/Block  ) &gt; 0">
          <xsl:for-each select="Blocks">
            <h3>Field Blocks</h3>
            <table border="0" cellpadding="1" cellspacing="1">
              <thead class="tableheader">
                <tr align="center" valign="middle">
                  <td width="70">Id</td>
                  <td width="70">Diverging</td>
                  <td width="70">Above Tray</td>
                  <td width="80">Type</td>
                  <td width="100">Tray</td>
                  <td width="120">Material</td>
                  <td width="130">Block Margin [<xsl:value-of select="Block/BlockMargin/@Unit"/>]</td>
                  <td width="100">Optimize Collimator Jaws</td>
                  <td width="100">Optimize Collimator Rotation</td>
                  <td width="200">Target</td>
                </tr>
              </thead>
              <tbody class="tablebody">
                <xsl:for-each select="Block">
                  <tr align="center" valign="middle">
                    <td width="70"><xsl:value-of select="@ID"/></td>
                    <td width="70">
                      <xsl:if test="@DivergingFlag = &quot;true&quot;">
                        <img src="..\stylesheets\tick.gif" border="0"/>
                      </xsl:if>
                    </td>
                    <td width="70">
                      <xsl:if test="@AboveTrayFlag = &quot;true&quot;">
                        <img src="..\stylesheets\tick.gif" border="0"/>
                      </xsl:if>
                    </td>
                    <td width="80"><xsl:value-of select="Type"/></td>
                    <td width="100"><xsl:value-of select="Tray"/></td>
                    <td width="70"><xsl:value-of select="Material"/></td>
                    <td width="130">
                      <xsl:for-each select="BlockMargin">
                        <xsl:if test="@BEVMarginFlag  = &quot;true&quot; and @EllipticalMarginFlag  = &quot;true&quot;">
                          L:<xsl:value-of select="Left"/> 
                          R:<xsl:value-of select="Right"/> 
                          T:<xsl:value-of select="Top"/> 
                          B:<xsl:value-of select="Bottom"/>
                        </xsl:if>
                        <xsl:if test="@BEVMarginFlag  = &quot;false&quot; and @EllipticalMarginFlag  = &quot;true&quot;">
                          X1:<xsl:value-of select="Left"/> 
                          X2::<xsl:value-of select="Right"/> 
                          Y1:<xsl:value-of select="Top"/> 
                          Y2:<xsl:value-of select="Bottom"/>
                        </xsl:if>
                        <xsl:if test="@EllipticalMarginFlag  = &quot;false&quot;">
                          <xsl:value-of select="Left"/>
                        </xsl:if>
                      </xsl:for-each>
                    </td>
                    <td width="100">
                      <xsl:if test="BlockMargin/@OptimizeJawsFlag = &quot;true&quot;">
                        <img src="..\stylesheets\tick.gif" border="0"/>
                      </xsl:if>
                    </td>
                    <td width="100">
                      <xsl:if test="BlockMargin/@OptimizeCollRtnFlag = &quot;true&quot;">
                        <img src="..\stylesheets\tick.gif" border="0"/>
                      </xsl:if>
										</td>							
										<td width="200"><xsl:value-of select="Target/VolumeID"/> (<xsl:value-of select="Target/VolumeType"/>)</td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
            <br/>
          </xsl:for-each>
        </xsl:if>

        <!-- MLCs -->
        <xsl:if test="count(  MLCPlans/MLCPlan ) &gt; 0">
          <xsl:for-each select="MLCPlans">
            <h3>Field MLCs</h3>
            <table border="0" cellpadding="1" cellspacing="1">
              <thead class="tableheader">
                <tr align="center" valign="middle">
                  <td width="70">Id</td>
                  <td width="120">Arc Dynamic Plan</td>
                  <td width="80">Model Name</td>
                  <td width="80">Segment Count</td>
                  <td width="95">Contour Meet Point</td>
                  <td width="95">Closed Meet Point</td>
                  <td width="130">MLC Margin [<xsl:value-of select="MLCPlan/MLCMargin/@Unit"/>]</td>
                  <td width="80">Jaws Optimization</td>
                  <td width="100">Optimize Collimator Rotation</td>
                  <td width="120">Target</td>
                </tr>
              </thead>
              <tbody class="tablebody">
                <xsl:for-each select="MLCPlan">
                  <tr align="center" valign="middle">
                    <td width="70"><xsl:value-of select="@ID"/></td>
                    <td width="120">
                      <xsl:if test="@DynamicFlag = &quot;true&quot;">
                        <img src="..\stylesheets\tick.gif" border="0"/>
                      </xsl:if>
                    </td>
                    <td width="80"><xsl:value-of select="ModelName"/></td>
                    <td width="80"><xsl:value-of select="SegmentCount"/></td>
                    <td width="95"><xsl:value-of select="ContourMeetPoint"/></td>
                    <td width="95"><xsl:value-of select="ClosedMeetPoint"/></td>
                    <td width="130">
                      <xsl:for-each select="MLCMargin">
                        <xsl:if test="@BEVMarginFlag  = &quot;true&quot; and @EllipticalMarginFlag  = &quot;true&quot;">
                          L:<xsl:value-of select="Left"/> 
                          R:<xsl:value-of select="Right"/> 
                          T:<xsl:value-of select="Top"/> 
                          B:<xsl:value-of select="Bottom"/>
                        </xsl:if>
                        <xsl:if test="@BEVMarginFlag  = &quot;false&quot; and @EllipticalMarginFlag  = &quot;true&quot;">
                          X1::<xsl:value-of select="Left"/> 
                          X2::<xsl:value-of select="Right"/> 
                          Y1:<xsl:value-of select="Top"/> 
                          Y2:<xsl:value-of select="Bottom"/>
                        </xsl:if>
                        <xsl:if test="@EllipticalMarginFlag  = &quot;false&quot;">
                          <xsl:value-of select="Left"/>
                        </xsl:if>
                      </xsl:for-each>
                    </td>
                    <td width="80"><xsl:value-of select="MLCMargin/@JawFittingMode"/></td>
                    <td width="80">
                      <xsl:if test="MLCMargin/@OptimizeCollRtnFlag = &quot;true&quot;">
                        <img src="..\stylesheets\tick.gif" border="0"/>
                      </xsl:if>
                    </td>
                    <td width="120"><xsl:value-of select="Target/VolumeID"/> (<xsl:value-of select="Target/VolumeType"/>)</td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
            <br/>
          </xsl:for-each>
        </xsl:if>

        <!-- Wedges -->
        <xsl:if test="count(  Wedges/Wedge  ) &gt; 0">
          <xsl:for-each select="Wedges">
            <h3>Field Wedges</h3>
            <table border="0" cellpadding="1" cellspacing="1">
              <thead class="tableheader">
                <tr align="center" valign="middle">
                  <td width="70">Slot</td>
                  <td width="70">Type</td>
                  <td width="120">Thin Edge Jaw</td>
                  <td width="70">Angle (deg)</td>
                  <td width="80">Min X [<xsl:value-of select="Wedge/MinCollX/@Unit"/>]</td>
                  <td width="80">Max X [<xsl:value-of select="Wedge/MaxCollX/@Unit"/>]</td>
                  <td width="80">Min Y [<xsl:value-of select="Wedge/MinCollY/@Unit"/>]</td>
                  <td width="80">Max Y [<xsl:value-of select="Wedge/MaxCollY/@Unit"/>]</td>
                  <td width="70">Motor Weight</td>
                </tr>
              </thead>
              <tbody class="tablebody">
                <xsl:for-each select="Wedge">
                  <tr align="center" valign="middle">
                    <td width="70"><xsl:value-of select="Slot"/></td>
                    <td width="70"><xsl:value-of select="Type"/></td>
                    <td width="120"><xsl:value-of select="ThinEdgeJaw"/></td>
                    <td width="70"><xsl:value-of select="AngleDeg"/></td>
                    <td width="80"><xsl:value-of select="MinCollX"/></td>
                    <td width="80"><xsl:value-of select="MaxCollX"/></td>
                    <td width="80"><xsl:value-of select="MinCollY"/></td>
                    <td width="80"><xsl:value-of select="MaxCollY"/></td>
                    <td width="70"><xsl:value-of select="MotoWeight"/></td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
            <br/>
          </xsl:for-each>
        </xsl:if>

        <!-- Applicators -->
        <xsl:if test="count( Applicators/Applicator  ) &gt; 0">
          <xsl:for-each select="Applicators">
            <h3>Field Applicators</h3>
            <table border="0" cellpadding="1" cellspacing="1">
              <thead class="tableheader">
                <tr align="center" valign="middle">
                  <td width="70">X Size [<xsl:value-of select="Applicator/XSize/@Unit"/>]</td>
                  <td width="70">Y Size [<xsl:value-of select="Applicator/YSize/@Unit"/>]</td>
                  <td width="70">Slot</td>
                </tr>
              </thead>
              <tbody class="tablebody">
                <xsl:for-each select="Applicator">
                  <tr align="center" valign="middle">
                    <td width="70"><xsl:value-of select="XSize"/></td>
                    <td width="70"><xsl:value-of select="YSize"/></td>
                    <td width="70"><xsl:value-of select="Slot"/></td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
            <br/>
          </xsl:for-each>
        </xsl:if>
      </div>
    </xsl:for-each>

    <!-- Brachy Field Details -->
    <xsl:for-each select="BrachyField">
      <div class="details">
        <h3>Applicator: <xsl:value-of select="@ID"/></h3>
        <table border="0" cellpadding="1" cellspacing="1">
          <tbody class="infotable">
            <tr>
              <td width="140">Treatment Unit:</td>
              <td width="140"><xsl:value-of select="TreatmentUnit"/></td>
              <xsl:choose>
                <xsl:when test="count(BrachySolidApplicatorId) &gt; 0">
                  <td width="140">Solid Applicator:</td>
                  <td width="140"><xsl:value-of select="BrachySolidApplicatorId"/></td>
                </xsl:when>
                <xsl:otherwise>
                  <td width="140"></td>
                  <td width="140"></td>
                </xsl:otherwise>
              </xsl:choose>
            </tr>
            <tr>
              <td width="140">Channel:</td>
              <td width="140"><xsl:value-of select="ChannelID"/></td>
              <td width="140">Applicator length [<xsl:value-of select="ApplicatorLength/@Unit"/>]:</td>
              <td width="140"><xsl:value-of select="ApplicatorLength"/></td>
            </tr>
          </tbody>
        </table>
        <br/>
				
        <!-- Source Positions -->
        <xsl:if test="count( SourcePositions/SourcePosition  ) &gt; 0">
          <xsl:for-each select="SourcePositions">
					  <h3>Applicator Source Positions</h3>
            <table border="0" cellpadding="1" cellspacing="1">
              <tbody class="infotable">
                <tr>
                  <td width="140">StepSize [mm]:</td>
                  <td width="140"><xsl:value-of select="StepSize"/></td>
                </tr>
              </tbody>
            </table>
            <table border="0" cellpadding="1" cellspacing="1">
              <thead class="tableheader">
                <tr align="center" valign="middle">
                  <td width="140">Position  [<xsl:value-of select="SourcePosition/Position/@Unit"/>]:</td>
                  <td width="140">Time [s]</td>
                  <td width="140">Strength [Gy]</td>
                </tr>
              </thead>
              <tbody class="tablebody">
                <xsl:for-each select="SourcePosition">
                  <tr align="center" valign="middle">
                    <td width="140"><xsl:value-of select="Position"/></td>
                    <td width="140"><xsl:value-of select="Time"/></td>
                    <td width="140"><xsl:value-of select="CurrentStrength"/></td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
            <br/>
          </xsl:for-each>
        </xsl:if>

        <!-- Reference Lines -->
        <xsl:if test="count( RefLines/RefLine  ) &gt; 0">
          <xsl:for-each select="RefLines">
            <h3>Applicator Reference Lines</h3>
            <table border="0" cellpadding="1" cellspacing="1">
              <thead class="tableheader">
                <tr align="center" valign="middle">
                  <td width="140">Id</td>
                  <td width="160">Point [<xsl:value-of select="RefLine/RefLinePoint/@Unit"/>]</td>
                </tr>
              </thead>
              <tbody class="tablebody">
                <xsl:for-each select="RefLine">
                  <xsl:variable name="RefLineID" select="@ID"/>
                  <xsl:for-each select="RefLinePoint">
                    <tr align="center" valign="middle">
                      <td width="140"><xsl:value-of select="$RefLineID"/></td>
                      <td width="160">[<xsl:value-of select="@X"/>, <xsl:value-of select="@Y"/>, <xsl:value-of select="@Z"/>]</td>
                    </tr>
                  </xsl:for-each>
                </xsl:for-each>
              </tbody>
            </table>
					  <br/>
          </xsl:for-each>
        </xsl:if>

        <!-- Reference Points -->
        <xsl:if test="count( RefPoints/RefPoint  ) &gt; 0">
          <xsl:for-each select="RefPoints">
            <h3>Applicator Reference Points</h3>
            <table border="0" cellpadding="1" cellspacing="1">
              <thead class="tableheader">
                <tr align="center" valign="middle">
                  <td width="100">Id</td>
                  <td width="130">Planned Total Dose [<xsl:value-of select="RefPoint/TotalDosePlanned/@Unit"/>]</td>
                  <td width="130">Session Dose Limit [<xsl:value-of select="RefPoint/SessionDoseLimit/@Unit"/>]</td>
                  <td width="120">Daily Dose Limit [<xsl:value-of select="RefPoint/DailyDoseLimit/@Unit"/>]</td>
                  <td width="120">Total Dose Limit [<xsl:value-of select="RefPoint/TotalDoseLimit/@Unit"/>]</td>
                  <td width="120">Location [<xsl:value-of select="RefPoint/Location/@Unit"/>]</td>
                </tr>
              </thead>
              <tbody class="tablebody">
                <xsl:for-each select="RefPoint">
                  <tr align="center" valign="middle">
                    <td width="100"><xsl:value-of select="@ID"/></td>
                    <td width="130"><xsl:value-of select="TotalDosePlanned"/></td>
                    <td width="130"><xsl:value-of select="SessionDoseLimit"/></td>
                    <td width="120"><xsl:value-of select="DailyDoseLimit"/></td>
                    <td width="120"><xsl:value-of select="TotalDoseLimit"/></td>
                    <td width="120">[<xsl:value-of select="Location/@X"/>, <xsl:value-of select="Location/@Y"/>, <xsl:value-of select="Location/@Z"/>]</td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
            <br/>
          </xsl:for-each>
        </xsl:if>
      </div>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
