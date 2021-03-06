package cn.it.bos.service.bc;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import cn.it.bos.domain.bc.Staff;
import cn.it.bos.domain.bc.Standard;
import cn.it.bos.service.base.GenericService;
import cn.it.page.PageRequestBean;
import cn.it.page.PageResponseBean;

public interface StaffService extends GenericService{

	public void save(Staff staff);

	public PageResponseBean pageQuery(PageRequestBean pageRequestBean);

	public void deleteById(String[] ids);


	public Standard findStandardById(Standard standard);

	public List<Staff> findStandard(DetachedCriteria detachedCriteria);



}
