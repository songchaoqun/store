package com.zbq.Service;

import com.zbq.Model.Tree;

import java.util.HashMap;
import java.util.List;

public interface StoreService {
    List<Tree> queryTree();

    HashMap<String, Object> query(Integer page, Integer rows);
}
