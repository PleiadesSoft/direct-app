<%@ page import="com.topcoder.direct.services.view.action.cloudvm.DashboardVMAction" %>
<%@ include file="/WEB-INF/includes/taglibs.jsp" %>

<div id="header">
    <c:choose>
        <c:when test="${requestScope.PAGE_TYPE eq 'dashboard'}">
            <a href="<s:url action="dashboard" namespace="/"/>" class="logo">
                <img src="/images/dashboard_logo.png" alt="Direct Dashboard" /></a>
        </c:when>
        <c:when test="${requestScope.PAGE_TYPE eq 'launch'}">
            <a href="javascript:;" class="logo">
                <img src="/images/launghContent_logo.png" alt="Launch Contest" /></a>
        </c:when>
        <c:otherwise>
            <a href="<s:url action="currentProjectOverview" namespace="/"/>" class="logo projectLogo">
                <s:property value="sessionData.currentProjectContext.name"/>
            </a>
        </c:otherwise>
    </c:choose>

    <div id="tabs0"><!-- the left tabs -->
        <ui:isDashboardPage>
            <ul>
                <li <c:if test="${requestScope.CURRENT_TAB eq 'dashboard'}">class="on"</c:if>>
                    <a href="<s:url action="dashboard" namespace="/"/>"><span>Dashboard</span></a>
                </li>

				<li <c:if test="${requestScope.CURRENT_TAB eq 'search'}">class="on"</c:if>>
                    <a href="#"><span>Projects</span></a>
                </li>

				<!--
                <li><a href="#" onclick="return false;"><span>CoPilots</span></a></li>
				<li><a href="#"><span>Messages (0)</span></a></li>
				-->
            </ul>
        </ui:isDashboardPage>
        <ui:isProjectPage>
            <ul>
                <li>
                    <a href="<s:url action="dashboard" namespace="/"/>"><span>Dashboard</span></a>
                </li>

				<li class="on">
                     <a href="#"><span>Projects</span></a>
                </li>

				<!--
                <li><a href="#" onclick="return false;"><span>CoPilots</span></a></li>
				<li><a href="#"><span>Messages (0)</span></a></li>
				-->
            </ul>
        </ui:isProjectPage>
        <c:if test="${requestScope.PAGE_TYPE eq 'launch'}">
            <ul>
                <li class="on">
                    <a href="<s:url action="dashboard" namespace="/"/>"><span>Dashboard</span></a>
                </li>

				<li>
                     <a href="#"><span>Projects</span></a>
                </li>

				<!--
                <li><a href="#" onclick="return false;"><span>CoPilots</span></a></li>
				<li><a href="#"><span>Messages (0)</span></a></li>
				-->
            </ul>
        </c:if>
    </div><!-- End #tabs0 -->
	
	<div class="helloUser">
        <ul>
            <li>
                <strong>Hello</strong> <link:currentUser/>|
            </li>
            <li><a href="<s:url action="logout" namespace="/"/>">Logout</a>|</li>
            <li><link:help/></li>
        </ul>
    </div><!-- End .helloUSer -->

    <ui:isProjectPage>
        <div id="tabs1">
             <ul>
                <li <c:if test="${requestScope.CURRENT_TAB eq 'overview'}">class="on"</c:if>>
                    <a href="<s:url action="currentProjectOverview" namespace="/"/>"><span>Overview</span></a>
                </li>

                <li <c:if test="${requestScope.CURRENT_TAB eq 'contests'}">class="on"</c:if>>
                    <a href="<s:url action="currentProjectDetails" namespace="/"/>"><span>Contests</span></a>
                </li>
                <li <c:if test="${requestScope.CURRENT_TAB eq 'permissions'}">class="on"</c:if>>
                    <a href="<s:url action="currentProjectPermissionsView" namespace="/"/>"><span>Permissions</span></a>
                </li>
            </ul>
        </div>
    </ui:isProjectPage>

    
    <div id="tabs2"><!-- tabs on the right side-->
        <ul>
          
            <li <c:if test="${requestScope.CURRENT_TAB eq 'search'}">class="on"</c:if>>
                <a href="<s:url action="dashboardSearchView" namespace="/"/>"><span>Search</span></a>
            </li>
            <li <c:if test="${requestScope.CURRENT_TAB eq 'settings'}">class="on"</c:if>>
                <a href="<s:url action="dashboardNotifications" namespace="/"/>"><span>Settings</span></a>
            </li>
            
            <%
                if (DashboardVMAction.isApplicable()) {
            %>
                <li <c:if test="${requestScope.CURRENT_TAB eq 'VM Management'}">class="on"</c:if>>
                    <a href="<s:url action="dashboardVMAction" namespace="/"/>"><span>VM Management</span></a>
                </li>
            <%
                }
            %>
        </ul>
    </div><!-- End #tabs2 -->
</div><!-- End #header -->