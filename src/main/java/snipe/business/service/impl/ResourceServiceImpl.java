package snipe.business.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import snipe.business.dao.base.BaseDao;
import snipe.business.service.ResourceServiceI;
import snipe.mybatis.dao.ResourceMapper;
import snipe.mybatis.dao.RoleResourceMapper;
import snipe.mybatis.dao.UserRoleMapper;
import snipe.mybatis.model.Resource;
import snipe.mybatis.model.ResourceExample;
import snipe.mybatis.model.Role;
import snipe.mybatis.model.RoleExample;
import snipe.mybatis.model.RoleResourceKey;
import snipe.mybatis.model.UserRoleExample;
import snipe.mybatis.model.UserRoleKey;
import snipe.pageModel.ResourceDto;
import snipe.pageModel.RoleDto;
import snipe.pageModel.base.SessionInfo;
import snipe.pageModel.easyUI.Tree;

@Service
public class ResourceServiceImpl implements ResourceServiceI {

	@Autowired
	private ResourceMapper resourceMapper;
	@Autowired
	private BaseDao baseDao;
	@Autowired
	private UserRoleMapper userRoleMapper;
	@Autowired
	private RoleResourceMapper roleResourceMapper;

	/**
	 * 菜单类型的resource
	 */
	@Override
	public List<Tree> tree(SessionInfo sessionInfo) {
		List<ResourceDto> l = null;
		List<Tree> lt = new ArrayList<Tree>();
		ResourceDto dto = new ResourceDto();
		dto.setTypeId("0");//菜单类型
		dto.setUserId(sessionInfo.getId());
		if (sessionInfo != null) {
			l = (List<ResourceDto>) baseDao.selectList("BizResourceMapper.selectResourceByDto", dto);// 自查自己有权限的资源
		}  

		if (l != null && l.size() > 0) {
			for (ResourceDto r : l) {
				Tree tree = new Tree();
				BeanUtils.copyProperties(r, tree);
				if (r.getResource() != null) {
					tree.setPid(r.getResource().getId());
				}
				tree.setText(r.getName());
				tree.setIconCls(r.getIconCls());
				Map<String, Object> attr = new HashMap<String, Object>();
				attr.put("url", r.getUrl());
				tree.setAttributes(attr);
				lt.add(tree);
			}
		}
		return lt;
	}
	
	/**
	 * 所有resource
	 */
	@Override
	public List<Tree> allTree(SessionInfo sessionInfo) {
		List<ResourceDto> l = null;
		List<Tree> lt = new ArrayList<Tree>();
		ResourceDto dto = new ResourceDto(); 
		dto.setUserId(sessionInfo.getId());
		if (sessionInfo != null) {
			l = (List<ResourceDto>) baseDao.selectList("BizResourceMapper.selectResourceByDto", dto);// 自查自己有权限的资源
		}  

		if (l != null && l.size() > 0) {
			for (ResourceDto r : l) {
				Tree tree = new Tree();
				BeanUtils.copyProperties(r, tree);
				if (r.getResource() != null) {
					tree.setPid(r.getResource().getId());
				}
				tree.setText(r.getName());
				tree.setIconCls(r.getIconCls());
				Map<String, Object> attr = new HashMap<String, Object>();
				attr.put("url", r.getUrl());
				tree.setAttributes(attr);
				lt.add(tree);
			}
		}
		return lt;
	}

	@Override
	public List<ResourceDto> treeGrid(SessionInfo sessionInfo) {
		List<ResourceDto> l = null;
		List<ResourceDto> lrd = new ArrayList<ResourceDto>();
		ResourceDto dto = new ResourceDto(); 
		dto.setUserId(sessionInfo.getId());
		if (sessionInfo != null) {
			l = (List<ResourceDto>) baseDao.selectList("BizResourceMapper.selectResourceByDto", dto);// 自查自己有权限的资源
		}  

		if (l != null && l.size() > 0) {
			for (ResourceDto t : l) {  
				if (t.getResource() != null) {
					t.setPid(t.getResource().getId());
					t.setPname(t.getResource().getName());
				}
				t.setTypeId(t.getResourceType().getId());
				t.setTypeName(t.getResourceType().getName());
				 
				lrd.add(t);
			}
		}
		return lrd;
	}

	/**
	 * 添加资源
	 */
	@Override
	public void add(Resource resource, SessionInfo sessionInfo) {
		Date now = new Date();
		resource.setCreatedatetime(now);
		resource.setUpdatedatetime(now);
		resource.setCreateuserid(sessionInfo.getId());
		resource.setUpdateuserid(sessionInfo.getId());
		resource.setDatastate("1");
		resourceMapper.insert(resource);
		
		// 由于当前用户所属的角色，没有访问新添加的资源权限，所以在新添加资源的时候，将当前资源授权给当前用户的所有角色，以便添加资源后在资源列表中能够找到
		UserRoleExample ure = new UserRoleExample();
		ure.createCriteria().andUserIdEqualTo(sessionInfo.getId());
		List<UserRoleKey> list = userRoleMapper.selectByExample(ure);
		if(null != list && list.size()>0){
			for(UserRoleKey urkey : list){
				RoleResourceKey rrkey = new RoleResourceKey();
				rrkey.setRoleId(urkey.getRoleId());
				rrkey.setResourceId(resource.getId());
				roleResourceMapper.insert(rrkey);
			}
		}
 
	}

	@Override
	public void delete(String id) {
		// 递归删除该资源及其子
		Resource resource = resourceMapper.selectByPrimaryKey(id);
		del(resource);
	}

	private void del(Resource resource) {
		// 获取父节点为resource的所有子节点
		ResourceExample re = new ResourceExample();
		re.createCriteria().andPidEqualTo(resource.getId());
		List<Resource> resourcelist = resourceMapper.selectByExample(re);
		// 删除这些子节点
		if (null != resourcelist && resourcelist.size() > 0) {
			for (Resource r : resourcelist) {
				del(r);
			}
		}
		// 删除资源
		resourceMapper.deleteByPrimaryKey(resource.getId());
	}
 
	 

	@Override
	public void edit(Resource resource) {
		resourceMapper.updateByPrimaryKeySelective(resource);
	}
 

	@Override
	public ResourceDto get(String id) {
		ResourceDto repdto = new ResourceDto();
		List<ResourceDto> resourcelist = (List<ResourceDto>) baseDao.selectList("BizResourceMapper.selectResourceById",id);
		if(null != resourcelist && resourcelist.size()>0){
			ResourceDto dto = resourcelist.get(0);
			BeanUtils.copyProperties(dto, repdto);
			if (dto.getResource() != null) {
				repdto.setPid(dto.getResource().getId());
				repdto.setPname(dto.getResource().getName());
			}
			repdto.setTypeId(dto.getResourceType().getId());
			repdto.setTypeName(dto.getResourceType().getName());
		}  
		
		return repdto;
	}

}
