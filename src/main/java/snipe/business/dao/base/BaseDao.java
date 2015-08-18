/**
 * Classname BaseDao.java
 *
 * Version information
 *
 * Licensed Property to HuaTeng Data Co., Ltd.
 * 
 * (C) Copyright of HuaTeng Data Co., Ltd. 2010
 *     All Rights Reserved.
 *
 * Project Info: HuaTeng Data Internet Acquiring  Project
 * 
 * Modification History:
 * =============================================================================
 *		Author		Date		Description
 *   ------------ ---------- ---------------------------------------------------
 *		zhu8fei		2013-9-25
 * =============================================================================
 */

package snipe.business.dao.base;

import java.util.List;
import java.util.Map;

/**
 * framework : BaseDao.java
 * 
 * 基础dao接口
 * 
 * @date 2013-9-25
 * @author zhu8fei Wong
 * @version
 * 
 */
public interface BaseDao {
	/**
	 * 通过sql往数据库插入记录
	 * 
	 * @param statementName
	 * @param record
	 */
	public void insert(String statementName, Object record);

	/**
	 * 更新数据库一条记录
	 * 
	 * @param statementName
	 * @param record
	 * @return
	 */
	public int updateByPrimaryKey(String statementName, Object record);

	/**
	 * 有选择的更新数据库一条记录
	 * 
	 * @param record
	 * @return
	 */
	public int updateByPrimaryKeySelective(String statementName, Object record);

	/**
	 * 更新数据库记录
	 * 
	 * @param namespace
	 * @param record
	 * @return
	 */
	public int update(String statementName, Object record);

	/**
	 * 通过主键查找对象.通常直接使用mapper中的方法
	 * 
	 * @param statementName
	 * @param key
	 * @return
	 */
	public Object selectByPrimaryKey(String statementName, Object key);

	/**
	 * 查询list
	 * 
	 * @param statementName
	 * @param parameterObject
	 * @return
	 */
	public List<?> selectList(final String statementName,
			final Object parameterObject);

	/**
	 * 查询list
	 * 
	 * @param namespace
	 * @param statementName
	 * @param parameterObject
	 * @return
	 */
	public List<?> selectList(final String namespace,
			final String statementName, final Object parameterObject);

	/**
	 * 查询list
	 * 
	 * @param statementName
	 * @param parameterObject
	 * @param skipResults
	 * @param maxResults
	 * @return
	 */
	public List<?> selectList(final String statementName,
			final Object parameterObject, final int skipResults,
			final int maxResults);

	/**
	 * 查询对象.
	 * 
	 * @param statementName
	 * @param parameterObject
	 * @return
	 */
	public Object selectObject(final String statementName,
			final Object parameterObject);

	/**
	 * 查询对象
	 * 
	 * @param nameSpace
	 * @param statementName
	 * @param parameterObject
	 * @return
	 */
	public Object selectObject(final String nameSpace,
			final String statementName, final Object parameterObject);

	/**
	 * 查询MAP
	 * 
	 * @param statementName
	 * @param parameterObject
	 * @param keyProperty
	 * @return
	 */
	public Map<String, ?> selectMap(final String statementName,
			final Object parameterObject, final String keyProperty);
//
//	/**
//	 * 分页查询
//	 * 
//	 * @param statementName
//	 * @param parameterObject
//	 * @return
//	 */
//	public Page<?> pageQuery(final String statementName,
//			final Page<?> parameterObject);
//
//	/**
//	 * 分页查询
//	 * 
//	 * @param nameSpace
//	 * @param statementName
//	 * @param parameterObject
//	 * @return
//	 */
//	public Page<?> pageQuery(final String nameSpace,
//			final String statementName, final Page<?> parameterObject);

}
