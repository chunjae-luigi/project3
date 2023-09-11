package kr.co.tspoon.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString

public class QnA {
    private int qno;
    private String title;
    private String content;
    private String author;
    private String regdate;
    private int cnt = 0;
    private int lev = 0;
    private int par = 0;
}
