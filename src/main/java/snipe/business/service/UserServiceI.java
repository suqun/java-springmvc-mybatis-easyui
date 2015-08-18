package snipe.business.service;

import java.util.List;

import snipe.pageModel.UserDto;
import snipe.pageModel.base.PageHelper;
import snipe.pageModel.easyUI.DataGrid;

/**
 * 用户Service
 * 
 * @author 孙宇
 * 
 */
public interface UserServiceI {

	/**
	 * 用户登录
	 * 
	 * @param user
	 *            里面包含登录名和密码
	 * @return 用户对象
	 */
	public UserDto login(UserDto user);
	
	/**
	 * 图形验证码校验
	 * 
	 * @param user
	 *            里面包含登录名和密码
	 * @return 用户对象
	 */
	public Boolean verify(String captchaId,String response);
//
//	/**
//	 * 用户注册
//	 * 
//	 * @param user
//	 *            里面包含登录名和密码
//	 * @throws Exception
//	 */
//	public void reg(User user) throws Exception;

	/**
	 * 获取用户数据表格
	 * 
	 * @param user
	 * @return
	 */
	public DataGrid dataGrid(UserDto userdto);

	/**
	 * 添加用户
	 * 
	 * @param user
	 */
	public void add(UserDto userdto) throws Exception;

	/**
	 * 获得用户对象
	 * 
	 * @param id
	 * @return
	 */
	public UserDto getUser(UserDto userdto);

	/**
	 * 编辑用户
	 * 
	 * @param user
	 */
	public void edit(UserDto user) throws Exception;

	/**
	 * 删除用户
	 * 
	 * @param id
	 */
	public void delete(String id);

	/**
	 * 用户授权
	 * 
	 * @param ids
	 * @param user
	 *            需要user.roleIds的属性值
	 */
	public void grant(String ids, UserDto user);

	/**
	 * 获得用户能访问的资源地址
	 * 
	 * @param id
	 *            用户ID
	 * @return
	 */
	public List<String> resourceList(String id);

//	/**
//	 * 编辑用户密码
//	 * 
//	 * @param user
//	 */
//	public void editPwd(User user);
//
//	/**
//	 * 修改用户自己的密码
//	 * 
//	 * @param sessionInfo
//	 * @param oldPwd
//	 * @param pwd
//	 * @return
//	 */
//	public boolean editCurrentUserPwd(SessionInfo sessionInfo, String oldPwd, String pwd);

	/**
	 * 用户登录时的autocomplete
	 * 
	 * @param q
	 *            参数
	 * @return
	 */
	public List<UserDto> loginCombobox(String q);

	/**
	 * 用户登录时的combogrid
	 * 
	 * @param q
	 * @param ph
	 * @return
	 */
	public DataGrid loginCombogrid(String q, PageHelper ph);
//
//	/**
//	 * 用户创建时间图表
//	 * 
//	 * @return
//	 */
//	public List<Long> userCreateDatetimeChart();

}
