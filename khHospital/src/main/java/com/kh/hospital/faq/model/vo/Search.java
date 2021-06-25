package com.kh.hospital.faq.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Search {
	private int searchId;
	private int cid;
	private String searchCondition;
	private String searchValue;
}
