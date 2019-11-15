
package acme.features.administrator.challenge;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import acme.entities.challenges.Challenge;
import acme.framework.components.Errors;
import acme.framework.components.Model;
import acme.framework.components.Request;
import acme.framework.entities.Administrator;
import acme.framework.services.AbstractUpdateService;

@Service
public class AdministratorChallengeUpdateService implements AbstractUpdateService<Administrator, Challenge> {

	@Autowired
	AdministratorChallengeRepository repository;


	@Override
	public boolean authorise(final Request<Challenge> request) {
		assert request != null;
		return true;
	}

	@Override
	public void bind(final Request<Challenge> request, final Challenge entity, final Errors errors) {
		assert request != null;
		assert entity != null;
		assert errors != null;

		request.bind(entity, errors);

	}

	@Override
	public void unbind(final Request<Challenge> request, final Challenge entity, final Model model) {
		assert request != null;
		assert entity != null;
		assert model != null;

		request.unbind(entity, model, "title", "deadline", "description", "goldGoal", "goldReward", "silverGoal", "silverReward", "bronzeGoal", "bronzeReward");

	}

	@Override
	public Challenge findOne(final Request<Challenge> request) {
		assert request != null;

		Challenge result;
		int id;

		id = request.getModel().getInteger("id");
		result = this.repository.findOneById(id);

		return result;
	}

	@Override
	public void validate(final Request<Challenge> request, final Challenge entity, final Errors errors) {
		assert request != null;
		assert entity != null;
		assert errors != null;

		Boolean goldRewardAmount, goldRewardCurrency, silverRewardCurrency, silverRewardAmount, bronzeRewardCurrency, bronzeRewardAmount;

		if (!errors.hasErrors("goldReward")) {
			goldRewardCurrency = entity.getGoldReward().getCurrency().equals("EUR");
			goldRewardAmount = entity.getGoldReward().getAmount() >= 0;

			errors.state(request, goldRewardCurrency, "goldReward", "administrator.challenge.error.reward.incorrect-currency");
			errors.state(request, goldRewardAmount, "goldReward", "administrator.challenge.error.reward.negative-amount");
		}

		if (!errors.hasErrors("silverReward")) {
			silverRewardCurrency = entity.getSilverReward().getCurrency().equals("EUR");
			silverRewardAmount = entity.getSilverReward().getAmount() >= 0;

			errors.state(request, silverRewardCurrency, "silverReward", "administrator.challenge.error.reward.incorrect-currency");
			errors.state(request, silverRewardAmount, "silverReward", "administrator.challenge.error.reward.negative-amount");
		}

		if (!errors.hasErrors("bronzeReward")) {
			bronzeRewardCurrency = entity.getBronzeReward().getCurrency().equals("EUR");
			bronzeRewardAmount = entity.getBronzeReward().getAmount() >= 0;

			errors.state(request, bronzeRewardCurrency, "bronzeReward", "administrator.challenge.error.reward.incorrect-currency");
			errors.state(request, bronzeRewardAmount, "bronzeReward", "administrator.challenge.error.reward.negative-amount");
		}

	}

	@Override
	public void update(final Request<Challenge> request, final Challenge entity) {
		assert request != null;
		assert entity != null;

		this.repository.save(entity);

	}

}
