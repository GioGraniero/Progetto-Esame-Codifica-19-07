<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml" version="1.0">

    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

        <xsl:template match="/"> <!--Radice-->
            <html>
                <head>
                    <title>
                        <xsl:value-of select="//tei:msIdentifier//tei:idno"/> Digital Edition
                    </title>
                    <link href="stile.css" rel="stylesheet" type="text/css"/>
                </head>
                <body>
                    <div class="Home">
                        <div class="Intro">
                        <h1>Digital Edition LL1.13.I</h1>
                        <h2>Vincenzo Bellini</h2>
                        <img id="Bellinimg" src="bellini.jpg" alt="Vincenzo Bellini"/>
                        <p class="link">
                            <a href="#Retroimg" id="link1">Retro Lettera</a>
                            &#9660;
                            <a href="#Fronteimg" id="link2">Fronte Lettera</a>
                        </p>
                        <h2>Informazioni sul documento</h2>
                        </div>
                        <div class="docdesc">
                            <xsl:apply-templates select="//tei:titleStmt/tei:title"/>
                            <xsl:apply-templates select="//tei:titleStmt/tei:author"/>
                            <xsl:apply-templates select="//tei:msContents"/>
                            <xsl:apply-templates select="//tei:edition"/>
                            <xsl:apply-templates select="//tei:titleStmt/tei:respStmt"/>
                            <xsl:apply-templates select="//tei:physDesc"/>
                            <xsl:apply-templates select="//tei:msDesc"/>
                            <xsl:apply-templates select="//tei:additional"/>
                        </div>

                        <!-- Retro Lettera -->
                        <div class="Retro">
                            <h2>Retro LL1.13.I</h2>
                            <img id="Retroimg" src="LL1.13.I_0001.jpg" alt="Retro Lettera"/>
                            <xsl:apply-templates select="//tei:group/tei:text[@n='parte1']"/>
                            <xsl:apply-templates select="//tei:titleStmt/tei:respStmt"/>
                        </div>
                        <!--Fronte Lettera-->
                        <div class="Front">
                            <h2>Fronte LL1.13.I</h2>
                            <img id="Fronteimg" src="LL1.13.I_0002.jpg" alt="Fronte Lettera"/>
                            <xsl:apply-templates select="//tei:group/tei:text[@n='parte2']"/>
                            <xsl:apply-templates select="//tei:titleStmt/tei:respStmt"/>
                        </div>
                    </div>
                    <footer>
                        <h2>Note e Bibliografia</h2>
                            <xsl:apply-templates select="//tei:back"/>
                        <div class="barrafinale">
                            <p>Progettato da Giovanni Graniero 560739 per l'esame di Codifica di Testi <a href="mailto:g.graniero@studenti.unipi.it">g.graniero@studenti.unipi.it</a></p>
                        </div>
                    </footer>
                </body>
            </html>
        </xsl:template>

    <!-- Descrizione lettera-->
        <xsl:template match="tei:msContents">
            <b>Destinatario:</b>
            <p>
                <xsl:value-of select="//tei:msItem[@n='1']/tei:note"/>
            </p>
        </xsl:template>

    <!-- Descrizione manoscritto fisico-->
        <xsl:template match="tei:physDesc">
            <b>Formato del documento:</b>
            <p>
                <xsl:value-of select="//tei:measure"/> folio, millimetri:
                <xsl:value-of select="//tei:height"/> x
                <xsl:value-of select="//tei:width"/>
            </p>
            <b>Descrizione del documento:</b>
            <br/>
            <p>
            <xsl:value-of select="//tei:support/tei:p[@n='1']"/>
            <xsl:value-of select="//tei:support/tei:p[@n='2']"/>
            </p>
            <p>
                <xsl:value-of select="//tei:physDesc//tei:foliation"/>
            </p>
            <b>Timbri: </b>
            <p>
                <xsl:value-of select="//tei:support//tei:stamp"/>
            </p>
            <b>Informazioni scrittura e annotazioni:</b>
            <br/>
            <p>
                <xsl:for-each select="//tei:handNote">
                        <xsl:value-of select="./tei:p"/>
                </xsl:for-each>
            </p>
        </xsl:template>

        <xsl:template match="tei:msDesc">
                <b>Ubicazione fisica: </b>
                <p>
                <xsl:value-of select="//tei:repository"/>
                </p>
            <p>
                <xsl:value-of select="//tei:altIdentifier/tei:idno"/>
            </p>
            <b>Lingua:</b>
                <p>
                <xsl:value-of select="//tei:textLang"/>
                </p>
        </xsl:template>

        <xsl:template match="tei:additional">
            <b>Ulteriori Informazioni:</b>
                <p>
                <xsl:value-of select="//tei:adminInfo/tei:note"/>
                </p>
            <br/>
        </xsl:template>

        <!--Info dettagliate lettera-->
        <xsl:template match="tei:titleStmt/tei:title">
                <b>Titolo:</b>
                <p>
                <xsl:apply-templates/>
                </p>
        </xsl:template>

        <xsl:template match="tei:titleStmt/tei:author">
                <b>Autore:</b>
                <p>
                <xsl:apply-templates/>
                </p>
        </xsl:template>

        <xsl:template match="tei:edition">
                <b>Edizione:</b>
                <p>
                <xsl:apply-templates/>
                </p>
        </xsl:template>

        <xsl:template match="tei:titleStmt/tei:respStmt">
                <b>Trascrizione: </b>
                <p>
                <xsl:apply-templates/>
                </p>
                <b>Conversione:</b>
                <p>
                <xsl:value-of select="//tei:editionStmt/tei:respStmt"/>
                </p>
        </xsl:template>
        <!-- Body e Testi delle lettera -->
        <xsl:template match="tei:body">
            <div class="testo">
                <p class="testolettera">
                    <xsl:apply-templates/>
                </p>
            </div>
        </xsl:template>

        <xsl:template match="//tei:group/text[@n='parte1']">
            <div class="testo">
                <p class="testolettera">
                    <xsl:apply-templates/>
                </p>
            </div>
        </xsl:template>

        <xsl:template match="//tei:group/text[@n='parte2']">
            <div class="testo">
                <p class="testolettera">
                    <xsl:apply-templates/>
                </p>
            </div>
        </xsl:template>

        <xsl:template match="tei:lb">
            <xsl:apply-templates/>
                <br/>
        </xsl:template>

        <xsl:template match="tei:del">
            <del>
                <xsl:apply-templates/>
            </del>
        </xsl:template>

        <xsl:template match="tei:hi[@rend='sup']">
            <sup>
                <xsl:apply-templates/>
            </sup>
        </xsl:template>

        <xsl:template match="tei:ex">
            &lt;
                <xsl:apply-templates/>
            &gt;
        </xsl:template>

        <xsl:template match="tei:expan">
            [
                <xsl:apply-templates/>
            ]
        </xsl:template>

        <xsl:template match="tei:fw">
            <font color="blue">
                <xsl:apply-templates/>
            </font>
        </xsl:template>

        <xsl:template match="tei:add[@place='supralinear']">
            <sup>
                <xsl:apply-templates/>
            </sup>
        </xsl:template>
        <!-- Back della lettera -->
        <xsl:template match="tei:back">
            <div id="back">
                <b>Note: </b>
                    <p>
                    <xsl:apply-templates/>
                    </p>
            </div>
        </xsl:template>

        <xsl:template match="tei:note">
                <xsl:apply-templates/>
        </xsl:template>

        <xsl:template match="tei:back//tei:head">
            <br/>
            <br/>
            <b>
                <xsl:apply-templates/>
            </b>
        </xsl:template>

        <xsl:template match="tei:back//tei:bibl//tei:bibl">
            <br/>
            <br/>
                <xsl:apply-templates/>
        </xsl:template>

</xsl:stylesheet>