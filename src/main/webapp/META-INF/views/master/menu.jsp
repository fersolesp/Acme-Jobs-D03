<%--
- menu.jsp
-
- Copyright (c) 2019 Rafael Corchuelo.
-
- In keeping with the traditional purpose of furthering education and research, it is
- the policy of the copyright owner to permit non-commercial use and redistribution of
- this software. It has been tested carefully, but it is not guaranteed for any particular
- purposes.  The copyright owner does not offer any warranties or representations, nor do
- they accept any liabilities with respect to them.
--%>

<%@page language="java" import="acme.framework.helpers.PrincipalHelper,acme.entities.roles.Provider,acme.entities.roles.Consumer"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<acme:menu-bar code="master.menu.home">
	<acme:menu-left>
		<acme:menu-option code="master.menu.anonymous" access="isAnonymous()">
			<acme:menu-suboption code="master.menu.anonymous.favourite-link-pablo" action="https://www.infojobs.net/candidate/cv/view/index.xhtml?dgv=7738301078718444385"/>
			<acme:menu-suboption code="master.menu.anonymous.favourite-link-josemaria" action="http://ev.us.es/"/>
			<acme:menu-suboption code="master.menu.anonymous.favourite-link-Reyes" action="https://www.infojobs.net/candidate/cv/view/index.xhtml?dgv=17710857660115944719"/>
			<acme:menu-suboption code="master.menu.anonymous.favourite-link-fernando" action="https://www.linkedin.com/in/fernando-luis-sola-espinosa-57180416b"/>
			<acme:menu-suboption code="master.menu.anonymous.favourite-link-vanessa" action="https://github.com/"/>
			<acme:menu-separator/>			
			<acme:menu-suboption code="master.menu.anonymous.shout.create" action="/anonymous/shout/create"/>
			<acme:menu-suboption code="master.menu.anonymous.shout.list" action="/anonymous/shout/list"/>
		</acme:menu-option>
		
		<acme:menu-option code="master.menu.anonymous.bulletins" access="isAnonymous()">
			<acme:menu-suboption code="master.menu.anonymous.cornacBulletin.create" action="/anonymous/cornac-bulletin/create"/>
			<acme:menu-suboption code="master.menu.anonymous.cornacBulletin.list" action="/anonymous/cornac-bulletin/list"/>
			<acme:menu-separator/>
			<acme:menu-suboption code="master.menu.anonymous.blascoBulletin.create" action="/anonymous/blascoBulletin/create"/>
			<acme:menu-suboption code="master.menu.anonymous.blascoBulletin.list" action="/anonymous/blascoBulletin/list"/>
			<acme:menu-separator/>
			<acme:menu-suboption code="master.menu.anonymous.pradas-bulletin.create" action="/anonymous/pradas-bulletin/create"/>
			<acme:menu-suboption code="master.menu.anonymous.pradas-bulletin.list" action="/anonymous/pradas-bulletin/list"/>
			<acme:menu-separator/>
			<acme:menu-suboption code="master.menu.anonymous.cardenalBulletin.create" action="/anonymous/cardenal-bulletin/create"/>
			<acme:menu-suboption code="master.menu.anonymous.cardenalBulletin.list" action="/anonymous/cardenal-bulletin/list"/>
			<acme:menu-separator/>
			<acme:menu-suboption code="master.menu.anonymous.sola-bulletin.create" action="/anonymous/sola-bulletin/create"/>
			<acme:menu-suboption code="master.menu.anonymous.sola-bulletin.list" action="/anonymous/sola-bulletin/list"/>
			
		</acme:menu-option>		
    
		<acme:menu-option code="master.menu.anonymous.second" access="isAnonymous()">
			<acme:menu-suboption code="master.menu.anonymous.companyRecord.list" action="/anonymous/company-record/list"/>
			<acme:menu-suboption code="master.menu.anonymous.topCompanyRecord.list" action="/anonymous/company-record/list-top"/>
      <acme:menu-separator/>
			<acme:menu-suboption code="master.menu.anonymous.announcement.list" action="/anonymous/announcement/list"/>
      <acme:menu-separator/>
			<acme:menu-suboption code="master.menu.anonymous.investor-records.list" action="/anonymous/investor-records/list"/>
			<acme:menu-suboption code="master.menu.anonymous.top-investor-records.list" action="/anonymous/investor-records/list-top"/>
		</acme:menu-option>
		
    
		<acme:menu-option code="master.menu.authenticated" access="isAuthenticated()">
			<acme:menu-suboption code="master.menu.authenticated.announcement.list" action="/authenticated/announcement/list"/>
			      <acme:menu-separator/>

      <acme:menu-suboption code="master.menu.authenticated.request.list" action="/authenticated/request/list"/>
						<acme:menu-separator/>
			<acme:menu-suboption code="master.menu.authenticated.challenge.list" action="/authenticated/challenge/list"/>
						<acme:menu-separator/>
			<acme:menu-suboption code="master.menu.authenticated.investor-records.list" action="/authenticated/investor-records/list"/>
						<acme:menu-separator/>
			<acme:menu-suboption code="master.menu.authenticated.offer.list" action="/authenticated/offer/list"/>
      <acme:menu-separator/>
			<acme:menu-suboption code="master.menu.authenticated.companyRecord.list" action="/authenticated/company-record/list"/>
		</acme:menu-option>

    
    
    
		<acme:menu-option code="master.menu.administrator" access="hasRole('Administrator')">
			<acme:menu-suboption code="master.menu.administrator.user-accounts" action="/administrator/user-account/list"/>
			<acme:menu-separator/>
			<acme:menu-suboption code="master.menu.administrator.announcement.list" action="/administrator/announcement/list"/>
			<acme:menu-separator/>
			<acme:menu-suboption code="master.menu.administrator.customisationParameter.list" action="/administrator/customisation-parameter/list"/>
			<acme:menu-separator/>
			<acme:menu-suboption code="master.menu.administrator.dashboard.listing" action="/administrator/dashboard/listing"/>
			<acme:menu-suboption code="master.menu.administrator.chart" action="/administrator/chart/chart"/>
			<acme:menu-separator/>
			<acme:menu-suboption code="master.menu.administrator.shutdown" action="/master/shutdown"/>
		</acme:menu-option>

		<acme:menu-option code="master.menu.provider" access="hasRole('Provider')">
			<acme:menu-suboption code="master.menu.provider.favourite-link" action="http://www.example.com/"/>
		</acme:menu-option>

		<acme:menu-option code="master.menu.consumer" access="hasRole('Consumer')">
			<acme:menu-suboption code="master.menu.consumer.favourite-link" action="http://www.example.com/"/>
		</acme:menu-option>
	</acme:menu-left>

	<acme:menu-right>
		<acme:menu-option code="master.menu.sign-up" action="/anonymous/user-account/create" access="isAnonymous()"/>
		<acme:menu-option code="master.menu.sign-in" action="/master/sign-in" access="isAnonymous()"/>
		
		<acme:menu-option code="master.menu.user-account" access="isAuthenticated()">
			<acme:menu-suboption code="master.menu.user-account.general-data" action="/authenticated/user-account/update"/>
			<acme:menu-suboption code="master.menu.user-account.become-provider" action="/authenticated/provider/create" access="!hasRole('Provider')"/>
			<acme:menu-suboption code="master.menu.user-account.provider" action="/authenticated/provider/update" access="hasRole('Provider')"/>
			<acme:menu-suboption code="master.menu.user-account.become-consumer" action="/authenticated/consumer/create" access="!hasRole('Consumer')"/>
			<acme:menu-suboption code="master.menu.user-account.consumer" action="/authenticated/consumer/update" access="hasRole('Consumer')"/>
		</acme:menu-option>

		<acme:menu-option code="master.menu.sign-out" action="/master/sign-out" access="isAuthenticated()"/>
	</acme:menu-right>
</acme:menu-bar>

