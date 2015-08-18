package snipe.mybatis.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import snipe.mybatis.model.Online;
import snipe.mybatis.model.OnlineExample;

public interface OnlineMapper {
    int countByExample(OnlineExample example);

    int deleteByExample(OnlineExample example);

    int deleteByPrimaryKey(String id);

    int insert(Online record);

    int insertSelective(Online record);

    List<Online> selectByExample(OnlineExample example);

    Online selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") Online record, @Param("example") OnlineExample example);

    int updateByExample(@Param("record") Online record, @Param("example") OnlineExample example);

    int updateByPrimaryKeySelective(Online record);

    int updateByPrimaryKey(Online record);
}