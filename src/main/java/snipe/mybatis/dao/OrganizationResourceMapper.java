package snipe.mybatis.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import snipe.mybatis.model.OrganizationResourceExample;
import snipe.mybatis.model.OrganizationResourceKey;

public interface OrganizationResourceMapper {
    int countByExample(OrganizationResourceExample example);

    int deleteByExample(OrganizationResourceExample example);

    int deleteByPrimaryKey(OrganizationResourceKey key);

    int insert(OrganizationResourceKey record);

    int insertSelective(OrganizationResourceKey record);

    List<OrganizationResourceKey> selectByExample(OrganizationResourceExample example);

    int updateByExampleSelective(@Param("record") OrganizationResourceKey record, @Param("example") OrganizationResourceExample example);

    int updateByExample(@Param("record") OrganizationResourceKey record, @Param("example") OrganizationResourceExample example);
}