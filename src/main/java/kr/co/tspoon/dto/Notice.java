package kr.co.tspoon.dto;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Notice {
    private int no;
    private String title;
    private String content;
    private String regdate;
    private int visited;
}
