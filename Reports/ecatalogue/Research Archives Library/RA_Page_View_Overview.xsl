<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:emu="http://kesoftware.com/emu">
    <xsl:output method="html" encoding="ISO-8859-1"/>

    <xsl:template match="/">
    <html>
        <head>
            <title>Research Archives Record Overview Page View</title>
        </head>

        <body bgcolor="#EBECFo">

        <header><h1><b>RESEARCH ARCHIVES RECORD OVERVIEW</b></h1></header>

            <b>IRN: </b> <xsl:value-of select="/table/tuple/atom[@name='RecordIRN']"/><br/>
            <b>Type: </b> <xsl:value-of select="/table/tuple/atom[@name='BibType']"/><br/>
            <b>Call Number: </b> <xsl:value-of select="/table/tuple/atom[@name='BibCallNumber']"/><br/>
            <b>Title: </b>
            <xsl:choose>
                <!-- If BibType is "Monograph", set BibTitle in italics -->
                <xsl:when test="/table/tuple/atom[@name='BibType'] = 'Monograph'">
                    <i><xsl:value-of select="/table/tuple/atom[@name='BibTitle']"/></i><br/>
                </xsl:when>

                <!-- If BibType is "Monograph Section", set BibTitle in quotes -->
                <xsl:when test="/table/tuple/atom[@name='BibType'] = 'Monograph Section'">
                    "<xsl:value-of select="/table/tuple/atom[@name='BibTitle']"/>"
                    <br/>
                </xsl:when>

                <!-- If BibType is "Series", set BibTitle in italics -->
                <xsl:when test="/table/tuple/atom[@name='BibType'] = 'Series'">
                    <i><xsl:value-of select="/table/tuple/atom[@name='BibTitle']"/></i><br/>
                </xsl:when>

                <!-- If BibType is "Series Volume", set BibTitle in italics -->
                <xsl:when test="/table/tuple/atom[@name='BibType'] = 'Series Volume'">
                    <i><xsl:value-of select="/table/tuple/atom[@name='BibTitle']"/></i><br/>
                </xsl:when>

                <!-- If BibType is "Series Volume Section", set BibTitle in quotes -->
                <xsl:when test="/table/tuple/atom[@name='BibType'] = 'Series Volume Section'">
                    "<xsl:value-of select="/table/tuple/atom[@name='BibTitle']"/>"
                    <br/>
                </xsl:when>

                <!-- If BibType is "Thesis", set BibTitle in italics -->
                <xsl:when test="/table/tuple/atom[@name='BibType'] = 'Thesis'">
                    <i><xsl:value-of select="/table/tuple/atom[@name='BibTitle']"/></i><br/>
                </xsl:when>
                
                <!-- If BibType is "Journal", set BibTitle in quotes -->
                <xsl:when test="/table/tuple/atom[@name='BibType'] = 'Journal'">
                   <i><xsl:value-of select="/table/tuple/atom[@name='BibTitle']"/></i><br/>
                    <br/>
                </xsl:when>

                <!-- If BibType is "Journal Volume", set BibTitle in quotes -->
                <xsl:when test="/table/tuple/atom[@name='BibType'] = 'Journal Volume'">
                   <i><xsl:value-of select="/table/tuple/atom[@name='BibTitle']"/></i><br/>
                    <br/>
                </xsl:when>

                <!-- If BibType is "Journal Volume Article", set BibTitle in quotes -->
                <xsl:when test="/table/tuple/atom[@name='BibType'] = 'Journal Volume Article'">
                    "<xsl:value-of select="/table/tuple/atom[@name='BibTitle']"/>"
                    <br/>
                </xsl:when>
                   
                <!-- Default case for any other BibType -->
                <xsl:otherwise>
                    <xsl:value-of select="/table/tuple/atom[@name='BibTitle']"/><br/>
                </xsl:otherwise>
            </xsl:choose>

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
            
            <b>Edition: </b> <xsl:value-of select="/table/tuple/atom[@name='BibEdition']"/><br/>
            <b>Publisher: </b> <xsl:value-of select="/table/tuple/tuple/atom[@name='NamOrganisation']"/><br/>
            <b>Publication City: </b> <xsl:value-of select="/table/tuple/tuple/atom[@name='BibPublicationCity']"/><br/>
            <b>Parent Date: </b> <xsl:value-of select="/table/tuple/table/tuple/atom[@name='ParentDate']"/><br/>
            <b>Date: </b> <xsl:value-of select="/table/tuple/atom[@name='BibPublicationDate']"/><br/>
            <b>Pages: </b> <xsl:value-of select="/table/tuple/atom[@name='BibPageNumber']"/><br/>
            <b>Extension: </b> <xsl:value-of select="/table/tuple/atom[@name='BibExtension']"/><br/>
            
            <!-- Loop through Languages -->

            <xsl:for-each select="/table/tuple/table/tuple">
                <xsl:if test="count(atom[@name='BibLanguage'][normalize-space()]) > 0">
                    <b>Language: </b> <xsl:value-of select="atom[@name='BibLanguage']"/><br/>
                </xsl:if>
            </xsl:for-each>

        <header><h2><b>LOCATIONS</b></h2></header>
        <p></p>

            <b>Current Location: </b> <xsl:value-of select="/table/tuple/tuple/atom[@name='CurrentLocation']"/><br/>
            <b>Permanent Location: </b> <xsl:value-of select="/table/tuple/tuple/atom[@name='PermanentLocation']"/><br/>
            
        <header><h2><b>NOTES</b></h2></header>
        <p></p>

            <!-- Loop through Notes -->

            <xsl:for-each select="/table/tuple/table/tuple">
                <xsl:if test="count(atom[@name='NteNotes'][normalize-space()]) > 0">
                    <b>Note: </b> <xsl:value-of select="atom[@name='NteNotes']"/><br/>
                </xsl:if>
            </xsl:for-each>

            <!-- Loop through Note Kinds -->

            <xsl:for-each select="/table/tuple/table/tuple">
                <xsl:if test="count(atom[@name='NteKind'][normalize-space()]) > 0">
                    <b>Note Kind: </b> <xsl:value-of select="atom[@name='NteKind']"/><br/>
                </xsl:if>
            </xsl:for-each>

           <!-- Loop through Note Dates -->

            <xsl:for-each select="/table/tuple/table/tuple">
                <xsl:if test="count(atom[@name='NteDate'][normalize-space()]) > 0">
                    <b>Note Date: </b> <xsl:value-of select="atom[@name='NteDate']"/><br/>
                </xsl:if>
            </xsl:for-each>

        <header><h2><b>ACCESSION</b></h2></header>
        <p></p>

            <b>Accession IRN: </b> <xsl:value-of select="/table/tuple/tuple/atom[@name='AccessionIRN']"/><br/>
            <b>Accession Method: </b> <xsl:value-of select="/table/tuple/tuple/atom[@name='AcqAcquisitionMethod']"/><br/>
            <b>Accession Date: </b> <xsl:value-of select="/table/tuple/tuple/atom[@name='AccessionDateReceived']"/><br/>

        <!-- Loop through Donor Names -->

             <xsl:for-each select="/table/tuple/tuple[@name='AccAccessionLotRef']/table[@name='AcqSourceRef_tab']/tuple">
                <xsl:if test="count(atom[@name='DonorName'][normalize-space()]) > 0">
                    <b>Source: </b> <xsl:value-of select="atom[@name='DonorName']"/><br/>
                </xsl:if>
            </xsl:for-each>

        </body>
    </html>
    </xsl:template>
</xsl:stylesheet>
