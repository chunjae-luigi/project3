package kr.co.tspoon.controller;

import kr.co.tspoon.dto.DataBoard;
import kr.co.tspoon.dto.DataFile;
import kr.co.tspoon.dto.Notice;
import kr.co.tspoon.dto.Qna;
import kr.co.tspoon.service.BoardService;
import kr.co.tspoon.service.DataFileService;
import kr.co.tspoon.util.Page;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/board/*")
public class BoardController {
    @Autowired
    private BoardService boardService;

    @Autowired
    private DataFileService dataFileService;

    // DataBoard
    @GetMapping("dataBoardList.do")
    public String dataBoardList(HttpServletRequest request, Model model) throws Exception {
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = boardService.dataBoardCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);

        List<DataBoard> boardList = boardService.dataBoardList(page);
        model.addAttribute("fileboardList", boardList);
        return "/board/dataBoard/dataBoardList";
    }

    @GetMapping("dataBoardGet.do")
    public String dataBoardGet(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        DataBoard dto = boardService.dataBoardGet(bno);
        DataFile temp = new DataFile();
        temp.setBno(bno);
        temp.setRelations("databoard");
        List<DataFile> dataFiles = dataFileService.dataFileBoardList(temp);

        model.addAttribute("dto", dto);
        model.addAttribute("dataFiles", dataFiles);
        return "/board/dataBoard/dataBoardGet";
    }

    @GetMapping("dataBoardInsert.do")
    public String dataBoardInsertForm() {
        return "/board/dataBoard/dataBoardInsert";
    }


    // private static String uploadFolder = "D:\\sangmin0816\\luigi\\project3\\src\\main\\webapp\\resources\\upload";

    @PostMapping("dataBoardInsert.do")
    public String dataBoardInsert(MultipartHttpServletRequest files, HttpServletRequest req, Model model) throws Exception {
        String realFolder = req.getRealPath("/resources/upload");

        DataBoard dto = new DataBoard();

        Enumeration<String> e = files.getParameterNames();
        Map map = new HashMap();
        while (e.hasMoreElements()) {
            String name = e.nextElement();
            String value = files.getParameter(name);
            map.put(name, value);
        }

        dto.setTitle((String) map.get("title"));
        dto.setContent((String) map.get("contents"));
        dto.setAuthor((String) map.get("sid"));

        String today = new SimpleDateFormat("yyMMdd").format(new Date());
        String saveFolder = realFolder + File.separator + today;
        File folder = new File(saveFolder);

        if(!folder.exists()){
            folder.mkdirs();
        }

        List<MultipartFile> fileList = files.getFiles("uploadFiles");

        for(MultipartFile multipartFile : fileList){
            String originalName = multipartFile.getOriginalFilename();
            if(!originalName.isEmpty()){
                String saveName = UUID.randomUUID().toString()+"_"+originalName;

                DataFile dataFile = new DataFile();
                dataFile.setBno(0);
                dataFile.setFileName(originalName);
                dataFile.setSaveName(saveName);
                dataFile.setFileType(multipartFile.getContentType());
                dataFile.setSaveFolder(today);

                dataFileService.dataFileInsert(dataFile);

                File savefile = new File(saveFolder, saveName);

                try{
                    multipartFile.transferTo(savefile);
                } catch (Exception except){
                    System.out.println(except.getMessage());
                }
            }
        }


        boardService.dataBoardInsert(dto);

        return "redirect:dataBoardList.do";
    }

    @GetMapping("dataBoardDelete.do")
    public String dataBoardDelete(HttpServletRequest request) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        boardService.dataBoardDelete(bno);

        return "redirect:dataBoardList.do";
    }

    @GetMapping("dataBoardUpdate.do")
    public String dataBoardUpdateForm(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));

        DataBoard dto = boardService.dataBoardGet(bno);
        DataFile temp = new DataFile();
        temp.setBno(bno);
        temp.setRelations("databoard");
        List<DataFile> dataFiles = dataFileService.dataFileBoardList(temp);

        model.addAttribute("dto", dto);
        model.addAttribute("dataFiles", dataFiles);

        return "/board/dataBoard/dataBoardUpdate";
    }

    @PostMapping("dataBoardUpdate.do")
    public String dataBoardUpdatePro(MultipartHttpServletRequest files, HttpServletRequest req, Model model) throws Exception {
        String realFolder = req.getRealPath("/resources/upload");

        DataBoard dto = new DataBoard();

        Enumeration<String> e = files.getParameterNames();
        Map map = new HashMap();
        while (e.hasMoreElements()) {
            String name = e.nextElement();
            String value = files.getParameter(name);
            map.put(name, value);
        }

        int bno = Integer.parseInt((String) map.get("bno"));
        dto.setBno(bno);
        dto.setTitle((String) map.get("title"));
        dto.setContent((String) map.get("contents"));

        String today = new SimpleDateFormat("yyMMdd").format(new Date());
        String saveFolder = realFolder + File.separator + today;
        File folder = new File(saveFolder);

        if(!folder.exists()){
            folder.mkdirs();
        }

        List<MultipartFile> fileList = files.getFiles("uploadFiles");

        for(MultipartFile multipartFile : fileList){
            String originalName = multipartFile.getOriginalFilename();
            if(!originalName.isEmpty()){
                String saveName = UUID.randomUUID().toString()+"_"+originalName;

                DataFile dataFile = new DataFile();
                dataFile.setBno(bno);
                dataFile.setFileName(originalName);
                dataFile.setSaveName(saveName);
                dataFile.setFileType(multipartFile.getContentType());
                dataFile.setSaveFolder(saveFolder);

                dataFileService.dataFileInsert(dataFile);

                File savefile = new File(saveFolder, saveName);

                try{
                    multipartFile.transferTo(savefile);
                } catch (Exception except){
                    System.out.println(except.getMessage());
                }
            }
        }


        boardService.dataBoardUpdate(dto);

        return "redirect:dataBoardList.do";
    }


    // Qna
    @GetMapping("qnaList.do")
    public String qnaList(HttpServletRequest request, Model model) throws Exception {
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = boardService.qnaCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);

        List<Qna> qnaList = boardService.qnaList(page);
        model.addAttribute("qnaList", qnaList);
        return "/board/qna/qnaList";
    }

    @GetMapping("qnaGet.do")
    public String qnaGet(HttpServletRequest request, Model model) throws Exception {
        int qno = Integer.parseInt(request.getParameter("qno"));
        Qna dto = boardService.qnaGet(qno);
        model.addAttribute("qna", dto);
        return "/board/qna/qnaGet";
    }

    @GetMapping("qnaInsert.do")
    public String qnaInsertForm(HttpServletRequest request, Model model) throws Exception {
        int lev = Integer.parseInt(request.getParameter("lev"));
        int par = Integer.parseInt(request.getParameter("par"));
        model.addAttribute("lev", lev);
        model.addAttribute("par", par);
        return "/board/qna/qnaInsert";
    }

    @PostMapping("qnaInsert.do")
    public String qnaInsert(HttpServletRequest request) throws Exception {
        Qna dto = new Qna();
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        dto.setAuthor(request.getParameter("author"));
        dto.setLev(Integer.parseInt(request.getParameter("lev")));
        dto.setPar(Integer.parseInt(request.getParameter("par")));

        boardService.qnaInsert(dto);
        return "redirect:qnaList.do";
    }

    @GetMapping("qnaDelete.do")
    public String qnaDelete(HttpServletRequest request) throws Exception {
        int qno = Integer.parseInt(request.getParameter("qno"));
        boardService.qnaDelete(qno);

        return "redirect:qnaList.do";
    }

    @GetMapping("qnaUpdate.do")
    public String qnaUpdateForm(HttpServletRequest request, Model model) throws Exception {
        int qno = Integer.parseInt(request.getParameter("qno"));
        Qna dto = boardService.qnaGet(qno);
        model.addAttribute("qna", dto);
        return "/board/qna/qnaUpdate";
    }

    @PostMapping("qnaUpdate.do")
    public String qnaUpdate(HttpServletRequest request) throws Exception {
        Qna dto = new Qna();
        dto.setQno(Integer.parseInt(request.getParameter("qno")));
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        boardService.qnaUpdate(dto);

        return "redirect:qnaList.do";
    }
}
