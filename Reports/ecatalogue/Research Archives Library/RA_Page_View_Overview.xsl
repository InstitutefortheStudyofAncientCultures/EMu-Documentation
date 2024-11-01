<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:emu="http://kesoftware.com/emu">
    <xsl:output method="html" encoding="ISO-8859-1"/>

    <xsl:template match="/">
    <html>
        <head>
            <title>Research Archives Page View 1</title>
        </head>

        <body bgcolor="#EBECFo">
            <b>Type: </b> <xsl:value-of select="/table/tuple/atom[@name='BibType']"/><br/>
            <b>Call Number: </b> <xsl:value-of select="/table/tuple/atom[@name='BibCallNumber']"/><br/>
            <b>Title: </b> <xsl:value-of select="/table/tuple/atom[@name='BibTitle']"/><br/>
            <b>Subtitle: </b> <xsl:value-of select="table/tuple/atom[@name='BibSubTitle']"/><br/>
            
            <!-- Loop through Author Names -->
            
            <xsl:for-each select="/table/tuple/table/tuple">
                <xsl:if test="count(atom[@name='NamCitedName'][normalize-space()]) > 0">
                    <b>Author Names: </b> <xsl:value-of select="atom[@name='NamCitedName']"/><br/>
                </xsl:if>
            </xsl:for-each>   
            
            <!-- Loop through Parent Titles -->

            <xsl:for-each select="/table/tuple/table/tuple">
                <xsl:if test="count(atom[@name='ParentTitle'][normalize-space()]) > 0">
                    <b>Parent Title: </b> <xsl:value-of select="atom[@name='ParentTitle']"/><br/>
                </xsl:if>    
            </xsl:for-each>
            
            <b>Publisher: </b> <xsl:value-of select="/table/tuple/tuple/atom[@name='NamOrganisation']"/><br/>
            <b>Parent Date: </b> <xsl:value-of select="/table/tuple/table/tuple/atom[@name='ParentDate']"/><br/>
            <b>Date: </b> <xsl:value-of select="/table/tuple/atom[@name='BibPublicationDate']"/><br/>
            <b>Pages: </b> <xsl:value-of select="/table/tuple/atom[@name='BibPageNumber']"/><br/>
            <b>Current Location: </b> <xsl:value-of select="/table/tuple/tuple/atom[@name='CurrentLocation']"/><br/>
            <b>Permanent Location: </b> <xsl:value-of select="/table/tuple/tuple/atom[@name='PermanentLocation']"/><br/>
            
            <!-- Loop through Note Kinds -->

            <xsl:for-each select="/table/tuple/table/tuple">
                <xsl:if test="count(atom[@name='NteKind'][normalize-space()]) > 0">
                    <b>Note Kind: </b> <xsl:value-of select="atom[@name='NteKind']"/><br/>
                </xsl:if>
            </xsl:for-each>

           <!-- Loop through note dates -->

            <xsl:for-each select="/table/tuple/table/tuple">
                <xsl:if test="count(atom[@name='NteDate'][normalize-space()]) > 0">
                    <b>Note Date: </b> <xsl:value-of select="atom[@name='NteDate']"/><br/>
                </xsl:if>
            </xsl:for-each>

        </body>
    </html>
    </xsl:template>
</xsl:stylesheet>