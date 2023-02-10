package com.itbank.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.itbank.model.NoticeDTO;

@Repository
public interface NoticeDAO {
	
	List<NoticeDTO> selectAll(HashMap<String, Object> param);

	int selectNoticeCount();

	List<NoticeDTO> search(String notice_name);

	int insert(NoticeDTO dto);

	NoticeDTO selectOne(int notice_idx);

	int modify(NoticeDTO dto);

	int delete(int notice_idx);


}
