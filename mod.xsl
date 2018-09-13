<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:oxm="https://www.openxsl.com">
    <xsl:template match="/root" name="wurui.myorder-seller">
        
        <!-- className 'J_OXMod' required  -->
        <div class="J_OXMod oxmod-myorder-seller" ox-mod="myorder-seller">
            <xsl:variable name="dsid" select="substring(data/orders/attribute::ADAPTERID,2)"/>

            <xsl:if test="count(data/orders/i) = 0">
                <div class="nodata">暂无订单</div>
            </xsl:if>
            <xsl:if test="count(data/orders/i) &gt; 0">
                <table class="myorder" cellpadding="0" cellspacing="0">
                    <thead>
                        <tr>
                            <th width="50%">订单商品</th>
                            <th>数量/买家</th>
                            <th>状态/金额</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="data/orders/i">
                            <xsl:variable name="status-desc">
                                <xsl:choose>
                                    <xsl:when test="actions/refund/success">退款成功</xsl:when>
                                    <xsl:when test="actions/refund/complete/fmt_cn">退款完成</xsl:when>
                                    <xsl:when test="actions/refund/accept/fmt_cn">退款处理中</xsl:when>
                                    <xsl:when test="actions/refund/apply/fmt_cn">退款中</xsl:when>
                                    <xsl:when test="actions/close/fmt_cn">订单已关闭</xsl:when>
                                    <xsl:when test="actions/complete/fmt_cn">订单已完成</xsl:when>
                                    <xsl:when test="actions/deliver/time/fmt_cn">已发货</xsl:when>
                                    <xsl:when test="actions/accept/fmt_cn">商家已接单</xsl:when>
                                    <xsl:when test="actions/pay/time/fmt_cn">已付款</xsl:when>
                                    <xsl:when test="time/fmt_cn">待支付</xsl:when>
                                    <xsl:otherwise></xsl:otherwise>
                                </xsl:choose>
                            </xsl:variable>
                            <tr>
                                <td class="tradeno">
                                    <nobr class="order_id"><xsl:value-of select="_id"/></nobr>
                                    
                                </td>
                                <td class="time" colspan="2" align="right">
                                   <xsl:value-of select="time/fmt_cn"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="title">
                                    <a href="{LINK/detail}"><xsl:value-of select="title"/></a></td>
                                <td class="buyer">
                                    <xsl:value-of select="totalcount"/>
                                    <br/>
                                    <nobr class="uid"><xsl:value-of select="buyer"/></nobr>
                                </td>
                                <td class="last">
                                    <em class="price">&#165;<xsl:value-of select="totalfee"/></em>
                                    <br/>
                                    <em class="status-desc" data-id="{_id}">
                                        <xsl:choose>
                                            <xsl:when test="$status-desc = '退款中'">
                                                <button data-action="refund">确认退款</button>
                                            </xsl:when>
                                            <xsl:when test="$status-desc = '已付款'">
                                                <button data-action="accept">确认接单</button>
                                            </xsl:when>
                                            <xsl:otherwise><xsl:value-of select="$status-desc"/></xsl:otherwise>
                                        </xsl:choose>
                                        
                                    </em>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </xsl:if>
        </div>
    </xsl:template>
</xsl:stylesheet>
