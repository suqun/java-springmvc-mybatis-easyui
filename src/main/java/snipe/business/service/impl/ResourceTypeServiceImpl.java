package snipe.business.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import snipe.business.service.ResourceTypeServiceI;
import snipe.mybatis.dao.ResourceTypeMapper;
import snipe.mybatis.model.ResourceType;
import snipe.mybatis.model.ResourceTypeExample;

@Service
public class ResourceTypeServiceImpl implements ResourceTypeServiceI {

	@Autowired
	private ResourceTypeMapper resourceTypeMapper;

	@Override
	@Cacheable(value = "resourceTypeServiceCache", key = "'resourceTypeList'")
	public List<ResourceType> getResourceTypeList() {
		ResourceTypeExample example = new ResourceTypeExample();
		example.createCriteria().andDatastateNotEqualTo("0");
		List<ResourceType> l = resourceTypeMapper.selectByExample(example);
		List<ResourceType> rl = new ArrayList<ResourceType>();
		if (l != null && l.size() > 0) {
			for (ResourceType t : l) {
				ResourceType rt = new ResourceType();
				BeanUtils.copyProperties(t, rt);
				rl.add(rt);
			}
		}
		return rl;
	}

}
