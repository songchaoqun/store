package com.zbq.Controller;

import com.zbq.Model.Tree;
import com.zbq.Service.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;

@Controller
public class StoreController {

    @Autowired
    private StoreService storeService;

    @RequestMapping("main")
    public String toMain() {
        return "/main";
    }

    @RequestMapping("show")
    public String toShow() {
        return "/show";
    }

    @RequestMapping("queryTree")
    @ResponseBody
    public List<Tree> queryTree() {
        List<Tree> list = storeService.queryTree();
        return list;
    }

    @RequestMapping("query")
    @ResponseBody
    public HashMap<String, Object> query(Integer page, Integer rows) {
        return storeService.query(page, rows);
    }
}
