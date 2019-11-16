<%@page language="java"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<acme:list>
	<acme:list-column code="administrator.non-commercial-banner.list.label.picture" path="picture" width="5%"/>
	<acme:list-column code="administrator.non-commercial-banner.list.label.slogan" path="slogan" width="40%"/>
	<acme:list-column code="administrator.non-commercial-banner.list.label.targetURL" path="targetURL" width="5%"/>
	<acme:list-column code="administrator.non-commercial-banner.list.label.jingle" path="jingle" width="10%"/>

</acme:list>