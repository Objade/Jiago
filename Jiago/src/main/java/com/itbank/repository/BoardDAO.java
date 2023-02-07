package com.itbank.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.itbank.model.BoardDTO;

@Repository
public interface BoardDAO {

	List<BoardDTO> selectAll(HashMap<String, Object> param);

	int selectBoardCount();

	void updateViewCount(int qboard_idx);

	BoardDTO selectOne(int qboard_idx);

}
