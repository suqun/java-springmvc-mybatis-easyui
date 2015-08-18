/**
 * Classname BaseDaoImpl.java
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

import java.sql.SQLException;
import java.sql.Statement;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.StatementCallback;
import org.springframework.stereotype.Repository;

/**
 * framework : BaseDaoImpl.java
 * 
 * @date 2013-9-25
 * @author zhu8fei Wong
 * @version
 * 
 */
@Repository
public class BaseDaoImpl extends SqlSessionDaoSupport implements BaseDao {
	/**
	 * mybatis 神奇的 log4j
	 */

	// private SiteLogs log = new SiteLogs(BaseDaoImpl.class);

	public void insert(String statementName, Object record) {
		getSqlSession().insert( statementName, record);
	}

	public int update(String statementName, Object record) {
		return getSqlSession().update( statementName, record);
	}

	public Object selectByPrimaryKey(String statementName, Object key) {
		Object record = getSqlSession().selectOne( statementName,
				key);
		return record;
	}

	public int updateByPrimaryKey(String statementName, Object record) {
		int rows = getSqlSession().update( statementName, record);
		return rows;
	}

	public int updateByPrimaryKeySelective(String statementName, Object record) {
		int rows = getSqlSession().update( statementName, record);
		return rows;
	}

	@SuppressWarnings("unchecked")
	public List selectList(final String statementName,
			final Object parameterObject) {
		List result = getSqlSession().selectList( statementName,
				parameterObject);
		return result;
	}

	public Object selectObject(final String statementName,
			final Object parameterObject) {
		Object result = getSqlSession().selectOne( statementName,
				parameterObject);
		return result;
	}

	public Object selectObject(final String nameSpace,
			final String statementName, final Object parameterObject) {
		Object result = getSqlSession()
				.selectOne(nameSpace + "." +  statementName,
						parameterObject);
		return result;
	}

	@SuppressWarnings("unchecked")
	public List selectList(final String namespace, final String statementName,
			final Object parameterObject) {
		List result = getSqlSession()
				.selectList(namespace + "." +  statementName,
						parameterObject);
		return result;
	}

	@SuppressWarnings("unchecked")
	public List selectList(final String statementName,
			final Object parameterObject, final int skipResults,
			final int maxResults) {

		RowBounds bounds = new RowBounds(skipResults, maxResults);

		List result = getSqlSession().selectList( statementName,
				parameterObject, bounds);
		return result;
	}

	@SuppressWarnings("unchecked")
	public Map selectMap(final String statementName,
			final Object parameterObject, final String keyProperty) {
		return getSqlSession().selectMap( statementName,
				parameterObject, keyProperty);
	}
	
//	@SuppressWarnings("unchecked")
//	@Override
//	public Page<?> pageQuery(final String statementName,
//			final Page<?> parameterObject) {
//		parameterObject.setRows(selectList(statementName, parameterObject));
//		return parameterObject;
//	}
//
//	@Override
//	public Page<?> pageQuery(final String nameSpace,
//			final String statementName, final Page<?> parameterObject) {
//		return pageQuery(nameSpace + "." + statementName, parameterObject);
//	}
}
