package snipe.mybatis.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import snipe.mybatis.model.UserOrganizationExample;
import snipe.mybatis.model.UserOrganizationKey;

public interface UserOrganizationMapper {
    int countByExample(UserOrganizationExample example);

    int deleteByExample(UserOrganizationExample example);

    int deleteByPrimaryKey(UserOrganizationKey key);

    int insert(UserOrganizationKey record);

    int insertSelective(UserOrganizationKey record);

    List<UserOrganizationKey> selectByExample(UserOrganizationExample example);

    int updateByExampleSelective(@Param("record") UserOrganizationKey record, @Param("example") UserOrganizationExample example);

    int updateByExample(@Param("record") UserOrganizationKey record, @Param("example") UserOrganizationExample example);
}