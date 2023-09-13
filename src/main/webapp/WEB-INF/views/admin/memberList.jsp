<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>티스푼::관리자페이지-회원관리</title>
    <%@ include file="../head.jsp" %>
    <link rel="stylesheet" href="<%=headPath%>/css/admin.css">
    <style>
        .num {width:5%;}
        .etc {width:30%;}
        .inBtn {padding:0 10px;}
    </style>
</head>
<body>
<div class="admin_wrap">
    <header class="admin_hd" id="adminHd">
        <%@ include file="/admin/adminHeader.jsp" %>
    </header>
    <div class="admin_contents" id="adminContents">
        <h2>회원 관리</h2>
        <div class="container">
            <table class="table tb1">
                <thead>
                    <tr>
                        <th class="num"></th>
                        <th>이름</th>
                        <th>아이디</th>
                        <th>전화번호</th>
                        <th>가입일</th>
                        <th class="etc">비고</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    if(memList.size() > 0){
                        int num = 1;
                        for(Member mem : memList) {
                            Date date = ymd.parse(mem.getRegdate());
                            String dateStr = ymd.format(date);

                %>
                <tr>
                    <td class="num"><%=num %></td>
                    <td class="title txtLeft"><%=mem.getName() %></td>
                    <td class="id"><%=mem.getId() %></td>
                    <td class="tel"><%=mem.getTel() %></td>
                    <td class="date"><%=dateStr %></td>
                    <td class="etc">
                        <a href="<%=headPath%>/admin/memberUpdatePw.jsp?id=<%=mem.getId()%>" class="inBtn inBtn1">비밀번호 변경</a>
                        <a href="../member/removeMemberPro.jsp?id=<%=mem.getId()%>" class="inBtn inBtn2">회원 탈퇴</a>
                    </td>
                </tr>
                <%  num++; } } else { %>
                <tr><td colspan="6">가입한 회원이 없습니다.</td></tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
