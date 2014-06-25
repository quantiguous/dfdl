<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format"
xmlns="http://www.w3.org/1999/xhtml"
xmlns:html="http://www.w3.org/1999/xhtml"
xmlns:xsd="http://www.w3.org/2001/XMLSchema"
xmlns:csv="http://www.ibm.com/dfdl/CommaSeparatedFormat" xmlns:dfdl="http://www.ogf.org/dfdl/dfdl-1.0/" xmlns:ibmDfdlExtn="http://www.ibm.com/dfdl/extensions" xmlns:ibmSchExtn="http://www.ibm.com/schema/extensions"
exclude-result-prefixes="xsd ibmDfdlExtn ibmSchExtn dfdl csv html fo">
	<xsl:output method="html" standalone="yes" indent="yes" omit-xml-declaration="yes"/>
	<xsl:template match="/xsd:schema">
		<html>
			<head>
				<title>DFDL Document Generator by Quantiguous Solutions</title>
				<style>
					table {
						font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
						width: 100%;
						border-collapse: collapse;
					}
					

					table td, table th, table caption {
						font-size: 1em;
						border: 1px solid #98bf21;
						padding: 3px 7px 2px 7px;
					}
					
					table th {
						font-size: 1.1em;
						text-align: left;
						padding-top: 5px;
						padding-bottom: 4px;
						background-color: #A7C942;
						color: #ffffff;
					}
					
					table tr.alt td {
						color: #000000;
						background-color: #EAF2D3;
					}
				</style>
			</head>
			<body>
				<h3><xsl:value-of select="xsd:element[@ibmSchExtn:docRoot='true']/@name"/></h3>
				<hr/>
				<xsl:apply-templates/>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="xsd:sequence">
		<table>
			<caption>Separator <xsl:value-of select="@dfdl:separator"/></caption>
			<thead>
				<tr>
          <th>Mandatory</th>
					<th>Name</th>
					<th>Type</th>
					<th>MinLength/MinValue</th>
					<th>MaxLength/MaxValue</th>
					<th>Enumeration</th>
					<th>Pattern</th>
					<th>Default Value</th>
					<th>Sample Value</th>
					<th>Notes</th>
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="xsd:element">
					<tr>
            <td>
              <xsl:choose>
                <xsl:when test="@minOccurs = 0">
                </xsl:when>
                <xsl:otherwise>&#10003;</xsl:otherwise>
              </xsl:choose>
            </td>
						<td><xsl:value-of select="@name"/></td>
						<td><xsl:value-of select="@type"/><xsl:value-of select="xsd:simpleType/xsd:restriction/@base"/></td>
						<td>
							<xsl:value-of select="xsd:simpleType/xsd:restriction/xsd:minLength/@value"/>
							<xsl:if test="xsd:simpleType/xsd:restriction/xsd:minInclusive"><xsl:value-of select="concat(xsd:simpleType/xsd:restriction/xsd:minInclusive/@value,'(inclusive)')"/></xsl:if>
							<xsl:if test="xsd:simpleType/xsd:restriction/xsd:minExclusive"><xsl:value-of select="concat(xsd:simpleType/xsd:restriction/xsd:minExclusive/@value,'(exclusive)')"/></xsl:if>
						</td>
						<td>
							<xsl:value-of select="xsd:simpleType/xsd:restriction/xsd:maxLength/@value"/>
							<xsl:if test="xsd:simpleType/xsd:restriction/xsd:maxInclusive"><xsl:value-of select="concat(xsd:simpleType/xsd:restriction/xsd:maxInclusive/@value,'(inclusive)')"/></xsl:if>
							<xsl:if test="xsd:simpleType/xsd:restriction/xsd:maxExclusive"><xsl:value-of select="concat(xsd:simpleType/xsd:restriction/xsd:maxExclusive/@value,'(exclusive)')"/></xsl:if>
						</td>
						<td>
							<xsl:for-each select="xsd:simpleType/xsd:restriction/xsd:enumeration">
								<xsl:value-of select="concat(@value,',')"/>
							</xsl:for-each>
							<xsl:if test="@dfdl:textBooleanFalseRep">
								<xsl:value-of select="concat('false:', @dfdl:textBooleanFalseRep, ',')"/>
							</xsl:if>
							<xsl:if test="@dfdl:textBooleanTrueRep">
								<xsl:value-of select="concat('true:', @dfdl:textBooleanTrueRep)"/>
							</xsl:if>
						</td>
						<td>
							<xsl:value-of select="@dfdl:textNumberPattern"/>
							<xsl:value-of select="@dfdl:calendarPattern"/>
						</td>
						<td><xsl:value-of select="@ibmDfdlExtn:defaultValue"/></td>						
						<td><xsl:value-of select="@ibmDfdlExtn:sampleValue"/></td>
						<td><xsl:value-of select="xsd:annotation"/></td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
		<br/>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="text()"/>
</xsl:stylesheet>
