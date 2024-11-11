<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:emu="http://kesoftware.com/emu">
    <xsl:output method="html" encoding="ISO-8859-1"/>

    <xsl:template match="/">
    
    <html>
        <head>
            <title>Parties Record Overview</title>
        </head>

        <body bgcolor="#EBECFo">

        <header><h1><b>PARTIES RECORD OVERVIEW</b></h1></header>

            <b>IRN: </b> <xsl:value-of select="/table/tuple/atom[@name='irn']"/><br/>
            <b>Last: </b> <xsl:value-of select="/table/tuple/atom[@name='NamLast']"/><br/>
            <b>First: </b> <xsl:value-of select="/table/tuple/atom[@name='NamFirst']"/><br/>
            <b>Middle: </b> <xsl:value-of select="/table/tuple/atom[@name='NamMiddle']"/><br/>
            <b>Date of Birth: </b> <xsl:value-of select="/table/tuple/atom[@name='BioBirthDate']"/><br/>
            <b>Date of Death: </b> <xsl:value-of select="/table/tuple/atom[@name='BioDeathDate']"/><br/>
            
            <!-- Separate VIAF Link -->
            <xsl:for-each select="table/tuple/table[@name='MulMultiMediaRef_tab']/tuple">
                <xsl:if test="starts-with(atom[@name='MulIdentifier'], 'https://viaf.org/')">
                    <b>VIAF Link: </b> 
                    <a href="{atom[@name='MulIdentifier']}" target="_blank">
                        <xsl:value-of select="atom[@name='MulIdentifier']"/>
                    </a>
                    <br/>
                </xsl:if>
            </xsl:for-each>

            <!-- Multimedia Section -->
            <b>Multimedia:</b><br/>
            <div id="images">
                <table>
                    <tr height="115px">
                        <xsl:choose>
                            <!-- Check if there are multimedia entries -->
                            <xsl:when test="count(table/tuple/table[@name='MulMultiMediaRef_tab']/tuple) > 0">
                                <xsl:for-each select="table/tuple/table[@name='MulMultiMediaRef_tab']/tuple">
                                    <xsl:choose>
                                        <!-- Skip PDFs -->
                                        <xsl:when test="contains(atom[@name='MulIdentifier'], '.pdf')" />
                                        
                                        <!-- Display 'No Image' if MulIdentifier is missing or empty -->
                                        <xsl:when test="not(atom[@name='MulIdentifier']) or atom[@name='MulIdentifier'] = ''">
                                            <td class="value" width="120px" vertical-align="bottom">No Image</td>
                                        </xsl:when>
                                        
                                        <!-- Otherwise, display the image or link -->
                                        <xsl:otherwise>
                                            <td class="value" width="125px">
                                                <!-- Display image if MulIdentifier contains image extensions -->
                                                <xsl:if test="contains(atom[@name='MulIdentifier'], '.jpg') or contains(atom[@name='MulIdentifier'], '.png')">
                                                    <img class="multimediaimage" height="200px">
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="concat('file:///', translate(atom[@name='Multimedia'], '\', '/'))" />
                                                        </xsl:attribute>
                                                        <xsl:attribute name="alt">
                                                            <xsl:value-of select="atom[@name='MulIdentifier']"/>
                                                        </xsl:attribute>
                                                    </img>
                                                </xsl:if>
                                                
                                                <!-- Display as a link if MulIdentifier starts with http (but not viaf.org) -->
                                                <xsl:if test="starts-with(atom[@name='MulIdentifier'], 'https') and not(starts-with(atom[@name='MulIdentifier'], 'https://viaf.org/'))">
                                                    <a href="{atom[@name='MulIdentifier']}" target="_blank">
                                                        <xsl:value-of select="atom[@name='MulIdentifier']"/>
                                                    </a>
                                                </xsl:if>
                                            </td>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:for-each>
                            </xsl:when>
                            
                            <!-- Display 'No Images' if there are no multimedia entries -->
                            <xsl:otherwise>
                                <td class="value" width="120px" vertical-align="bottom">No Images</td>
                            </xsl:otherwise>
                        </xsl:choose>
                    </tr>
                </table>
            </div>

        </body>
    </html>
    
    </xsl:template>
</xsl:stylesheet>
