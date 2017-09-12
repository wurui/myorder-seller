<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:oxm="https://www.openxsl.com">
    <xsl:template match="/root" name="wurui.myorder-seller">
        <xsl:param name="sendurl" oxm:comment="发货页面url"/>
        <!-- className 'J_OXMod' required  -->
        <div class="J_OXMod oxmod-myorder-seller" ox-mod="myorder-seller" data-sendurl="{$sendurl}">
            <table class="myorder" cellpadding="0" cellspacing="0">
                <thead>
                    <tr>
                        <th width="50%">商品信息</th>
                        <th>买家信息</th>
                        <th>时间和金额</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="data/orders/i">
                        <tr>
                            <td class="tradeno" colspan="2">
                                <nobr class="order_id"><xsl:value-of select="_id"/></nobr>
                                <br/>
                                <xsl:value-of select="time"/>
                            </td>
                            <td class="time" align="right">
                                <button class="J_op bt-op bt-op-{status}" data-tradeno="{tradeno}" data-status="{status}" type="button"></button>
                            </td>
                        </tr>
                        <tr>
                            <td class="title"><xsl:value-of select="title"/></td>
                            <td class="buyer">
                                &#215;<xsl:value-of select="totalcount"/>
                                <br/>
                                <nobr class="uid"><xsl:value-of select="uid"/></nobr>
                            </td>
                            <td class="last">
                                <em class="price">&#165;<xsl:value-of select="totalfee"/></em>
                                <br/>
                                <em class="status status-{status}"></em>
                            </td>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
        </div>
    </xsl:template>
</xsl:stylesheet>
