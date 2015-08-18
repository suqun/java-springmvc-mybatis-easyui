package snipe.business.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import snipe.business.dao.base.BaseDao;
import snipe.business.service.RoleServiceI;
import snipe.mybatis.dao.RoleMapper;
import snipe.mybatis.dao.RoleResourceMapper;
import snipe.mybatis.dao.UserRoleMapper;
import snipe.mybatis.model.Resource;
import snipe.mybatis.model.Role;
import snipe.mybatis.model.RoleExample;
import snipe.mybatis.model.RoleResource;
import snipe.mybatis.model.RoleResourceExample;
import snipe.mybatis.model.UserRole;
import snipe.mybatis.model.UserRoleExample;
import snipe.pageModel.RoleDto;
import snipe.pageModel.base.SessionInfo;
import snipe.pageModel.easyUI.Tree;

@Service
public class RoleServiceImpl implements RoleServiceI {
	
	@Autowired
	private BaseDao baseDao;
	
	@Autowired
	private RoleMapper roleMapper;
	
//	@Autowired
//	private UserMapper userMapper;
	
	@Autowired
	private UserRoleMapper userRoleMapper;
	
	@Autowired
	private RoleResourceMapper roleResourceMapper;
	
	
	 
	@Override
	public void add(RoleDto dto, SessionInfo sessionInfo) {
		Date now = new Date();
		Role role = new Role();
		BeanUtils.copyProperties(dto, role);
		role.setCreatedatetime(now);
		role.setUpdatedatetime(now);
		roleMapper.insert(role);

		// 刚刚添加的角色，赋予给当前的用户
		UserRole ur = new UserRole();
		ur.setUserId(sessionInfo.getId());
		ur.setRoleId(role.getId());
		userRoleMapper.insert(ur);
	}

	@Override
	public RoleDto getRoleById(String id) {
		List<RoleDto> rolelist = (List<RoleDto>) baseDao.selectList("BizRoleMapper.selectRoleByRoleId",id);
		RoleDto roledto = null;
		if (rolelist != null && rolelist.size()>0) {
			roledto = rolelist.get(0); 
			if (roledto.getRole() != null) {
				roledto.setPid(roledto.getRole().getId());
				roledto.setPname(roledto.getRole().getName());
			}
			List<Resource> s = roledto.getResources();
			if (s != null && !s.isEmpty()) {
				boolean b = false;
				String ids = "";
				String names = "";
				for (Resource tr : s) {
					if(null != tr){
						if (b) {
							ids += ",";
							names += ",";
						} else {
							b = true;
						}
						ids += tr.getId();
						names += tr.getName();
					}
				}
				roledto.setResourceIds(ids);
				roledto.setResourceNames(names);
			}
		}
		return roledto;
	}

	@Override
	public void edit(RoleDto roledto) { 
		 Role role = new Role();
		 BeanUtils.copyProperties(roledto, role);
		 roleMapper.updateByPrimaryKeySelective(role); 
	}

	@Override
	public List<RoleDto> treeGrid(SessionInfo sessionInfo) {
		List<RoleDto> rl = new ArrayList<RoleDto>();
		List<RoleDto> tl = null;
		RoleDto dto = new RoleDto();
	
		if (sessionInfo != null) {
			dto.setLoginUserId(sessionInfo.getId());// 查所有权限的角色
		}
			 
		tl = (List<RoleDto>) baseDao.selectList("BizRoleMapper.selectRoleByDto",dto);
		if (tl != null && tl.size() > 0) {
			for (RoleDto t : tl) {
				RoleDto role = new RoleDto();
				BeanUtils.copyProperties(t, role);
				role.setIconCls("status_online");
				if (t.getRole() != null) {
					role.setPid(t.getRole().getId());
					role.setPname(t.getRole().getName());
				}
				List<Resource> s =  t.getResources();
				if (s != null && !s.isEmpty()) {
					boolean b = false;
					String ids = "";
					String names = "";
					for (Resource tr : s) {
						if(null != tr){
							if (b) {
								ids += ",";
								names += ",";
							} else {
								b = true;
							}
							ids += tr.getId();
							names += tr.getName();
						}
					}
					role.setResourceIds(ids);
					role.setResourceNames(names);
				}
				rl.add(role);
			}
		}
		return rl;
	}

	@Override
	public void delete(String id) {
		//递归删除该角色及其子角色
		Role role = roleMapper.selectByPrimaryKey(id);
		del(role);
	}
	
	private void del(Role role){
		//获取父节点为role的所有子节点
		RoleExample re = new RoleExample();
		re.createCriteria().andPidEqualTo(role.getId());
		List<Role> rolelist = roleMapper.selectByExample(re);
		//删除这些子节点
		if(null != rolelist && rolelist.size()>0){
			for(Role r : rolelist){
				del(r);
			}
		}
		//删除角色
		roleMapper.deleteByPrimaryKey(role.getId()); 
//		//删除用户具有的该角色关系
//		UserRoleExample ure = new UserRoleExample();
//		ure.createCriteria().andRoleIdEqualTo(role.getId());
//		userRoleMapper.deleteByExample(ure);
	}
 
	@Override
	public List<Tree> tree(SessionInfo sessionInfo) {
		List<RoleDto> dtolist = null;
		List<Tree> lt = new ArrayList<Tree>();
		RoleDto dto = new RoleDto();
		if (sessionInfo != null) {
			dto.setLoginUserId(sessionInfo.getId());// 查用户具有权限的角色
		}
		dtolist = (List<RoleDto>) baseDao.selectList("BizRoleMapper.selectRoleByDto",dto);

		if (dtolist != null && dtolist.size() > 0) {
			for (RoleDto t : dtolist) {
				Tree tree = new Tree();
				BeanUtils.copyProperties(t, tree);
				tree.setText(t.getName());
				tree.setIconCls("status_online");
				if (t.getRole() != null) {
					tree.setPid(t.getRole().getId());
				}
				lt.add(tree);
			}
		}
		return lt;
	}

	@Override
	public List<Tree> allTree() {
		return this.tree(null);
	}

	@Override
	public void grant(RoleDto roledto) {
		// 删除该role原有的资源权限
		RoleResourceExample example = new RoleResourceExample();
		example.createCriteria().andRoleIdEqualTo(roledto.getId());
		roleResourceMapper.deleteByExample(example);
		
		if(null != roledto.getResourceIds() && !roledto.getResourceIds().equals("")){
			// 为role添加新的资源权限
			for (String resourceId : roledto.getResourceIds().split(",")) {
				RoleResource roleResource = new RoleResource();
				roleResource.setRoleId(roledto.getId());
				roleResource.setResourceId(resourceId);
				roleResourceMapper.insert(roleResource);
			}
		}
	}

}
