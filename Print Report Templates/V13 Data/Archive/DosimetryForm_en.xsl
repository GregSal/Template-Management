<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fn="http://www.w3.org/2005/02/xpath-functions" xmlns:msxsl="urn:schemas-microsoft-com:xslt">
  <xsl:output encoding="UTF-8" method="html" version="4.01" />

  <!-- Invalid numbers are shown as - instead of NaN. 
       This fixes the cases where a number is shown without units. If number contains units,
       use a <xsl:choose> -structure such as
          <xsl:choose>
            <xsl:when test="string(number(/PlanReport/PrescribedDosePerFraction)) != 'NaN'">
              <xsl:value-of select="format-number(/PlanReport/PrescribedDosePerFraction, '0.00 ')"/>
              <xsl:value-of select="/PlanReport/PrescribedDosePerFraction/@Unit"/>
            </xsl:when>
            <xsl:otherwise>
              -                  
            </xsl:otherwise>
          </xsl:choose>
  -->
  <xsl:decimal-format NaN="-"/>

  <xsl:template match="/">
    <xsl:variable name="root" select="/"/>
    <html>
      <head>
        <link rel="stylesheet" href="ReportStyle.css"/>
      </head>

      <title>
        Dosimetry Form for '<xsl:value-of select="/PlanReport/PatientName"/>', Plan '<xsl:value-of select="/PlanReport/PlanName"/>'
      </title>

      <body>
        <h1>Dosimetry Report</h1>

        <!-- This table contains the basic data of the patient and plan etc  -->
        <table>
          <tr>
            <td class="heading right">Hospital Name:</td>
            <td class="indented">
              <xsl:value-of select="/PlanReport/HospitalName"/>
            </td>
          </tr>
          <tr>
            <td class="heading right">Patient Name:</td>
            <td class="indented">
              <xsl:value-of select="/PlanReport/PatientName"/>
            </td>
          </tr>
          <tr>
            <td class="heading right">Patient ID / ID2 / SSN:</td>
            <td class="indented">
              <xsl:value-of select="/PlanReport/PatientID"/>&#160;/&#160;
              <xsl:value-of select="/PlanReport/PatientID2"/>&#160;/&#160;
              <xsl:value-of select="/PlanReport/PatientSSN"/>
            </td>
          </tr>
          <tr>
            <td class="heading right">Date of Birth:</td>
            <td class="indented">
              <xsl:value-of select="/PlanReport/DateOfBirth"/>
            </td>
          </tr>
          <tr>
            <td class="heading right">Course ID / Plan ID:</td>
            <td class="indented">
              <xsl:value-of select="/PlanReport/CourseID"/>&#160;/&#160;<xsl:value-of select="/PlanReport/PlanID"/>
            </td>
          </tr>
          <tr>
            <td class="heading right">Plan Created:</td>
            <td class="indented">
              <xsl:value-of select="/PlanReport/PlanCreatedBy"/>,&#160;
              <xsl:value-of select="/PlanReport/PlanCreationDateTime"/>
            </td>
          </tr>
          <tr>
            <td class="heading right">Plan Last Modified:</td>
            <td class="indented">
              <xsl:value-of select="/PlanReport/PlanLastChangedBy"/>,&#160;
              <xsl:value-of select="/PlanReport/PlanLastChangedDateTime"/>
            </td>
          </tr>
          <tr>
            <td class="heading right">Plan Approval:</td>
            <td class="indented">
              <xsl:value-of select="/PlanReport/PlanApprovalStatus"/>,&#160;
              <xsl:value-of select="/PlanReport/PlanApprovalDateTime"/>
            </td>
          </tr>
          <tr>
            <td class="heading right">Image ID:</td>
            <td class="indented">
              <xsl:value-of select="/PlanReport/ImageID"/>
              <xsl:if test="/PlanReport/IsFrameDetected = 'true'">
                &#160;(image has been processed with Head Frame Detection)
              </xsl:if>
            </td>
          </tr>
          <tr>
            <td class="heading right">Treatment Unit:</td>
            <td class="indented">
              <xsl:value-of select="/PlanReport/TreatmentUnitName"/>
            </td>
          </tr>
          <tr>
            <td class="heading right">Energy / Dose Rate:</td>
            <td class="indented">
              <xsl:value-of select="/PlanReport/Energy"/>&#160;/&#160;<xsl:value-of select="format-number(/PlanReport/DoseRate, '###')"/>&#160;<xsl:value-of select="/PlanReport/DoseRate/@Unit"/>
            </td>
          </tr>
          <tr>
            <td class="heading right">Fixation:</td>
            <td class="indented">
              <xsl:choose>
                <xsl:when test="/PlanReport/FrameType = 'BRW'">
                  BRW-Frame
                </xsl:when>
                <xsl:when test="/PlanReport/FrameType = 'VMS'">
                  VMS-Frame
                </xsl:when>
                <xsl:when test="/PlanReport/FrameType = 'Unknown'">
                  Unknown frame type
                </xsl:when>
                <xsl:otherwise>
                  Frameless
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
          <tr>
            <td class="heading right">Software Version:</td>
            <td class="indented">
              <xsl:value-of select="/PlanReport/ApplicationNameAndVersion"/>
            </td>
          </tr>
        </table>

        <!-- This table contains calculation related data such as calculation options and log -->
        <h2>Calculation</h2>
        <table>
          <tr>
            <td class="heading right">Calculation Model:</td>
            <td class="indented">
              <xsl:value-of select="/PlanReport/CalculationModelName"/>
            </td>
          </tr>
          <tr>
            <td class="heading right">Calculation Options:</td>
            <td class="indented">
              <table>
                <xsl:for-each select="/PlanReport/CalculationOptions/*/@*">
                  <tr>
                    <td class="right highlight">
                      <xsl:value-of select="name()"/>:
                    </td>
                    <td class="indented">
                      <xsl:value-of select="current()"/>
                    </td>
                  </tr>
                </xsl:for-each>
              </table>
            </td>
          </tr>
          <tr>
            <td class="heading right">Arc Angle Resolution:</td>
            <td class="indented">
              <xsl:choose>
                <xsl:when test="string(number(/PlanReport/AngleResolution)) != 'NaN'">
                  <xsl:value-of select="format-number(/PlanReport/AngleResolution, '#0.#')"/>
                  <xsl:value-of select="/PlanReport/AngleResolution/@Unit"/>
                </xsl:when>
                <xsl:otherwise>
                  -
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
          <tr>
            <td class="heading right">Dose Grid Resolution:</td>
            <td class="indented">
              <xsl:choose>
                <xsl:when test="string(number(/PlanReport/DoseGridResolution)) != 'NaN'">
                  <xsl:value-of select="format-number(/PlanReport/DoseGridResolution, '#0.0')"/>
                  <xsl:value-of select="/PlanReport/DoseGridResolution/@Unit"/>
                </xsl:when>
                <xsl:otherwise>
                  -
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
          <tr>
            <td class="heading right">Calculation Log:</td>
            <td class="indented">
              <xsl:for-each select="/PlanReport/CalculationLog/Line">
                <xsl:value-of select="."/>
                <br/>
              </xsl:for-each>
            </td>
          </tr>
        </table>

        <!-- Precription table -->
        <h2>Prescription</h2>
        <table>
          <tr>
            <td class="heading right">Dose / Fraction:</td>
            <td class="indented">
              <xsl:choose>
                <xsl:when test="string(number(/PlanReport/PrescribedDosePerFraction)) != 'NaN'">
                  <xsl:choose>
                    <xsl:when test="string(number(/PlanReport/PrescribedDosePerFraction/@Unit)) = 'cGy'">
                      <xsl:value-of select="format-number(/PlanReport/PrescribedDosePerFraction, '0.0 ')"/>
                      <xsl:value-of select="/PlanReport/PrescribedDosePerFraction/@Unit"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="format-number(/PlanReport/PrescribedDosePerFraction, '0.000 ')"/>
                      <xsl:value-of select="/PlanReport/PrescribedDosePerFraction/@Unit"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                  -
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
          <tr>
            <td class="heading right">Number of Fractions:</td>
            <td class="indented">
              <xsl:choose>
                <xsl:when test="string(number(/PlanReport/NumberOfFractions)) != 'NaN'">
                  <xsl:value-of select="/PlanReport/NumberOfFractions"/>
                </xsl:when>
                <xsl:otherwise>
                  -
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
          <tr>
            <td class="heading right">Total Dose:</td>
            <td class="indented">
              <xsl:choose>
                <xsl:when test="string(number(/PlanReport/TotalPrescribedDose)) != 'NaN'">
                  <xsl:choose>
                    <xsl:when test="string(number(/PlanReport/TotalPrescribedDose/@Unit)) = 'cGy'">
                      <xsl:value-of select="format-number(/PlanReport/TotalPrescribedDose, '0.0 ')"/>
                      <xsl:value-of select="/PlanReport/TotalPrescribedDose/@Unit"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="format-number(/PlanReport/TotalPrescribedDose, '0.000 ')"/>
                      <xsl:value-of select="/PlanReport/TotalPrescribedDose/@Unit"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                  -
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
          <tr>
            <td class="heading right">Treatment Percentage:</td>
            <td class="indented">
              <xsl:choose>
                <xsl:when test="string(number(/PlanReport/PrescribedPercentage)) != 'NaN'">
                  <xsl:value-of select="format-number(/PlanReport/PrescribedPercentage, '#0.0%')"/> of maximum
                </xsl:when>
                <xsl:otherwise>
                  -
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
          <tr>
            <td class="heading right">Plan Normalization Method:</td>
            <td class="indented">
              <xsl:value-of select="/PlanReport/PlanNormalizationMethod"/>
            </td>
          </tr>
          <tr>
            <td class="heading right">Plan Normalization Factor:</td>
            <td class="indented">
              <xsl:value-of select="format-number(/PlanReport/PlanNormalizationFactor, '0.000')"/>
              <xsl:if test="number(/PlanReport/PlanNormalizationFactor) != 1.0">
                &#160;! Plan has been re-normalized outside Eclipse Cone Planning!
              </xsl:if>
            </td>
          </tr>
          <tr>
            <td class="heading right">Total Weight:</td>
            <td class="indented">
              <xsl:value-of select="format-number(/PlanReport/TotalArcWeight, '###0.000')"/>
            </td>
          </tr>
          <tr>
            <td class="heading right">Total Rotation:</td>
            <td class="indented">
              <xsl:value-of select="format-number(/PlanReport/TotalArcDegrees, '###0.#')"/>
              <xsl:value-of select="/PlanReport/TotalArcDegrees/@Unit"/>
            </td>
          </tr>
          <tr>
            <td class="heading right">3D Dose Maximum (Dmax):</td>
            <td class="indented">
              <xsl:choose>
                <xsl:when test="string(number(/PlanReport/DoseMax3D)) != 'NaN'">
                  <xsl:choose>
                    <xsl:when test="string(number(/PlanReport/DoseMax3D/@Unit)) = 'cGy'">
                      <xsl:value-of select="format-number(/PlanReport/DoseMax3D, '0.0 ')"/>
                      <xsl:value-of select="/PlanReport/DoseMax3D/@Unit"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="format-number(/PlanReport/DoseMax3D, '0.000 ')"/>
                      <xsl:value-of select="/PlanReport/DoseMax3D/@Unit"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                  3D dose not calculated.
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
          <tr>
            <td class="heading right">Repeat Factor:</td>
            <td class="indented">
              <xsl:choose>
                <xsl:when test="string(number(/PlanReport/RepeatWeight)) != 'NaN'">
                  <xsl:choose>
                    <xsl:when test="string(number(/PlanReport/RepeatWeight/@Unit)) = 'cGy'">
                      <xsl:value-of select="format-number(/PlanReport/RepeatWeight, '0.0 ')"/>
                      <xsl:value-of select="/PlanReport/RepeatWeight/@Unit"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="format-number(/PlanReport/RepeatWeight, '0.000 ')"/>
                      <xsl:value-of select="/PlanReport/RepeatWeight/@Unit"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:when>
                <xsl:otherwise>
                  -
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
        </table>

        <!-- Isocenters table -->
        <h2>Isocenters</h2>
        <p>NOTE: The values in the following table are in relative units and do not take prescription into account.</p>
        <p>
          <table>
            <tr>
              <th class="left underlined">Isocenter</th>
              <th class="right underlined">Total Weight</th>
              <th class="right underlined">Direct Weight</th>
              <th class="right underlined">Indirect Weight</th>
            </tr>
            <xsl:for-each select="/PlanReport/Isocenters/Isocenter">
              <xsl:variable name="num" select="@IsocenterNumber"/>
              <tr>
                <td class="center">
                  <xsl:value-of select="$num"/>
                </td>
                <td class="right">
                  <xsl:value-of select="format-number(TotalDose, '0.000')"/>
                </td>
                <td class="right">
                  <xsl:value-of select="format-number(DirectDose, '0.000')"/>
                </td>
                <td class="right">
                  <xsl:value-of select="format-number(IndirectDose, '0.000')"/>
                </td>
              </tr>
            </xsl:for-each>
          </table>
        </p>
        <p>
          Weight at Dose maximum: <xsl:value-of select="format-number(/PlanReport/WeightAtDmax, '0.000')"/>
        </p>

        <!-- 
        First we sort the beams according to their isocenter number and store the result collection into a variable.
        Then we loop through that collection to print out the data. This is required so that preceding-sibling 
        points to the preceding sibling in the sorted order, not in the document order. We use preceding-sibling
        to print out chages to isocenter position only if they change.
        -->
        <xsl:variable name="SortedTreatmentBeams">
          <xsl:for-each select="/PlanReport/Beams/Beam[IsSetupBeam='false']">
            <xsl:sort select="IsocenterNumber" data-type="number"/>
            <xsl:copy-of select="."/>
            <xsl:text> </xsl:text>
          </xsl:for-each>
        </xsl:variable>

        <xsl:variable name="SortedSetupBeams">
          <xsl:for-each select="/PlanReport/Beams/Beam[IsSetupBeam='true']">
            <xsl:sort select="IsocenterNumber" data-type="number"/>
            <xsl:copy-of select="."/>
            <xsl:text> </xsl:text>
          </xsl:for-each>
        </xsl:variable>


        <!-- Setup parameters table -->
        <h2 class="pagebreak">Setup Parameters</h2>

        NOTE:
        <ul>
          <li>All angles and field sizes are given using <xsl:value-of select="/PlanReport/Scale"/>&#160;scale.</li>
          <li>Isocenter coordinates are given using the Planning coordinate system.</li>
        </ul>

        <xsl:if test="count(/PlanReport/Beams/Beam[IsSetupBeam='false']) > 0">
          <h3>Treatment fields</h3>
          <table>
            <tr class="emphasize">
              <th class="left">Field</th>
              <th class="center underlined" colspan="4">Isocenter</th>
              <th class="right">Cone</th>
              <th class="right">Couch</th>
              <th class="center underlined" colspan="2">Gantry</th>
              <th class="right">Weight</th>
            </tr>
            <tr class="emphasize">
              <th class="left underlined">ID</th>
              <th class="left underlined">ID</th>
              <th class="right underlined">
                X [<xsl:value-of select="/PlanReport/Isocenters/Isocenter[1]/X/@Unit"/>]
              </th>
              <th class="right underlined">
                Y [<xsl:value-of select="/PlanReport/Isocenters/Isocenter[1]/Y/@Unit"/>]
              </th>
              <th class="right underlined">
                Z [<xsl:value-of select="/PlanReport/Isocenters/Isocenter[1]/Z/@Unit"/>]
              </th>
              <th class="right underlined">
                [<xsl:value-of select="msxsl:node-set($SortedTreatmentBeams)/Beam[1]/Cone/@Unit"/>]
              </th>
              <th class="right underlined">Rotation</th>
              <th class="right underlined">Start</th>
              <th class="right underlined">Stop</th>
              <th class="right underlined">Factor</th>
            </tr>
            <xsl:for-each select="msxsl:node-set($SortedTreatmentBeams)/Beam">
              <xsl:variable name="prevnum" select="preceding-sibling::*[1]/IsocenterNumber"/>
              <xsl:variable name="num" select="IsocenterNumber"/>
              <tr>
                <xsl:choose>
                  <xsl:when test="$num mod 2 > 0">
                    <xsl:attribute name="style">white</xsl:attribute>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:attribute name="class">highlight</xsl:attribute>
                  </xsl:otherwise>
                </xsl:choose>
                <td class="left" width="80px">
                  <xsl:value-of select="@Id"/>
                </td>
                <td class="left" width="10px">
                  <xsl:value-of select="$num"/>
                </td>
                <xsl:choose>
                  <xsl:when test="$num = $prevnum">
                    <td/>
                    <td/>
                    <td/>
                  </xsl:when>
                  <xsl:otherwise>
                    <td class="fixed right" width="50px">
                      <xsl:value-of select="format-number($root/PlanReport/Isocenters/Isocenter[@IsocenterNumber = $num]/X, '##0.00')"/>
                    </td>
                    <td class="fixed right" width="50px">
                      <xsl:value-of select="format-number($root/PlanReport/Isocenters/Isocenter[@IsocenterNumber = $num]/Y, '##0.00')"/>
                    </td>
                    <td class="fixed right" width="50px">
                      <xsl:value-of select="format-number($root/PlanReport/Isocenters/Isocenter[@IsocenterNumber = $num]/Z, '##0.00')"/>
                    </td>
                  </xsl:otherwise>
                </xsl:choose>
                <td class="fixed right" width="50px">
                  <xsl:value-of select="format-number(Cone, '##0.#')"/>
                </td>
                <td class="fixed right" width="50px">
                  <xsl:value-of select="format-number(PatientSupportAngle, '##0.0')"/>
                  <xsl:value-of select="PatientSupportAngle/@Unit"/>
                </td>
                <td class="fixed right" width="50px">
                  <xsl:value-of select="format-number(GantryStartAngle, '##0.0')"/>
                  <xsl:value-of select="GantryStartAngle/@Unit"/>
                </td>
                <td class="fixed right" width="50px">
                  <xsl:if test="GantryDirection != 'NONE'">
                    <xsl:value-of select="format-number(GantryStopAngle, '##0.0')"/>
                    <xsl:value-of select="GantryStartAngle/@Unit"/>
                  </xsl:if>
                </td>
                <td class="fixed right" width="60px">
                  <xsl:value-of select="format-number(WeightFactor, '0.000')"/>
                </td>
              </tr>
            </xsl:for-each>
          </table>
        </xsl:if>

        <xsl:if test="count(/PlanReport/Beams/Beam[IsSetupBeam='true']) > 0">
          <h3>Setup fields</h3>
          <table>
            <tr class="emphasize">
              <th class="left">Field</th>
              <th class="center underlined" colspan="4">Isocenter</th>
              <th class="right">Coll</th>
              <th class="right">Couch</th>
              <th class="center underlined" colspan="2">Gantry</th>
              <th class="right"> </th>
              <th class="center underlined" colspan="6">Field Size</th>
            </tr>
            <tr class="emphasize">
              <th class="left underlined">ID</th>
              <th class="left underlined">ID</th>
              <th class="right underlined">
                X [<xsl:value-of select="/PlanReport/Isocenters/Isocenter[1]/X/@Unit"/>]
              </th>
              <th class="right underlined">
                Y [<xsl:value-of select="/PlanReport/Isocenters/Isocenter[1]/Y/@Unit"/>]
              </th>
              <th class="right underlined">
                Z [<xsl:value-of select="/PlanReport/Isocenters/Isocenter[1]/Z/@Unit"/>]
              </th>
              <th class="right underlined">Rotation</th>
              <th class="right underlined">Rotation</th>
              <th class="right underlined">Start</th>
              <th class="right underlined">Stop</th>
              <th class="right underlined"></th>
              <th class="right underlined">
                <xsl:value-of select="/PlanReport/TreatmentUnitLabels/FieldX"/> [<xsl:value-of select="/PlanReport/Beams/Beam[1]/FieldX/@Unit"/>]
              </th>
              <th class="right underlined">
                <xsl:value-of select="/PlanReport/TreatmentUnitLabels/FieldY"/> [<xsl:value-of select="/PlanReport/Beams/Beam[1]/FieldY/@Unit"/>]
              </th>
            </tr>
            <xsl:for-each select="msxsl:node-set($SortedSetupBeams)/Beam">
              <xsl:variable name="num" select="IsocenterNumber"/>
              <xsl:variable name="prevnum" select="preceding-sibling::*[1]/IsocenterNumber"/>
              <tr>
                <xsl:choose>
                  <xsl:when test="$num mod 2 > 0">
                    <xsl:attribute name="style">white</xsl:attribute>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:attribute name="class">highlight</xsl:attribute>
                  </xsl:otherwise>
                </xsl:choose>
                <td class="left" width="80px">
                  <xsl:value-of select="@Id"/>
                </td>
                <td class="left" width="10px">
                  <xsl:value-of select="$num"/>
                </td>
                <xsl:choose>
                  <xsl:when test="$num = $prevnum">
                    <td/>
                    <td/>
                    <td/>
                  </xsl:when>
                  <xsl:otherwise>
                    <td class="fixed right" width="50px">
                      <xsl:value-of select="format-number($root/PlanReport/Isocenters/Isocenter[@IsocenterNumber = $num]/X, '##0.00')"/>
                    </td>
                    <td class="fixed right" width="50px">
                      <xsl:value-of select="format-number($root/PlanReport/Isocenters/Isocenter[@IsocenterNumber = $num]/Y, '##0.00')"/>
                    </td>
                    <td class="fixed right" width="50px">
                      <xsl:value-of select="format-number($root/PlanReport/Isocenters/Isocenter[@IsocenterNumber = $num]/Z, '##0.00')"/>
                    </td>
                  </xsl:otherwise>
                </xsl:choose>
                <td class="fixed right" width="50px">
                  <xsl:value-of select="format-number(CollimatorAngle, '##0.0')"/>
                  <xsl:value-of select="CollimatorAngle/@Unit"/>
                </td>
                <td class="fixed right" width="50px">
                  <xsl:value-of select="format-number(PatientSupportAngle, '##0.0')"/>
                  <xsl:value-of select="PatientSupportAngle/@Unit"/>
                </td>
                <td class="fixed right" width="50px">
                  <xsl:value-of select="format-number(GantryStartAngle, '##0.0')"/>
                  <xsl:value-of select="GantryStartAngle/@Unit"/>
                </td>
                <td class="fixed right" width="50px">
                  <xsl:if test="GantryDirection != 'NONE'">
                    <xsl:value-of select="format-number(GantryStopAngle, '##0.0')"/>
                    <xsl:value-of select="GantryStopAngle/@Unit"/>
                  </xsl:if>
                </td>
                <td/>
                <td class="fixed right">
                  <xsl:value-of select="format-number(FieldX, '##0.0')"/>
                  <xsl:if test="string(IsAsymmetricX) = 'true'">
                    <br/><xsl:value-of select="$root/PlanReport/TreatmentUnitLabels/CollX1"/>=<xsl:value-of select="format-number(CollX1, '##0.0')"/>&#160;<xsl:value-of select="$root/PlanReport/TreatmentUnitLabels/CollX2"/>=<xsl:value-of select="format-number(CollX2, '##0.0')"/>
                  </xsl:if>
                </td>
                <td class="fixed right">
                  <xsl:value-of select="format-number(FieldY, '##0.0')"/>
                  <xsl:if test="string(IsAsymmetricY) = 'true'">
                    <br/><xsl:value-of select="$root/PlanReport/TreatmentUnitLabels/CollY1"/>=<xsl:value-of select="format-number(CollY1, '##0.0')"/>&#160;<xsl:value-of select="$root/PlanReport/TreatmentUnitLabels/CollY2"/>=<xsl:value-of select="format-number(CollY2, '##0.0')"/>
                  </xsl:if>
                </td>
              </tr>
            </xsl:for-each>
          </table>
        </xsl:if>

        <!-- Dosimetric parameters table -->
        <h2>Dosimetric Parameters</h2>
        NOTE:
        <ul>
          <li>Calibration Factors have been corrected to take the absolute dosimetry measurement geometry into account.</li>
          <li>Reference Dose = Repeat Factor &#215; Weight Factor / Average TMR</li>
          <li>Monitor Units = Reference Dose / Calibration Factor</li>
        </ul>

        <h3>Treatment fields</h3>
        <table>
          <tr class="emphasize">
            <th class="left">Field</th>
            <th class="left">Isocenter</th>
            <th class="right">Average</th>
            <th class="right">Calib. Factor</th>
            <th class="right">Average</th>
            <th class="right">Ref. Dose</th>
            <th class="right">Monitor</th>
            <th class="right">MUs/Deg</th>
          </tr>
          <tr class="emphasize">
            <th class="left underlined">ID</th>
            <th class="left underlined">ID</th>
            <th class="right underlined">
              Depth [<xsl:value-of select="msxsl:node-set($SortedTreatmentBeams)/Beam[1]/AverageDepth/@Unit"/>]
            </th>
            <th class="right underlined">
              [<xsl:value-of select="msxsl:node-set($SortedTreatmentBeams)/Beam[1]/CalibrationFactor/@Unit"/>]
            </th>
            <th class="right underlined">TMR</th>
            <th class="right underlined">
              [<xsl:value-of select="msxsl:node-set($SortedTreatmentBeams)/Beam[1]/ReferenceDose/@Unit"/>]
            </th>
            <th class="right underlined">
              Units
            </th>
            <th class="right underlined">
              [<xsl:value-of select="msxsl:node-set($SortedTreatmentBeams)/Beam[1]/MUsPerDegree/@Unit"/>]
            </th>
          </tr>
          <xsl:for-each select="msxsl:node-set($SortedTreatmentBeams)/Beam">
            <xsl:variable name="prevnum" select="preceding-sibling::*[1]/IsocenterNumber"/>
            <xsl:variable name="num" select="IsocenterNumber"/>
            <tr>
              <xsl:choose>
                <xsl:when test="$num mod 2 > 0">
                  <xsl:attribute name="style">white</xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:attribute name="class">highlight</xsl:attribute>
                </xsl:otherwise>
              </xsl:choose>
              <td class="left" width="80px">
                <xsl:value-of select="@Id"/>
              </td>
              <td class="left" width="70px">
                <xsl:value-of select="$num"/>
              </td>
              <td class="fixed right" width="70px">
                <xsl:value-of select="format-number(AverageDepth, '##0.0')"/>
              </td>
              <td class="fixed right" width="90px">
                <xsl:choose>
                  <xsl:when test="CalibrationFactor/@Unit = 'Gy/MU'">
                    <xsl:value-of select="format-number(CalibrationFactor, '0.00000')"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="format-number(CalibrationFactor, '0.000')"/>
                  </xsl:otherwise>
                </xsl:choose>
              </td>
              <td class="fixed right" width="70px">
                <xsl:value-of select="format-number(AverageTMR, '0.000')"/>
              </td>
              <td class="fixed right" width="70px">
                <xsl:value-of select="format-number(ReferenceDose, '0.000')"/>
              </td>
              <td class="fixed right" width="70px">
                <xsl:value-of select="format-number(MU, '###0')"/>&#160;<xsl:value-of select="MU/@Unit"/>
              </td>
              <td class="fixed right" width="70px">
                <xsl:value-of select="format-number(MUsPerDegree, '0.00')"/>
              </td>
            </tr>
          </xsl:for-each>
        </table>
        
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
