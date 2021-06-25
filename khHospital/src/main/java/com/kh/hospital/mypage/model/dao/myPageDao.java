package com.kh.hospital.mypage.model.dao;

import java.util.List;

import com.kh.hospital.mypage.model.vo.PageInfo;
import com.kh.hospital.appointment.model.vo.OnlineAppointment;
import com.kh.hospital.counsel.model.vo.Counsel;
import com.kh.hospital.member.model.vo.Member;

public interface myPageDao {

	int updateMember(Member m);

	int deleteMember(String userId);

	int updatePwd(Member m);

	int selectListCount(String userId);

	List<Counsel> selectList(PageInfo pi, String userId);

	int selectoListCount(String userId);

	List<OnlineAppointment> selectoList(PageInfo pi, String userId);

	int selectOnline(int aid);


}
