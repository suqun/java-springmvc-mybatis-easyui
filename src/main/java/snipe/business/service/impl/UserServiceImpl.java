package snipe.business.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import snipe.business.dao.base.BaseDao;
import snipe.business.service.UserServiceI;
import snipe.mybatis.dao.UserMapper;
import snipe.mybatis.dao.UserRoleMapper;
import snipe.mybatis.model.Resource;
import snipe.mybatis.model.Role;
import snipe.mybatis.model.User;
import snipe.mybatis.model.UserExample;
import snipe.mybatis.model.UserRoleExample;
import snipe.mybatis.model.UserRoleKey;
import snipe.pageModel.UserDto;
import snipe.pageModel.base.PageHelper;
import snipe.pageModel.easyUI.DataGrid;
import snipe.util.MD5Util;

import com.octo.captcha.service.CaptchaServiceException;
import com.octo.captcha.service.multitype.GenericManageableCaptchaService;

@Service
public class UserServiceImpl implements UserServiceI {
	@Autowired
	private GenericManageableCaptchaService captchaService;
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private BaseDao baseDao;
 
	@Autowired
	private UserRoleMapper userRoleMapper;

	@Override
	public UserDto login(UserDto user) {
		UserExample ue = new UserExample();
		ue.createCriteria().andNameEqualTo(user.getName()).andPwdEqualTo(MD5Util.md5(user.getPwd()));
		List<User> list = userMapper.selectByExample(ue);
		if (list != null && list.size()>0) {
			BeanUtils.copyProperties(list.get(0), user);
			return user;
		}
		return null;
	}

	@Override
	public Boolean verify(String captchaId, String response) {
		Boolean isResponseCorrect = Boolean.FALSE;
         try {
             isResponseCorrect = captchaService.validateResponseForID(captchaId,
                     response); 
         } catch (CaptchaServiceException e) {
             return isResponseCorrect;
         }
		return isResponseCorrect;
	}

//
//	@Override
//	synchronized public void reg(User user) throws Exception {
//		Map<String, Object> params = new HashMap<String, Object>();
//		params.put("name", user.getName());
//		if (userDao.count("select count(*) from Tuser t where t.name = :name", params) > 0) {
//			throw new Exception("登录名已存在！");
//		} else {
//			Tuser u = new Tuser();
//			u.setId(UUID.randomUUID().toString());
//			u.setName(user.getName());
//			u.setPwd(MD5Util.md5(user.getPwd()));
//			u.setCreatedatetime(new Date());
//			userDao.save(u);
//		}
//	}

	@Override
	public DataGrid dataGrid(UserDto user) {
		DataGrid dg = new DataGrid();
		List<UserDto> userDtoList = new ArrayList<UserDto>();
		user.setQueryAll(false);//分页
		List<UserDto> list = (List<UserDto>) baseDao.selectList("BizUserMapper.selectUserByDto", user);
		if (list != null && list.size() > 0) {
			for (UserDto u : list) {
				UserDto userdto = new UserDto();
				BeanUtils.copyProperties(u, userdto);
				List<Role> roles = u.getRoles();
				if (roles != null && !roles.isEmpty()) {
					String roleIds = "";
					String roleNames = "";
					boolean b = false; 
					for (Role role : roles) {
						if(role != null){
							if (b) {
								roleIds += ",";
								roleNames += ",";
							} else {
								b = true;
							}
							roleIds += role.getId();
							roleNames += role.getName();
						}
					}
					userdto.setRoleIds(roleIds);
					userdto.setRoleNames(roleNames);
				}
				userDtoList.add(userdto);
			}
		}
		dg.setRows(userDtoList);
		dg.setTotal(user.getTotal());//分页拦截器中设置pageHelp中的属性total值
		return dg;
	}
 

	@Override
	synchronized public void add(UserDto userdto) throws Exception {
		UserExample ue = new UserExample();
		ue.createCriteria().andNameEqualTo(userdto.getLoginname());
		List<User> userList = userMapper.selectByExample(ue);
		if (null != userList && userList.size()>0) {
			throw new Exception("登录名已存在！");
		} else {
			User u = new User();
			BeanUtils.copyProperties(userdto, u);
			u.setCreatedatetime(new Date());
			u.setPwd(MD5Util.md5(userdto.getPwd()));
			userMapper.insert(u);
		}
	}

	@Override
	public UserDto getUser(UserDto userdto) {
		List<UserDto> list = (List<UserDto>) baseDao.selectList("BizUserMapper.selectUserByDto", userdto);
		if (list != null && list.size() > 0) {
				UserDto u = list.get(0); 
				BeanUtils.copyProperties(u, userdto);
				List<Role> roles = u.getRoles();
				if (roles != null && !roles.isEmpty()) {
					String roleIds = "";
					String roleNames = "";
					boolean b = false;
					for (Role role : roles) {
						if(null != role){
							if (b) {
								roleIds += ",";
								roleNames += ",";
							} else {
								b = true;
							}
							roleIds += role.getId();
							roleNames += role.getName();
						}
					}
					userdto.setRoleIds(roleIds);
					userdto.setRoleNames(roleNames);
				} 
		}
		return userdto;
	}

