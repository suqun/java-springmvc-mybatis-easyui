package snipe.mybatis.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import snipe.mybatis.model.ResourceType;
import snipe.mybatis.model.ResourceTypeExample;

public interface ResourceTypeMapper {
    int countByExample(ResourceTypeExample example);

    int deleteByExample(ResourceTypeExample example);

    int deleteByPrimaryKey(String id);

    int insert(ResourceType record);

    int insertSelective(ResourceType record);

    List<ResourceType> selectByExample(ResourceTypeExample example);

    ResourceType selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") ResourceType record, @Param("example") ResourceTypeExample example);

    int updateByExample(@Param("record") ResourceType record, @Param("example") ResourceTypeExample example);

    int updateByPrimaryKeySelective(ResourceType record);

    int updateByPrimaryKey(ResourceType record);
}