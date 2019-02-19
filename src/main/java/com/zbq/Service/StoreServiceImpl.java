package com.zbq.Service;

import com.zbq.Mapper.StoreMapper;
import com.zbq.Model.House;
import com.zbq.Model.Tree;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class StoreServiceImpl implements StoreService {

    @Autowired
    private StoreMapper storeMapper;

    @Override
    public List<Tree> queryTree() {
        return storeMapper.queryTree();
    }

    @Override
    public HashMap<String, Object> query(Integer page, Integer rows) {
        HashMap<String, Object> hashMap = new HashMap<>();
        //查询总条数
        long total = storeMapper.queryTotal();
        //查询显示信息
        //开始位置
        int start = (page - 1) * rows;
        List<House> list = (List<House>) storeMapper.query(start, rows);
        hashMap.put("total", total);
        hashMap.put("rows", list);
        return hashMap;
    }

}
