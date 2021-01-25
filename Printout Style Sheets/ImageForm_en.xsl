<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fn="http://www.w3.org/2005/02/xpath-functions" xmlns:msxsl="urn:schemas-microsoft-com:xslt">
  <xsl:output encoding="UTF-8" method="html" version="4.01" />

  <!-- invalid numbers are shown as - instead of NaN -->
  <xsl:decimal-format NaN="-"/>

  <xsl:template match="/">
    <html>
      <head>
        <link rel="stylesheet" href="ReportStyle.css"/>
      </head>
      <title>
        Image Form for '<xsl:value-of select="/PlanReport/PatientName"/>', Plan '<xsl:value-of select="/PlanReport/PlanName"/>'
      </title>
      <body>
        <h1>Images Report</h1>

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

        <xsl:for-each select="/PlanReport/Isocenters/Isocenter">
          <xsl:variable name="num" select="@IsocenterNumber"/>
          <!-- 
               This table aligns the images the following way:
                + - - - - - + - - - +
                |           |       |
                |           | SAG   |
                | TRA       + - - - +
                |           |       |
                |           | COR   |
                + - - - - - + - - - +
          -->
          <!--
          <h3>
            Isocenter <xsl:value-of select="$num"/>
          </h3>
          <table border="2">
            <xsl:if test="$num &lt; last()">
              <xsl:attribute name="style">
                page-break-after: always;
              </xsl:attribute>
            </xsl:if>
            <tr>
              <td rowspan="2" width="65%">
                <img>
                  <xsl:attribute name="src">
                    <xsl:value-of select="/PlanReport/ImageFiles/ImageFile[IsocenterNumber=$num and @Direction='Z']/FilePath"/>
                  </xsl:attribute>
                  <xsl:attribute name="alt">
                    <xsl:value-of select="/PlanReport/ImageFiles/ImageFile[IsocenterNumber=$num and @Direction='Z']/Caption"/>
                  </xsl:attribute>
                </img>
              </td>
              <td width="30%">
                <img height="256">
                  <xsl:attribute name="src">
                    <xsl:value-of select="/PlanReport/ImageFiles/ImageFile[IsocenterNumber=$num and @Direction='Y']/FilePath"/>
                  </xsl:attribute>
                  <xsl:attribute name="alt">
                    <xsl:value-of select="/PlanReport/ImageFiles/ImageFile[IsocenterNumber=$num and @Direction='Y']/Caption"/>
                  </xsl:attribute>
                </img>
              </td>
            </tr>
            <tr>
              <td width="30%">
                <img height="256">
                  <xsl:attribute name="src">
                    <xsl:value-of select="/PlanReport/ImageFiles/ImageFile[IsocenterNumber=$num and @Direction='X']/FilePath"/>
                  </xsl:attribute>
                  <xsl:attribute name="alt">
                    <xsl:value-of select="/PlanReport/ImageFiles/ImageFile[IsocenterNumber=$num and @Direction='X']/Caption"/>
                  </xsl:attribute>
                </img>
              </td>
            </tr>
          </table>
          -->

          <!-- 
               This aligns images one image per page
          -->
          <h3 style="page-break-before: always;">
            <xsl:value-of select="/PlanReport/ImageFiles/ImageFile[IsocenterNumber=$num and @Direction='Z']/Caption"/>
          </h3>
          <img width="100%">
            <xsl:attribute name="src">
              <xsl:value-of select="/PlanReport/ImageFiles/ImageFile[IsocenterNumber=$num and @Direction='Z']/FilePath"/>
            </xsl:attribute>
          </img>
          
          <h3 style="page-break-before: always;">
            <xsl:value-of select="/PlanReport/ImageFiles/ImageFile[IsocenterNumber=$num and @Direction='Y']/Caption"/>
          </h3>
          <img width="100%">
            <xsl:attribute name="src">
              <xsl:value-of select="/PlanReport/ImageFiles/ImageFile[IsocenterNumber=$num and @Direction='Y']/FilePath"/>
            </xsl:attribute>
          </img>

          <h3 style="page-break-before: always;">
            <xsl:value-of select="/PlanReport/ImageFiles/ImageFile[IsocenterNumber=$num and @Direction='X']/Caption"/>
          </h3>
          <img width="100%">
            <xsl:attribute name="src">
              <xsl:value-of select="/PlanReport/ImageFiles/ImageFile[IsocenterNumber=$num and @Direction='X']/FilePath"/>
            </xsl:attribute>
          </img>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
