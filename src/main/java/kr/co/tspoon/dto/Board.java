package kr.co.tspoon.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString

public class Board {
    private int bno;
    private String boardType;
    private String title;
    private String content;
    private String author;
    private String relatinos = "no";
    private String regdate;
    private int visited = 0;
}
