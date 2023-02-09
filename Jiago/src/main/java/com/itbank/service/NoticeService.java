package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.NoticeDTO;
import com.itbank.model.Paging;
import com.itbank.repository.NoticeDAO;

@Service
public class NoticeService {
	
	@Autowired private NoticeDAO dao;

	public List<NoticeDTO> getListAll(Paging paging) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		
		param.put("offset", paging.getOffset());
		param.put("perPage", paging.getPerPage());
		
		return dao.selectAll(param);
	}
	
	public int getNoticeCount() {
		return dao.selectNoticeCount();
	}


}
