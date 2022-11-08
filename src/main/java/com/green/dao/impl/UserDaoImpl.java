package com.green.dao.impl;

import com.green.dao.UserDao;
import com.green.vo.UserVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository("userDao")
public class UserDaoImpl implements UserDao {
    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<UserVo> selectAll() {
        return sqlSession.selectList("User.selectAll");
    }

    @Override
    public int insertUser(UserVo userVo) {
        return sqlSession.insert("User.insertUser", userVo);
    }

    @Override
    public int usernameCheck(String username) {
        return sqlSession.selectOne("User.usernameCheck", username);
    }
    @Override
    public int nicknameCheck(String usernickname) {
        return sqlSession.selectOne("User.nicknameCheck", usernickname);
    }

    @Override
    public void insertInfo(UserVo userVo) {
        sqlSession.insert("User.insertInfo", userVo);
    }

    @Override
    public String loginPasswordCheck(String username) {
        return sqlSession.selectOne("User.loginPasswordCheck", username);
    }

    @Override
    public UserVo selectUserInfoByUsername(String username) {
        return sqlSession.selectOne("User.selectUserInfoByUsername", username);
    }
    @Override
    public String findId(String useremail) {
        return sqlSession.selectOne("User.findId", useremail);
    }

    @Override
    public String findPasswd(HashMap<String, String> map) {
        return sqlSession.selectOne("User.findPasswd", map);
    }

    @Override
    public void updatePassword(HashMap<String,String> map) {
        sqlSession.update("User.updatePassword", map);
    }
}


