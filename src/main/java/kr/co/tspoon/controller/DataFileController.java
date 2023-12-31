package kr.co.tspoon.controller;

import kr.co.tspoon.dto.DataBoard;
import kr.co.tspoon.dto.DataFile;
import kr.co.tspoon.service.BoardService;
import kr.co.tspoon.service.DataFileService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/dataFile/*")
public class DataFileController {
    @Autowired
    private DataFileService dataFileService;

    @Autowired
    private BoardService boardService;


    @RequestMapping(value="upload.do", method = RequestMethod.POST)
    public void dataBoardUpload(HttpServletRequest request,
                                HttpServletResponse response, @RequestParam MultipartFile upload) throws Exception{
        // 랜덤 문자 생성
        UUID uid = UUID.randomUUID();
        OutputStream out = null;
        PrintWriter printWriter = null;

        //인코딩
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        try{
            //파일 이름 가져오기
            String fileName = upload.getOriginalFilename();
            byte[] bytes = upload.getBytes();
            //이미지 경로 생성

            String path = request.getRealPath("/resource/uploadCkImage/");
            String ckUploadPath = path + uid + "_" + fileName;

            File folder = new File(path);

            //해당 디렉토리 확인
            if(!folder.exists()){
                try{
                    folder.mkdirs(); // 폴더 생성
                }catch(Exception e){
                    e.getStackTrace();
                }
            }
            out = new FileOutputStream(new File(ckUploadPath));
            out.write(bytes);
            out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화

            String callback = request.getParameter("CKEditorFuncNum");
            printWriter = response.getWriter();

            String rootPath = request.getContextPath();
            String fileUrl = rootPath+"/dataFile/submit.do?uid=" + uid + "&fileName=" + fileName; // 작성화면

            // 업로드시 메시지 출력
            printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
            printWriter.flush();
        } catch(IOException e){
            e.printStackTrace();
        } finally {
            try {
                if(out != null) { out.close(); }
                if(printWriter != null) { printWriter.close(); }
            } catch(IOException e) { e.printStackTrace(); }
        }
    }


    @RequestMapping(value="submit.do")
    public void ckSubmit(@RequestParam(value="uid") String uid, @RequestParam(value="fileName") String fileName, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        //서버에 저장된 이미지 경로
        String path = request.getRealPath("/resource/uploadCkImage/");
        String sDirPath = path + uid + "_" + fileName;
        File imgFile = new File(sDirPath);

        //사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
        if(imgFile.isFile()){
            byte[] buf = new byte[1024];
            int readByte = 0;
            int length = 0;
            byte[] imgBuf = null;
            FileInputStream fileInputStream = null;
            ByteArrayOutputStream outputStream = null;
            ServletOutputStream out = null;
            try{
                fileInputStream = new FileInputStream(imgFile);
                outputStream = new ByteArrayOutputStream();
                out = response.getOutputStream();
                while((readByte = fileInputStream.read(buf)) != -1){
                    outputStream.write(buf, 0, readByte);
                }
                imgBuf = outputStream.toByteArray();
                length = imgBuf.length;
                out.write(imgBuf, 0, length);
                out.flush();
            }catch(IOException e){
                e.printStackTrace();
            }finally {
                outputStream.close();
                fileInputStream.close();
                out.close();
            }
        }
    }

    @RequestMapping(value = "delete.do")
    public String deleteFile(HttpServletRequest request,  Model model) throws Exception {
        int fno = Integer.parseInt(request.getParameter("fno"));
        int bno = Integer.parseInt(request.getParameter("bno"));

        dataFileService.dataFileDelete(fno);

        DataBoard dto = boardService.dataBoardGet(bno);
        DataFile temp = new DataFile();
        temp.setBno(bno);
        temp.setRelations("databoard");
        List<DataFile> dataFiles = dataFileService.dataFileBoardList(temp);

        model.addAttribute("dto", dto);
        model.addAttribute("dataFiles", dataFiles);

        return "/board/dataBoard/dataBoardUpdate";
    }


}
