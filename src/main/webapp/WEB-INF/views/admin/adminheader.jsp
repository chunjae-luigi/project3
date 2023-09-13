<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>

<c:set var="headPath" value="${pageContext.request.contextPath }"/>
<c:set var="sid" value="${pageContext.session.getAttribute('sid') }"/>

<link rel="stylesheet" href="${headPath }/resources/admin-dashboard/demo/css/main.min.css">

<aside class="aside is-placed-left is-expanded" style="display: block;">
        <div class="aside-tools">
            <div class="aside-tools-label">
                <a href="${headPath}/"><span>Tspoon</span></a>
            </div>
        </div>
        <div class="menu is-menu-main">
            <p class="menu-label">General</p>
            <ul class="menu-list">
                <li>
                    <a href="${headPath }/admin/" class="is-active router-link-active has-icon">
                        <span class="menu-item-label">Dashboard</span>
                    </a>
                </li>
            </ul>
            <p class="menu-label">Management</p>
            <ul class="menu-list">
                <li>
                    <a href="${headPath }/admin/memberList.do" class="has-icon">
                        <span class="menu-item-label">Member</span>
                    </a>
                </li>
                <li>
                    <a href="forms.html" class="has-icon">
                        <span class="menu-item-label">DataBoard</span>
                    </a>
                </li>
                <li>
                    <a href="profile.html" class="has-icon">
                        <span class="menu-item-label">Profile</span>
                    </a>
                </li>
                <li>
                    <a class="has-icon has-dropdown-icon">
                        <span class="menu-item-label">Submenus</span>
                        <div class="dropdown-icon">
                            <span class="icon"><i class="mdi mdi-plus"></i></span>
                        </div>
                    </a>
                    <ul>
                        <li>
                            <a href="#void">
                                <span>Sub-item One</span>
                            </a>
                        </li>
                        <li>
                            <a href="#void">
                                <span>Sub-item Two</span>
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
            <p class="menu-label">About</p>
            <ul class="menu-list">
                <li>
                    <a href="https://github.com/vikdiesel/admin-one-bulma-dashboard" target="_blank" class="has-icon">
                        <span class="icon"><i class="mdi mdi-github-circle"></i></span>
                        <span class="menu-item-label">GitHub</span>
                    </a>
                </li>
                <li>
                    <a href="https://justboil.me/bulma-admin-template/free-html-dashboard/" class="has-icon">
                        <span class="icon"><i class="mdi mdi-help-circle"></i></span>
                        <span class="menu-item-label">About</span>
                    </a>
                </li>
            </ul>
        </div>
    </aside>
