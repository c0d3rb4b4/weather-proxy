<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output omit-xml-declaration="yes" indent="yes" />
	<xsl:strip-space elements="*" />

	<xsl:template match="node()|@*">
		<xsl:copy>
			<xsl:apply-templates select="node()|@*" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="/current/temperature/@unit">
		<xsl:attribute name="value">
        <xsl:choose>
            <xsl:when test=". = 'kelvin'"><xsl:value-of
			select="number(/current/temperature/@value) - 273.15" /></xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="." />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:attribute>
		<xsl:attribute name="min">
        <xsl:choose>
            <xsl:when test=". = 'kelvin'"><xsl:value-of
			select="number(/current/temperature/@min) - 273.15" /></xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="." />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:attribute>
		<xsl:attribute name="max">
        <xsl:choose>
            <xsl:when test=". = 'kelvin'"><xsl:value-of
			select="number(/current/temperature/@max) - 273.15" /></xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="." />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:attribute>
		<xsl:attribute name="unit">
        <xsl:choose>
            <xsl:when test=". = 'kelvin'">celsius</xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="." />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:attribute>
	</xsl:template>

</xsl:stylesheet>