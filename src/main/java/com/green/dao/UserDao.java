package com.green.dao;

import com.green.vo.UserVo;

import java.util.List;

public interface UserDao {
    List<UserVo> selectAll();
    int insertUser(UserVo userVo);
}
