package kr.co.tspoon.dto;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class VoteCountVo {

    private int lno;
    private int vno;
    private String title;
    private int cnt;
    private String colorNum;

}