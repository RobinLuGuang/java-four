package com.jk.service;

import com.jk.dao.StudentMapper;
import com.jk.pojo.Tree;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookService {

    @Autowired
    private StudentMapper studentMapper;


    public List<Tree> queryTree(String pid) {
        List<Tree> menus = studentMapper.queryTree(pid);
        if(menus != null && menus.size()>0){
            for (int i = 0; i < menus.size(); i++) {
                List<Tree> menu2 = queryTree(menus.get(i).getId());
                menus.get(i).setNodes(menu2);
            }
        }
        return menus;
    }
}
