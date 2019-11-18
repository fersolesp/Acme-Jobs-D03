
package acme.features.authenticated.provider.request;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import acme.entities.requests.Request;
import acme.entities.roles.Provider;
import acme.framework.components.Model;
import acme.framework.services.AbstractListService;

@Service
public class ProviderRequestListService implements AbstractListService<Provider, Request> {

	@Autowired
	ProviderRequestRepository repository;


	@Override
	public boolean authorise(final acme.framework.components.Request<Request> request) {
		// TODO Auto-generated method stub
		assert request != null;
		return true;
	}

	@Override
	public void unbind(final acme.framework.components.Request<Request> request, final Request entity, final Model model) {
		// TODO Auto-generated method stub
		assert request != null;
		assert entity != null;
		assert model != null;
		request.unbind(entity, model, "title", "moment", "deadline", "reward");
	}

	@Override
	public Collection<Request> findMany(final acme.framework.components.Request<Request> request) {
		// TODO Auto-generated method stub
		assert request != null;

		Collection<Request> result;
		result = this.repository.findManyAll();
		return result;
	}

}
