package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.BoardDTO;
import com.itbank.model.Paging;
import com.itbank.repository.BoardDAO;

@Service
public class BoardService {
	
	@Autowired private BoardDAO dao;

	public List<BoardDTO> getListAll(Paging paging) {
HashMap<String, Object> param = new HashMap<String, Object>();
		
		param.put("offset", paging.getOffset());
		param.put("perPage", paging.getPerPage());
		
		return dao.selectAll(param);
	}

	public int getBoardCount() {
		return dao.selectBoardCount();
	}

	public BoardDTO get(int qboard_idx) {
		dao.updateViewCount(qboard_idx);
		return dao.selectOne(qboard_idx);
	}

}
