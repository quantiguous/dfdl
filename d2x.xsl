<xsl:stylesheet version="1.0" xmlns:ibmSchExtn="http://www.ibm.com/schema/extensions" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:dfdl="http://www.ogf.org/dfdl/dfdl-1.0/" xmlns:ibmDfdlExtn="http://www.ibm.com/dfdl/extensions" xmlns:xsd="http://www.w3.org/2001/XMLSchema">

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="@dfdl:*"/>
  <xsl:template match="@ibmDfdlExtn:*"/>
  <xsl:template match="@ibmSchExtn:*"/>
  <xsl:template match="xsd:appinfo"/>

</xsl:stylesheet>
