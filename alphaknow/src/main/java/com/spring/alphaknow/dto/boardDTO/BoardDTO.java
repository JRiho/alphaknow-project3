package com.spring.alphaknow.dto.boardDTO;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardDTO {
	private int boardNum;
    private String boardTitle;
    private String boardContent;
    private String employeeName;
    private Date createdDate;
    private int boardViews;
    private int employeeKey;
}

