
package acme.entities.nonCommercialBanners;

import javax.persistence.Entity;

import org.hibernate.validator.constraints.URL;

import acme.entities.banners.Banner;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class NonCommercialBanner extends Banner {
	//Serializacion identifier ------------------------------

	private static final long	serialVersionUID	= 1L;

	@URL
	private String				jingle;
}
