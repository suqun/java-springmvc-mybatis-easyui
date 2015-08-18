package snipe.business.service;

import java.util.List;

import snipe.mybatis.model.Role;
import snipe.pageModel.RoleDto;
import snipe.pageModel.base.SessionInfo;
import snipe.pageModel.easyUI.Tree;

/**
 * 角色业务逻辑
 * 
 * @author 孙宇
 * 
 */
public interface RoleServiceI {

	/**
	 * 保存角色
	 * 
	 * @param role
	 */
	public void add(RoleDto dto, SessionInfo sessionInfo);

	/**
	 * 获得角色
	 * 
	 * @param id
	 * @return
	 */
	public RoleDto getRoleById(String id);

	/**
	 * 编辑角色
	 * 
	 * @param role
	 */
	public void edit(RoleDto roledto);

	/**
	 * 获得角色treeGrid
	 * 
	 * @return
	 */
	public List<RoleDto> treeGrid(SessionInfo sessionInfo);

	/**
	 * 删除角色
	 * 
	 * @param id
	 */
	public void delete(String id);

	/**
	 * 获得角色树(只能看到自己拥有的角色)
	 * 
	 * @return
	 */
	public List<Tree> tree(SessionInfo sessionInfo);

	/**
	 * 获得角色树
	 * 
	 * @return
	 */
	public List<Tree> allTree();

	/**
	 * 为角色授权
	 * 
	 * @param role
	 */
	public void grant(RoleDto roledto);

}
