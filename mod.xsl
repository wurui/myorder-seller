<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:oxm="https://www.openxsl.com">
    <xsl:template match="/root" name="wurui.myorder-seller">
        <!-- className 'J_OXMod' required  -->
        <div class="J_OXMod oxmod-myorder-seller" ox-mod="myorder-seller">
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
                            <td class="tradeno">
                                订单号:<xsl:value-of select="tradeno"/>
                            </td>
                            <td class="time" colspan="2" align="right">
                                <button class="J_op bt-op bt-op-{status}" data-status="{status}" type="button"></button>
                            </td>
                        </tr>
                        <tr>
                            <td class="title"><xsl:value-of select="title"/></td>
                            <td class="buyer">
                                &#215;<xsl:value-of select="totalcount"/>
                                <br/>
                                <xsl:value-of select="seller"/>
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
