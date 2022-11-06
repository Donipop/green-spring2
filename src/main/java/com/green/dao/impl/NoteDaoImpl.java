package com.green.dao.impl;

import com.green.dao.NoteDao;
import com.green.vo.NoteVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("NoteDao")
public class NoteDaoImpl implements NoteDao {
    @Autowired
    private SqlSession sqlSession;

    @Override
    public void insertNote(NoteVo vo) {
        sqlSession.insert("Note.insertNote",vo);
    }

    @Override
    public List<NoteVo> selectRecept(String recept) {
        List<NoteVo> vo = sqlSession.selectList("Note.selectRecept",recept);
        return vo;
    }

    @Override
    public List<NoteVo> selectSend(String send) {
        List<NoteVo> vo = sqlSession.selectList("Note.selectSend",send);
        return vo;
    }

    @Override
    public NoteVo selectCont(int _id) {
        NoteVo vo = sqlSession.selectOne("Note.selectCont",_id);
        return vo;
    }
}
