package kr.co.tspoon.dto;

import lombok.Data;

@Data
public class DataFile {
    private int fno;
    private String fileName;
    private String saveName;
    private String fileType;
    private String relations = "dataBoard";
    private int bno;
    private String saveFolder;
}
