package com.jk.dao;

import java.util.List;

import com.jk.pojo.Tree;
import org.apache.ibatis.annotations.Select;


public interface StudentMapper {

	@Select("select * from t_menu where pid=#{pid}")
	List<Tree> queryTree(String pid);



}