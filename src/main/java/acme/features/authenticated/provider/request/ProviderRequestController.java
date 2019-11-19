
package acme.features.authenticated.provider.request;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import acme.entities.requests.Request;
import acme.entities.roles.Provider;
import acme.framework.components.BasicCommand;
import acme.framework.controllers.AbstractController;

@Controller
@RequestMapping("/authenticated/provider/request/")
public class ProviderRequestController extends AbstractController<Provider, Request> {

	@Autowired
	private ProviderRequestListService		listService;

	@Autowired
	private ProviderRequestCreateService	createService;

	@Autowired
	private ProviderRequestShowService		showService;


	@PostConstruct
	private void initialise() {
		super.addBasicCommand(BasicCommand.LIST, this.listService);
		super.addBasicCommand(BasicCommand.CREATE, this.createService);
		super.addBasicCommand(BasicCommand.SHOW, this.showService);
	}
}
