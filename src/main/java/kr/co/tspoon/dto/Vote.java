package kr.co.tspoon.dto;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Vote {

    private int vno;
    private String title;
    private String content;
    private String regDate;
    private int visited;
    private String startDate;
    private String finishDate;
    private boolean useYn;

}