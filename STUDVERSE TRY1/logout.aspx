<%@ Page Language="C#"  %>
<%
    Session.Abandon();
    Response.Write("<script>window.open('login.aspx','_blank').focus();window.close();</script>");
%>