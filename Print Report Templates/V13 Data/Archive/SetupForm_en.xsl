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
        Setup Form for '<xsl:value-of select="/PlanReport/PatientName"/>', Plan '<xsl:value-of select="/PlanReport/PlanName"/>'
      </title>
      <body>
        <h1>Setup Form</h1>

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

        <h2>Setup and Validation Procedure</h2>
        <table>
          <tr>
            <td>
              <input type="checkbox"/>
            </td>
            <td class="indented">
              Collimator rotation set to Home position. <!-- 180&#xb0; -->
              <!-- Collimator rotation set to 180&#xb0;. -->
            </td>
          </tr>
          <tr>
            <td>
              <input type="checkbox"/>
            </td>
            <td class="indented">
              Field size set to 50 mm &#215; 50 mm.
            </td>
          </tr>
          <tr>
            <td>
              <input type="checkbox"/>
            </td>
            <td class="indented">
              Collision check performed.
              <!-- Collision avoidance connected. -->
            </td>
          </tr>
          <!--
          <tr>
            <td>
              <input type="checkbox"/>
            </td>
            <td class="indented">
              Patient wrist band ID checked prior to treatment.
            </td>
          </tr>
          <tr>
            <td/>
            <td/>
          </tr>
          -->
        </table>

        <!-- 
        <h4 class="indented">If applicable</h4>
        <table class="indented">
          <tr>
            <td>
              <input type="checkbox"/>
            </td>
            <td class="indented">
              Ram isolation turned off.
            </td>
          </tr>
          <tr>
            <td>
              <input type="checkbox"/>
            </td>
            <td class="indented">
              Couch top locked in x and y directions.
            </td>
          </tr>
          <tr>
            <td/>
            <td/>
          </tr>
        </table>
        -->

        <h4>Winston-Lutz Test</h4>
        <!-- <h4>Film shots</h4> -->
        <p>
          All angles are given using <xsl:value-of select="/PlanReport/Scale"/>&#160;scale.
        </p>

        <table>
          <tr class="emphasize">
            <th/>
            <th class="right" width="60px">Gantry</th>
            <th class="right" width="60px">Couch</th>
            <th/>
          </tr>
          <xsl:for-each select="/PlanReport/WinstonLutzTest/Angle">
            <tr>
              <td>
                <input type="checkbox"/>
              </td>
              <td class="fixed right" width="60px">
                <xsl:value-of select="format-number(GantryAngle, '##0.#')"/>
                <xsl:value-of select="GantryAngle/@Unit"/>
              </td>
              <td class="fixed right" width="60px">
                <xsl:value-of select="format-number(CouchAngle, '##0.#')"/>
                <xsl:value-of select="CouchAngle/@Unit"/>
              </td>
              <td/>
            </tr>
          </xsl:for-each>
          <tr>
            <td>
              <input type="checkbox"/>
            </td>
            <td colspan="3" class="indented">
              <!-- Visual approval of test film. -->
              Winston-Lutz test approved.
            </td>
          </tr>
          <tr>
            <td>
              <input type="checkbox"/>
            </td>
            <td colspan="3" class="indented">
              <!-- Verification of alignment procedure completed. -->
              Camera calibration performed.
            </td>
          </tr>
          <tr>
            <td/>
            <td/>
          </tr>
        </table>

        <!-- 
        <h4 class="indented">If applicable</h4>
        <table class="indented">
          <tr>
            <td>
              <input type="checkbox"/>
            </td>
            <td class="indented">
              Couch mount locks tightened.
            </td>
          </tr>
          <tr>
            <td>
              <input type="checkbox"/>
            </td>
            <td class="indented">
              Target positioner removed.
            </td>
          </tr>
        </table>
        -->
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
