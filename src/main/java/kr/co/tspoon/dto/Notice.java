package kr.co.tspoon.dto;

import lombok.Data;

@Data
public class Notice {
    private int no;
    private String title;
    private String content;
    private String regdate;
    private int visited;
}
