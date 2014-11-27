<%--
  - Author: GreatKevin, Veve
  - Copyright (C) 2010 - 2014 TopCoder Inc., All Rights Reserved.
  - Version 1.4
  -
  - Version 1.1 (Release Assembly - TC Direct Cockpit Release Two) changes:
  - - Add the checkpoint prize for software contest receipt if exists
  -
  - Version 1.2 (Release Assembly - TC Direct Cockpit Release Five) changes:
  - - Add Launch By information to the JSP page
  -
  - Version 1.3 (Release Assembly - TC Direct Cockpit Release Seven version 1.0)
  - - Show the receipt details in table
  -
  - Version 1.4 (TopCoder Direct - Add Estimation Cost Details to Receipt page )
  - - Add estimated cost table
  -
  - Description: This page fragment renders receipt page content for software contest.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/includes/taglibs.jsp" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<div class="receipt" id="launchContestOut">

    <s:if test="contestReceipt.showReceipt">
                                          <div class="orderReview">

                                            <s:if test="viewData.contestStats.isStudio == true">
                                                <h2 class="sectionHead"><s:if test="contestReceipt.finished == true">Receipt</s:if><s:else>Estimated Cost</s:else></h2>
                                                <div class="overviewBox">
                                                    <table cellspacing="0" cellpadding="0" class="overviewData">
                                                        <tbody><tr>
                                                            <th>Date :</th>
                                                            <td><fmt:formatDate value="<%= new java.util.Date()%>"
                                                                                        pattern="MM/dd/yyyy HH:mm zzz"/></td>
                                                        </tr>
                                                        <tr>
                                                            <th>Competition Type :</th>
                                                            <td>${result.projectHeader.projectCategory.name}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Competition Title :</th>
                                                            <td><s:property value="viewData.contestStats.contest.title"/></td>
                                                        </tr>
                                                        <tr>
                                                            <th>Project :</th>
                                                            <td><s:property value="viewData.contestStats.contest.project.name"/></td>
                                                        </tr>
                                                        <tr>
                                                            <th>Payment Method :</th>
                                                            <td>${viewData.contestStats.paymentReferenceId}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Launch Time :</th>
                                                            <td><fmt:formatDate value="${viewData.contestStats.startTime}" pattern="MM/dd/yyyy HH:mm zzz-05"/></td>
                                                        </tr>
                                                        <tr>
                                                            <th>Launch By :</th>
                                                            <td>
                                                               <s:if test="contestReceipt.contestLauncherId > 0">
                                                                   <link:user userId="${contestReceipt.contestLauncherId}"/>
                                                               </s:if>
                                                               <s:else>
                                                                    n/a
                                                               </s:else>

                                                            </td>
                                                        </tr>
                                                    </tbody></table>
                                                </div>

                                          </div>
                                            <!-- end .orderReview -->
                                                <div class="contestDetails" id="participationMetricsReportsSection">
                                                
                                                    <h2 class="sectionHead">Actual Cost</h2>

                                                    <table class="pipelineStats">
                                                        <thead>
                                                        <tr class="subTheadRow">
                                                            <th class="tableColumn">
                                                                Payment Type
                                                            </th>
                                                            <th class="tableColumn">
                                                                Amount
                                                            </th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>

                                                        <s:iterator value="contestReceipt.entries">
                                                            <tr>
                                                                <td>
                                                                    ${paymentType}
                                                                </td>
                                                                <td>
                                                                    $${paymentAmount}
                                                                </td>
                                                            </tr>
                                                        </s:iterator>

                                                        <tr>
                                                            <td>
                                                                <b>Total</b>
                                                            </td>
                                                            <td>
                                                                <b>
                                                                        $${contestReceipt.totalCost}
                                                                </b>
                                                            </td>
                                                        </tr>

                                                        </tbody>
                                                    </table>

                                                    <h2 class="sectionHead">Estimated Cost</h2>

                                                    <table class="pipelineStats">
                                                        <thead>
                                                        <tr class="subTheadRow">
                                                            <th class="tableColumn">
                                                                Payment Type
                                                            </th>
                                                            <th class="tableColumn">
                                                                Estimated Amount
                                                            </th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>

                                                        <s:if test="contestReceipt.estimation.prizes != null">
                                                            <s:iterator value="contestReceipt.estimation.prizes">
                                                                <s:if test="prizeType.id == 15L">
                                                                    <tr>
                                                                        <td>
                                                                            Winner Prize #<s:property value="place"/>
                                                                        </td>
                                                                        <td>
                                                                            $<s:property value="prizeAmount"/>
                                                                        </td>
                                                                    </tr>
                                                                </s:if>
                                                            </s:iterator>
                                                            <s:iterator value="contestReceipt.estimation.prizes">
                                                                <s:if test="prizeType.id == 14L">
                                                                    <tr>
                                                                        <td>
                                                                            Checkpoint prizes
                                                                        </td>
                                                                        <td>
                                                                            $<s:property value="prizeAmount"/> * <s:property value="numberOfSubmissions"/>
                                                                        </td>
                                                                    </tr>
                                                                </s:if>
                                                            </s:iterator>
                                                        </s:if>


                                                        <s:if test="contestReceipt.estimation.drPoints != null">
                                                            <tr>
                                                                <td>
                                                                    Studio Cup Points
                                                                </td>
                                                                <td>
                                                                    $${contestReceipt.estimation.drPoints}
                                                                </td>
                                                            </tr>
                                                        </s:if>

                                                        <s:if test="contestReceipt.estimation.reliabilityBonus != null">
                                                            <tr>
                                                                <td>
                                                                    Reliability Bonus
                                                                </td>
                                                                <td>
                                                                    $${contestReceipt.estimation.reliabilityBonus}
                                                                </td>
                                                            </tr>
                                                        </s:if>

                                                        <s:if test="contestReceipt.estimation.specReviewCost != null">
                                                            <tr>
                                                                <td>
                                                                    Specification Review Cost
                                                                </td>
                                                                <td>
                                                                    $${contestReceipt.estimation.specReviewCost}
                                                                </td>
                                                            </tr>
                                                        </s:if>

                                                        <s:if test="contestReceipt.estimation.reviewCost != null">
                                                            <tr>
                                                                <td>
                                                                    Review Cost
                                                                </td>
                                                                <td>
                                                                    $${contestReceipt.estimation.reviewCost}
                                                                </td>
                                                            </tr>
                                                        </s:if>

                                                        <s:if test="contestReceipt.estimation.copilotCost != null">
                                                            <tr>
                                                                <td>
                                                                    Copilot Cost
                                                                </td>
                                                                <td>
                                                                    $${contestReceipt.estimation.copilotCost}
                                                                </td>
                                                            </tr>
                                                        </s:if>

                                                        <s:if test="contestReceipt.estimation.adminFee != null">
                                                            <tr>
                                                                <td>
                                                                    Challenge Admin Fee
                                                                </td>
                                                                <td>
                                                                    $${contestReceipt.estimation.adminFee}
                                                                </td>
                                                            </tr>
                                                        </s:if>

                                                        <tr>
                                                            <td>
                                                                <b>Total</b>
                                                            </td>
                                                            <td>
                                                                <b>
                                                                    $${contestReceipt.estimation.total}
                                                                </b>
                                                            </td>
                                                        </tr>

                                                        </tbody>
                                                    </table>
                                                </div>
                                            </s:if>
                                            <s:if test="viewData.contestStats.isStudio == false">
                                                <h2 class="sectionHead"><s:if test="contestReceipt.finished == true">Receipt</s:if><s:else>Estimated Cost</s:else></h2>
                                                 <!-- overviewBox -->
                                                <div class="overviewBox">
                                                    <table cellspacing="0" cellpadding="0" class="overviewData">
                                                        <tbody><tr>
                                                            <th>Date :</th>
                                                            <td><fmt:formatDate value="<%= new java.util.Date()%>"
                                                                                        pattern="MM/dd/yyyy HH:mm zzz"/></td>
                                                        </tr>
                                                        <tr>
                                                            <th>Competition Type :</th>
                                                            <td>${result.projectHeader.projectCategory.name}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Competition Title :</th>
                                                            <td><s:property value="viewData.contestStats.contest.title"/></td>
                                                        </tr>
                                                        <tr>
                                                            <th>Project :</th>
                                                            <td><s:property value="viewData.contestStats.contest.project.name"/></td>
                                                        </tr>
                                                        <tr>
                                                            <th>Payment Method :</th>
                                                            <td>${viewData.contestStats.paymentReferenceId}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Launch Time :</th>
                                                            <td><fmt:formatDate value="${viewData.contestStats.startTime}"
                                                                                        pattern="MM/dd/yyyy HH:mm zzz"/></td>
                                                        </tr>
                                                        <tr>
                                                            <th>Launch By :</th>
                                                            <td>
                                                                <s:if test="contestReceipt.contestLauncherId > 0">
                                                                    <link:user userId="${contestReceipt.contestLauncherId}"/>
                                                                </s:if>
                                                                <s:else>
                                                                    n/a
                                                                </s:else>

                                                            </td>
                                                        </tr>
                                                    </tbody></table>
                                                </div>
                                                <!-- end .overviewBox -->
                                                
                                            </div>
                                            <!-- end .orderReview -->
                                                <div class="contestDetails" id="participationMetricsReportsSection" cellspacing="0" cellpadding="0">


                                                    <h2 class="sectionHead">Actual Cost</h2>
                                                    <table class="pipelineStats">
                                                        <thead>
                                                        <tr class="subTheadRow">
                                                            <th class="tableColumn">
                                                                Payment Type
                                                            </th>
                                                            <th class="tableColumn">
                                                                Amount
                                                            </th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>

                                                        <s:iterator value="contestReceipt.entries">
                                                            <tr>
                                                                <td>
                                                                        ${paymentType}
                                                                </td>
                                                                <td>
                                                                    $${paymentAmount}
                                                                </td>
                                                            </tr>
                                                        </s:iterator>

                                                        <tr>
                                                            <td>
                                                                <b>Total</b>
                                                            </td>
                                                            <td>
                                                                <b>
                                                                        $${contestReceipt.totalCost}
                                                                </b>
                                                            </td>
                                                        </tr>

                                                        </tbody>
                                                    </table>

                                                    <h2 class="sectionHead">Estimated Cost</h2>

                                                    <table class="pipelineStats">
                                                        <thead>
                                                        <tr class="subTheadRow">
                                                            <th class="tableColumn">
                                                                Payment Type
                                                            </th>
                                                            <th class="tableColumn">
                                                                Estimated Amount
                                                            </th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>

                                                        <s:if test="contestReceipt.estimation.prizes != null">
                                                            <s:iterator value="contestReceipt.estimation.prizes">
                                                                <s:if test="prizeType.id == 15L">
                                                                    <tr>
                                                                        <td>
                                                                            Winner Prize #<s:property value="place"/>
                                                                        </td>
                                                                        <td>
                                                                            $<s:property value="prizeAmount"/>
                                                                        </td>
                                                                    </tr>
                                                                </s:if>
                                                            </s:iterator>
                                                            <s:iterator value="contestReceipt.estimation.prizes">
                                                                <s:if test="prizeType.id == 14L">
                                                                    <tr>
                                                                        <td>
                                                                            Checkpoint prizes
                                                                        </td>
                                                                        <td>
                                                                            $<s:property value="prizeAmount"/> * <s:property value="numberOfSubmissions"/>
                                                                        </td>
                                                                    </tr>
                                                                </s:if>
                                                            </s:iterator>
                                                        </s:if>

                                                        <s:if test="contestReceipt.estimation.drPoints != null">
                                                            <tr>
                                                                <td>
                                                                    DR Points
                                                                </td>
                                                                <td>
                                                                    $${contestReceipt.estimation.drPoints}
                                                                </td>
                                                            </tr>
                                                        </s:if>

                                                        <s:if test="contestReceipt.estimation.reliabilityBonus != null">
                                                            <tr>
                                                                <td>
                                                                    Reliability Bonus
                                                                </td>
                                                                <td>
                                                                    $${contestReceipt.estimation.reliabilityBonus}
                                                                </td>
                                                            </tr>
                                                        </s:if>

                                                        <s:if test="contestReceipt.estimation.specReviewCost != null">
                                                            <tr>
                                                                <td>
                                                                    Specification Review Cost
                                                                </td>
                                                                <td>
                                                                    $${contestReceipt.estimation.specReviewCost}
                                                                </td>
                                                            </tr>
                                                        </s:if>

                                                        <s:if test="contestReceipt.estimation.reviewCost != null">
                                                            <tr>
                                                                <td>
                                                                    Review Cost
                                                                </td>
                                                                <td>
                                                                    $${contestReceipt.estimation.reviewCost}
                                                                </td>
                                                            </tr>
                                                        </s:if>

                                                        <s:if test="contestReceipt.estimation.copilotCost != null">
                                                            <tr>
                                                                <td>
                                                                    Copilot Cost
                                                                </td>
                                                                <td>
                                                                    $${contestReceipt.estimation.copilotCost}
                                                                </td>
                                                            </tr>
                                                        </s:if>

                                                        <s:if test="contestReceipt.estimation.adminFee != null">
                                                            <tr>
                                                                <td>
                                                                    Challenge Admin Fee
                                                                </td>
                                                                <td>
                                                                    $${contestReceipt.estimation.adminFee}
                                                                </td>
                                                            </tr>
                                                        </s:if>

                                                        <tr>
                                                            <td>
                                                                <b>Total</b>
                                                            </td>
                                                            <td>
                                                                <b>
                                                                    $${contestReceipt.estimation.total}
                                                                </b>
                                                            </td>
                                                        </tr>

                                                        </tbody>
                                                    </table>
                                                    <%--<h3>Challenge Prizes:</h3>--%>
                                                    <%--<table class="prizesTable">--%>
                                                        <%--<tbody><tr>--%>
                                                            <%--<td>First Place Cost : $${firstPrize}</td>--%>
                                                            <%--<td>Second Place Cost : $${secondPrize}</td>--%>
                                                            <%--<td>DR points : $${drPoints}</td>--%>
                                                            <%--<td>Reliability Bonus Cost : $${reliabilityBonusCost}</td>--%>
                                                            <%--<td class="last">$<fmt:formatNumber value="${firstPrize + secondPrize + drPoints + reliabilityBonusCost}" pattern="0.00"/></td>--%>
                                                        <%--</tr>--%>
                                                    <%--</tbody></table>--%>
                                                    <%--<s:if test="contestReceipt.checkpointPrize > 0">--%>
                                                        <%--<h3>Checkpoint Prizes:</h3>--%>
                                                        <%--<table class="prizesTable">--%>
                                                            <%--<tbody>--%>
                                                            <%--<tr>--%>
                                                                <%--<s:set id="checkpointSinglePrize" name="checkpointSinglePrize"--%>
                                                                       <%--value="(contestReceipt.checkpointPrize / contestReceipt.checkpointPrizeNumber)"--%>
                                                                       <%--scope="page"/>--%>

                                                                <%--<c:forEach var="currentIndex" begin="1" end="${contestReceipt.checkpointPrizeNumber}">--%>

                                                                    <%--<td>${currentIndex}:${checkpointSinglePrize}</td>--%>

                                                                <%--</c:forEach>--%>


                                                                <%--<td class="last">$${checkpointPrize}</td>--%>
                                                            <%--</tr>--%>
                                                            <%--</tbody>--%>
                                                        <%--</table>--%>
                                                    <%--</s:if>--%>
                                                    <%--<h3>Additional Costs:</h3>--%>
                                                    <%--<table class="prizesTable">--%>
                                                        <%--<tbody><tr>--%>
                                                            <%--<td>Contest Fee : $<fmt:formatNumber value="${contestFee}" pattern="0.00"/> </td>--%>
                                                            <%--<td>Specification Review : $${specificationReviewPayment}</td>--%>
                                                            <%--<td>Review  : $${reviewPayment}</td>--%>
                                                            <%--<td>Copilot Fee  : $${copilotCost}</td>--%>
                                                            <%--<td>Bug Race : $${bugRacePayment}</td>--%>
                                                            <%--<s:if test="contestReceipt.finished == true && #attr['otherPayment'] > 0">--%>
                                                            <%--<td>Other : $${otherPayment}</td>--%>
                                                            <%--</s:if>--%>
                                                            <%--<td class="last">$  --%>
                                                            <%--<fmt:formatNumber value="${(contestFee + specificationReviewPayment + reviewPayment + copilotCost + bugRacePayment + otherPayment)}" pattern="0.00"/>--%>
                                                            <%--</td>--%>
                                                        <%--</tr>--%>
                                                    <%--</tbody></table>--%>
                                                    <%--<table class="total">--%>
                                                        <%--<tbody><tr>--%>
                                                            <%--<td class="toLeft">Total:</td>--%>
                                                            <%--<td class="toRight">--%>
                                                            <%--<s:if test="contestReceipt.finished == true">--%>
                                                            <%--$${contestReceipt.totalCost}--%>
                                                            <%--</s:if>--%>
                                                            <%--<s:else>--%>
                                                            <%--$${totalPayment}--%>
                                                            <%--</s:else>--%>
                                                            <%--</td>--%>
                                                        <%--</tr>--%>
                                                    <%--</tbody></table>                                                    --%>
                                                </div>
                                            </s:if>                                         <!-- end .contestDetails -->
                                            <hr class="dualDivider">
                                            <br><br>
                                        </div>
    </s:if>
    <s:else>
        <div class="noReceipt">
            <div>
                The receipt will be available after the challenge is finished
            </div>
        </div>
    </div>
    </s:else>
