package com.zbq.Mapper;

import com.zbq.Model.House;
import com.zbq.Model.Tree;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;


public interface StoreMapper {
    List<Tree> queryTree();

    long queryTotal();

    List<House> query(@Param("start") int start, @Param("rows") Integer rows);
}
