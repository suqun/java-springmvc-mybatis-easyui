package snipe.business.service;

import java.util.List;

import snipe.mybatis.model.Resource;
import snipe.pageModel.ResourceDto;
import snipe.pageModel.base.SessionInfo;
import snipe.pageModel.easyUI.Tree;

/**
 * 资源Service
 * 
 * @author 孙宇
 * 
 */
public interface ResourceServiceI {

	/**
	 * 获得资源树(资源类型为菜单类型)
	 * 
	 * 通过用户ID判断，他能看到的资源
	 * 
	 * @param sessionInfo
	 * @return
	 */
	public List<Tree> tree(SessionInfo sessionInfo);

	/**
	 * 获得资源树(包括所有资源类型)
	 * 
	 * 通过用户ID判断，他能看到的资源
	 * 
	 * @param sessionInfo
	 * @return
	 */
	public List<Tree> allTree(SessionInfo sessionInfo);

	/**
	 * 获得资源列表
	 * 
	 * @param sessionInfo
	 * 
	 * @return
	 */
	public List<ResourceDto> treeGrid(SessionInfo sessionInfo);

	/**
	 * 添加资源
	 * 
	 * @param resource
	 * @param sessionInfo
	 */
	public void add(Resource resource, SessionInfo sessionInfo);

	/**
	 * 删除资源
	 * 
	 * @param id
	 */
	public void delete(String id);

	/**
	 * 修改资源
	 * 
	 * @param resource
	 */
	public void edit(Resource resource);

	/**
	 * 获得一个资源
	 * 
	 * @param id
	 * @return
	 */
	public ResourceDto get(String id);

}