	@Override
	synchronized public void edit(UserDto userdto) throws Exception {
		UserExample ue = new UserExample();
		ue.createCriteria().andNameEqualTo(userdto.getLoginname());
		List<User> userList = userMapper.selectByExample(ue);
		if (null != userList && userList.size()>0) {
			throw new Exception("登录名已存在！");
		} else {
			User u = new User();
			BeanUtils.copyProperties(userdto, u);
			u.setUpdatedatetime(new Date()); 
			userMapper.updateByPrimaryKeySelective(u); 
		}
	}

	@Override
	public void delete(String id) {
		UserExample ue = new UserExample();
		ue.createCriteria().andIdEqualTo(id);
		userMapper.deleteByExample(ue);
	}

	@Override
	public void grant(String ids, UserDto user) {
		if (ids != null && ids.length() > 0) { 
			for (String uid : ids.split(",")) {
				if (uid != null && !uid.equalsIgnoreCase("")) {
					//删除原有的权限
					UserRoleExample ure = new UserRoleExample();
					ure.createCriteria().andUserIdEqualTo(uid);
					userRoleMapper.deleteByExample(ure);
					//添加新权限
					UserRoleKey ur = new UserRoleKey();
					ur.setUserId(uid);
					for(String rid : user.getRoleIds().split(",")){
						ur.setRoleId(rid);
						userRoleMapper.insertSelective(ur);
					} 
				}
			}
		}
	}

	@Override
	public List<String> resourceList(String id) {
		List<String> resourceList = new ArrayList<String>();
		List<Resource> resList = (List<Resource>) baseDao.selectList("BizUserMapper.selectResourcesByUserId", id);//userMapper.selectResourcesByUserId(id);
		if(null != resList && resList.size()>0){
			for(Resource resource : resList){
				resourceList.add(resource.getUrl());
			}
		}
		return resourceList;
	}

//	@Override
//	public void editPwd(User user) {
//		if (user != null && user.getPwd() != null && !user.getPwd().trim().equalsIgnoreCase("")) {
//			Tuser u = userDao.get(Tuser.class, user.getId());
//			u.setPwd(MD5Util.md5(user.getPwd()));
//			u.setModifydatetime(new Date());
//		}
//	}
//
//	@Override
//	public boolean editCurrentUserPwd(SessionInfo sessionInfo, String oldPwd, String pwd) {
//		Tuser u = userDao.get(Tuser.class, sessionInfo.getId());
//		if (u.getPwd().equalsIgnoreCase(MD5Util.md5(oldPwd))) {// 说明原密码输入正确
//			u.setPwd(MD5Util.md5(pwd));
//			u.setModifydatetime(new Date());
//			return true;
//		}
//		return false;
//	}
//
	@Override
	public List<UserDto> loginCombobox(String q) {
		if (q == null) {
			q = "";
		}
		UserExample ue = new UserExample();
		ue.createCriteria().andNameLike(q);
		List<User> tl = userMapper.selectByExample(ue); 
		List<UserDto> ul = new ArrayList<UserDto>();
		if (tl != null && tl.size() > 0) {
			for (User t : tl) {
				UserDto u = new UserDto();
				u.setName(t.getName());
				ul.add(u);
			}
		}
		return ul;
	}

	@Override
	public DataGrid loginCombogrid(String q, PageHelper ph) {
		if (q == null) {
			q = "";
		}
		DataGrid dg = new DataGrid();
//		List<User> ul = new ArrayList<User>();
//		Map<String, Object> params = new HashMap<String, Object>();
//		params.put("name", "%%" + q.trim() + "%%");
//		List<Tuser> tl = userDao.find("from Tuser t where t.name like :name order by " + ph.getSort() + " " + ph.getOrder(), params, ph.getPage(), ph.getRows());
//		if (tl != null && tl.size() > 0) {
//			for (Tuser t : tl) {
//				User u = new User();
//				u.setName(t.getName());
//				u.setCreatedatetime(t.getCreatedatetime());
//				u.setModifydatetime(t.getModifydatetime());
//				ul.add(u);
//			}
//		}
//		dg.setRows(ul);
//		dg.setTotal(userDao.count("select count(*) from Tuser t where t.name like :name", params));
		return dg;
	}
//
//	@Override
//	public List<Long> userCreateDatetimeChart() {
//		List<Long> l = new ArrayList<Long>();
//		int k = 0;
//		for (int i = 0; i < 12; i++) {
//			Map<String, Object> params = new HashMap<String, Object>();
//			params.put("s", k);
//			params.put("e", k + 2);
//			k = k + 2;
//			l.add(userDao.count("select count(*) from Tuser t where HOUR(t.createdatetime)>=:s and HOUR(t.createdatetime)<:e", params));
//		}
//		return l;
//	}

}
