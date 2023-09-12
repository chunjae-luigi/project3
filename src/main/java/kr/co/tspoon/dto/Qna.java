package kr.co.tspoon.dto;

import lombok.*;


@Data
public class Qna {
    private int qno;
    private String title;
    private String content;
    private String author;
    private String regdate;
    private int visited = 0;
    private int lev = 0;
    private int par = 0;
}
