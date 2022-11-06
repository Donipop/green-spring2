package com.green.dao;

import com.green.vo.NoteVo;

import java.util.List;

public interface NoteDao {
    void insertNote(NoteVo vo);

    List<NoteVo> selectRecept(String recept);

    List<NoteVo> selectSend(String send);

    NoteVo selectCont(int _id);
}
