package snipe.mybatis.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import snipe.mybatis.model.RoleResourceExample;
import snipe.mybatis.model.RoleResourceKey;

public interface RoleResourceMapper {
    int countByExample(RoleResourceExample example);

    int deleteByExample(RoleResourceExample example);

    int deleteByPrimaryKey(RoleResourceKey key);

    int insert(RoleResourceKey record);

    int insertSelective(RoleResourceKey record);

    List<RoleResourceKey> selectByExample(RoleResourceExample example);

    int updateByExampleSelective(@Param("record") RoleResourceKey record, @Param("example") RoleResourceExample example);

    int updateByExample(@Param("record") RoleResourceKey record, @Param("example") RoleResourceExample example);
}