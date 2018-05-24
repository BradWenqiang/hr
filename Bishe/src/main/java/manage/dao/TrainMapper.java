package manage.dao;

import java.util.List;

import manage.base.BaseMapper;
import manage.base.BaseService;
import manage.model.Employee;
import manage.model.Train;
import manage.util.PageInfo;

public interface TrainMapper extends BaseMapper<Train>{
    int deleteByPrimaryKey(String tid);

    int insert(Train record);

    int insertSelective(Train record);

    Train selectByPrimaryKey(String tid);

    int updateByPrimaryKeySelective(Train record);

    int updateByPrimaryKey(Train record);
    
    List<Train> selectAllListPage(PageInfo page);
}