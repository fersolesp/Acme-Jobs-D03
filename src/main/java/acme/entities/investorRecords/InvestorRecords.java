
package acme.entities.investorRecords;

import javax.persistence.Entity;
import javax.validation.constraints.NotBlank;

import org.hibernate.validator.constraints.Range;

import acme.framework.entities.DomainEntity;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class InvestorRecords extends DomainEntity {

	//Serializacion identifier ------------------------------

	private static final long	serialVersionUID	= 1L;

	//Atributes  --------------------------------------------

	@NotBlank
	private String				investorName;

	@NotBlank
	private String				workSector;

	@NotBlank
	private String				investingStatement;

	@Range(min = 0, max = 5)
	private Integer				stars;

}
