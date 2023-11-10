<%@ page import="java.util.Vector" %>
<!-- 메뉴 -->
<%@ page import= "menu.Manager_Menu" %>
<jsp:useBean id="menuMgr" class="menu.Manager_Menu" />
<%@ page import= "menu.Menu_menu_Bean" %>
<jsp:useBean id="menuBean" class="menu.Menu_menu_Bean" />
<!--  재료  -->
<%@ page import="menu.Menu_component_Bean" %>
<jsp:useBean id="menuComponentBean" class="menu.Menu_component_Bean" />
<!-- 이벤트 메뉴 -->
<%@ page import="eventMenu.Eventmenu_Mgr" %>
<%@ page import="eventMenu.Eventmenu_Bean" %>
<jsp:useBean id="eventMenuMgr" class="eventMenu.Eventmenu_Mgr" />
<jsp:useBean id="eventMenuBean" class="eventMenu.Eventmenu_Bean" />
