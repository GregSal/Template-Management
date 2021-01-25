<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fn="http://www.w3.org/2005/02/xpath-functions" xmlns:msxsl="urn:schemas-microsoft-com:xslt">
  <xsl:output encoding="UTF-8" method="html" version="4.01" />

  <!-- invalid numbers are shown as - instead of NaN -->
  <xsl:decimal-format NaN="-"/>

  <xsl:template match="/">
    <xsl:variable name="root" select="/"/>
    <html>
      <head>
        <link rel="stylesheet" href="ReportStyle.css"/>
      </head>
      <title>
        Instruction Form for '<xsl:value-of select="/PlanReport/PatientName"/>', Plan '<xsl:value-of select="/PlanReport/PlanName"/>'
      </title>
      <body>
        <h1>Instruction Form</h1>

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
              <xsl:value-of select="/PlanReport/PlanApprovalDateTime"/>&#160;by&#160; 
			  <xsl:value-of select="/PlanReport/PlanApprovalBy"/>
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
            <td class="heading right">Treatment Unit Model:</td>
            <td class="indented">
              <xsl:value-of select="/PlanReport/TreatmentUnitModelName"/>
            </td>
          </tr>
          <tr>
            <td class="heading right">Treatment Unit Last Modified:</td>
            <td class="indented">
              <xsl:value-of select="/PlanReport/TreatmentUnitLastModified"/>
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

        <!-- Precription table -->
        <h2>Prescription</h2>
        <table>
          <tr>
            <td class="heading right">Dose / Fraction:</td>
            <td class="indented">
              <xsl:choose>
                <xsl:when test="string(number(/PlanReport/DosePerFraction)) != 'NaN'">
                  <xsl:choose>
                    <xsl:when test="string(number(/PlanReport/DosePerFraction/@Unit)) = 'cGy'">
                      <xsl:value-of select="format-number(/PlanReport/DosePerFraction, '0.0 ')"/>
                      <xsl:value-of select="/PlanReport/DosePerFraction/@Unit"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="format-number(/PlanReport/DosePerFraction, '0.000 ')"/>
                      <xsl:value-of select="/PlanReport/DosePerFraction/@Unit"/>
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
                <xsl:when test="string(number(/PlanReport/TotalDose)) != 'NaN'">
                  <xsl:choose>
                    <xsl:when test="string(number(/PlanReport/TotalDose/@Unit)) = 'cGy'">
                      <xsl:value-of select="format-number(/PlanReport/TotalDose, '0.0 ')"/>
                      <xsl:value-of select="/PlanReport/TotalDose/@Unit"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="format-number(/PlanReport/TotalDose, '0.000 ')"/>
                      <xsl:value-of select="/PlanReport/TotalDose/@Unit"/>
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
                <xsl:when test="string(number(/PlanReport/TreatmentPercentage)) != 'NaN'">
                  <xsl:value-of select="format-number(/PlanReport/TreatmentPercentage, '#0.0%')"/>
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

        <h2>Instructions</h2>

        <p>
          All angles and field sizes are given using <xsl:value-of select="/PlanReport/Scale"/>&#160;scale.
        </p>

        <!-- 
        First we sort the beams according to their treatment order and store the result collection into a variable.
        Then we loop through that collection to print out the data. This is required so that preceding-sibling 
        points to the preceding sibling in the sorted order, not in the document order. We use preceding-sibling
        to print out chages to isocenter position and cone size only if they change.
        -->
        <xsl:variable name="SortedBeams">
          <xsl:for-each select="/PlanReport/Beams/Beam">
            <xsl:sort select="TreatmentOrderNumber" data-type="number"/>
            <xsl:copy-of select="."/>
            <xsl:text> </xsl:text>
          </xsl:for-each>
        </xsl:variable>

        <xsl:for-each select="msxsl:node-set($SortedBeams)/Beam">
          <xsl:variable name="num" select="IsocenterNumber"/>
          <xsl:variable name="prevnum" select="preceding-sibling::*[1]/IsocenterNumber"/>
          <xsl:variable name="issetup" select="IsSetupBeam"/>
          <xsl:if test="not($num = $prevnum)">
            <h3>
              Isocenter <xsl:value-of select="./IsocenterNumber"/>
            </h3>
            <table>
              <tr>
                <td>
                  &#x2610;
                </td>
                <td colspan="4">
                  Set coordinates to:
                </td>
              </tr>
              <tr>
                <td/>
                <td class="indented" colspan="2">
                  Planning
                </td>
                <td class="indented" colspan="2">
                  DICOM
                </td>
                <xsl:if test="string($root/PlanReport/FrameType) != 'Frameless'">
                  <td width="50px"/>
                  <td class="indented" colspan="2">
                    BRW
                  </td>
                </xsl:if>
              </tr>
              <tr>
                <td/>
                <td class="right" width="30px">
                  X =
                </td>
                <td class="right">
                  <xsl:value-of select="format-number($root/PlanReport/Isocenters/Isocenter[@IsocenterNumber=$num]/X, '##0.00 ')"/>
                  <xsl:value-of select="$root/PlanReport/Isocenters/Isocenter[@IsocenterNumber = $num]/X/@Unit"/>
                </td>
                <td class="right" width="30px">
                  X =
                </td>
                <td class="right">
                  <xsl:value-of select="format-number($root/PlanReport/Isocenters/Isocenter[@IsocenterNumber=$num]/DICOMX, '##0.00 ')"/>
                  <xsl:value-of select="$root/PlanReport/Isocenters/Isocenter[@IsocenterNumber = $num]/DICOMX/@Unit"/>
                </td>
                <xsl:if test="string($root/PlanReport/FrameType) != 'Frameless'">
                  <td width="50px"/>
                  <td class="right" width="30px">
                    AP =
                  </td>
                  <td class="right">
                    <xsl:value-of select="format-number($root/PlanReport/Isocenters/Isocenter[@IsocenterNumber=$num]/AP, '###0.0 ')"/>
                    <xsl:value-of select="$root/PlanReport/Isocenters/Isocenter[@IsocenterNumber = $num]/AP/@Unit"/>
                  </td>
                </xsl:if>
              </tr>
              <tr>
                <td/>
                <td class="right" width="30px">
                  Y =
                </td>
                <td class="right">
                  <xsl:value-of select="format-number($root/PlanReport/Isocenters/Isocenter[@IsocenterNumber = $num]/Y, '##0.00 ')"/>
                  <xsl:value-of select="$root/PlanReport/Isocenters/Isocenter[@IsocenterNumber = $num]/Y/@Unit"/>
                </td>
                <td class="right" width="30px">
                  Y =
                </td>
                <td class="right">
                  <xsl:value-of select="format-number($root/PlanReport/Isocenters/Isocenter[@IsocenterNumber = $num]/DICOMY, '##0.00 ')"/>
                  <xsl:value-of select="$root/PlanReport/Isocenters/Isocenter[@IsocenterNumber = $num]/DICOMY/@Unit"/>
                </td>
                <xsl:if test="string($root/PlanReport/FrameType) != 'Frameless'">
                  <td width="50px"/>
                  <td class="right" width="30px">
                    Lat =
                  </td>
                  <td class="right">
                    <xsl:value-of select="format-number($root/PlanReport/Isocenters/Isocenter[@IsocenterNumber = $num]/Lateral, '###0.0 ')"/>
                    <xsl:value-of select="$root/PlanReport/Isocenters/Isocenter[@IsocenterNumber = $num]/Lateral/@Unit"/>
                  </td>
                </xsl:if>
              </tr>
              <tr>
                <td/>
                <td class="right" width="30px">
                  Z =
                </td>
                <td class="right">
                  <xsl:value-of select="format-number($root/PlanReport/Isocenters/Isocenter[@IsocenterNumber = $num]/Z, '##0.00 ')"/>
                  <xsl:value-of select="$root/PlanReport/Isocenters/Isocenter[@IsocenterNumber = $num]/Z/@Unit"/>
                </td>
                <td class="right" width="30px">
                  Z =
                </td>
                <td class="right">
                  <xsl:value-of select="format-number($root/PlanReport/Isocenters/Isocenter[@IsocenterNumber = $num]/DICOMZ, '##0.00 ')"/>
                  <xsl:value-of select="$root/PlanReport/Isocenters/Isocenter[@IsocenterNumber = $num]/DICOMZ/@Unit"/>
                </td>
                <xsl:if test="string($root/PlanReport/FrameType) != 'Frameless'">
                  <td width="50px"/>
                  <td class="right" width="30px">
                    Ax =
                  </td>
                  <td class="right">
                    <xsl:value-of select="format-number($root/PlanReport/Isocenters/Isocenter[@IsocenterNumber = $num]/Axial, '###0.0 ')"/>
                    <xsl:value-of select="$root/PlanReport/Isocenters/Isocenter[@IsocenterNumber = $num]/Axial/@Unit"/>
                  </td>
                </xsl:if>
              </tr>
            </table>
          </xsl:if>

          <h4 class="indented">
            <xsl:value-of select="@Id"/>
          </h4>
          <table class="indented" style="page-break-inside: avoid;">
            <xsl:choose>
              <xsl:when test="IsSetupBeam = 'false'">
                <xsl:if test="not(Cone = preceding-sibling::*[1]/Cone)">
                  <tr>
                    <td>
                      &#x2610;
                    </td>
                    <td class="indented">
                      Install <xsl:value-of select="format-number(Cone, '#0.#')"/>&#160;<xsl:value-of select="Cone/@Unit"/> collimator.
                    </td>
                  </tr>
                  <tr>
                    <td>
                      &#x2610;
                    </td>
                    <td class="indented">
                      Set <xsl:value-of select="$root/PlanReport/TreatmentUnitLabels/FieldX"/> to <xsl:value-of select="format-number(FieldX, '##0.0')"/><xsl:value-of select="FieldX/@Unit"/>.
                    </td>
                  </tr>
                  <tr>
                    <td>
                      &#x2610;
                    </td>
                    <td class="indented">
                      Set <xsl:value-of select="$root/PlanReport/TreatmentUnitLabels/FieldY"/> to <xsl:value-of select="format-number(FieldY, '##0.0')"/><xsl:value-of select="FieldY/@Unit"/>.
                    </td>
                  </tr>
                </xsl:if>
              </xsl:when>
              <xsl:otherwise>
                <tr>
                  <td/>
                  <td class="indented">
                    This is a setup field.
                  </td>
                </tr>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:if test="not(PatientSupportAngle = preceding-sibling::*[1]/PatientSupportAngle)">
              <tr>
                <td>
                  &#x2610;
                </td>
                <td class="indented">
                  Set couch to <xsl:value-of select="format-number(PatientSupportAngle, '##0.0')"/><xsl:value-of select="PatientSupportAngle/@Unit"/>.
                </td>
              </tr>
            </xsl:if>
            <tr>
              <td>
                &#x2610;
              </td>
              <td class="indented">
                Set gantry start angle to <xsl:value-of select="format-number(GantryStartAngle, '##0.0')"/><xsl:value-of select="GantryStartAngleExtended"/><xsl:value-of select="GantryStartAngle/@Unit"/>.
              </td>
            </tr>
            <xsl:if test="GantryDirection != 'NONE'">
              <tr>
                <td>
                  &#x2610;
                </td>
                <td class="indented">
                  Set gantry end angle to <xsl:value-of select="format-number(GantryStopAngle, '##0.0')"/><xsl:value-of select="GantryStopAngleExtended"/><xsl:value-of select="GantryStopAngle/@Unit"/>.
                </td>
              </tr>
            </xsl:if>
            <xsl:if test="IsSetupBeam = 'true'">
              <tr>
                <td>
                  &#x2610;
                </td>
                <td class="indented">
                  Set collimator angle to <xsl:value-of select="format-number(CollimatorAngle, '##0.0')"/><xsl:value-of select="CollimatorAngle/@Unit"/>.
                </td>
              </tr>
              <tr>
                <td>
                  &#x2610;
                </td>
                <td class="indented">
                  Set field X-size to <xsl:value-of select="format-number(FieldX, '##0.0')"/><xsl:value-of select="FieldX/@Unit"/>.
                </td>
              </tr>
              <tr>
                <td>
                  &#x2610;
                </td>
                <td class="indented">
                  Set field Y-size to <xsl:value-of select="format-number(FieldY, '##0.0')"/><xsl:value-of select="FieldY/@Unit"/>.
                </td>
              </tr>
            </xsl:if>
            <tr>
              <td>
                &#x2610;
              </td>
              <td class="indented">
                Treat <xsl:value-of select="format-number(MU,'###0')"/>&#160;<xsl:value-of select="MU/@Unit"/>.
              </td>
            </tr>
          </table>
        </xsl:for-each>

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
