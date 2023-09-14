package kr.co.tspoon.dto;

import lombok.Data;

@Data
public class DataBoard {
    private int bno;
    private String title;
    private String content;
    private String author;
    private String regdate;
    private int visited = 0;
}
