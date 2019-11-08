
package acme.features.administrator.chart;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import acme.framework.repositories.AbstractRepository;

@Repository
public interface AdministratorChartRepository extends AbstractRepository {

	@Query("select c.sector,count(c) FROM CompanyRecord c where c.sector IN (select i.workSector FROM InvestorRecords i) group by c.sector order by c.sector")
	Object[] findCommonSectorsOfCompanies();

	@Query("select i.workSector,count(i) FROM InvestorRecords i where i.workSector IN (select c.sector FROM CompanyRecord c) group by i.workSector order by i.workSector")
	Object[] findCommonSectorsOfInvestors();

	@Query("select c.sector,count(c) FROM CompanyRecord c where c.sector NOT IN (select i.workSector FROM InvestorRecords i) group by c.sector order by c.sector")
	Object[] findCompanySector();

	@Query("select i.workSector,count(i) FROM InvestorRecords i where i.workSector NOT IN (select c.sector FROM CompanyRecord c) group by i.workSector order by i.workSector")
	Object[] findInvestorSector();
}
