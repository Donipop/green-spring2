package com.green.dao.impl;

import com.green.dao.NoticeDao;
import com.green.vo.NoteVo;
import com.green.vo.NoticeVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("NoticeDao")
public class NoticeDaoImpl implements NoticeDao {
    @Autowired
    private SqlSession sqlSession;
    @Override
    public List<NoticeVo> noticelist() {
        List<NoticeVo> vo = sqlSession.selectList("Notice.noticeList");
        return vo;
    }

    @Override
    public NoticeVo selectcont(int _id) {
        NoticeVo vo = sqlSession.selectOne("Notice.selectcont",_id);
        return vo;
    }

    @Override
    public void cntup(int _id) {
        sqlSession.update("Notice.cntup",_id);
    }
}
