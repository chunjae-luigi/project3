package kr.co.tspoon.controller;

import kr.co.tspoon.dto.DataBoard;
import kr.co.tspoon.dto.DataFile;
import kr.co.tspoon.dto.Qna;
import kr.co.tspoon.service.BoardService;
import kr.co.tspoon.service.DataFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/board/*")
public class BoardController {

    @Autowired
    private BoardService boardService;

    @Autowired
    private DataFileService dataFileService;

    // DataBoard
    @GetMapping("dataBoard/list.do")
    public String dataBoardList(Model model) throws Exception {
        List<DataBoard> boardList = boardService.dataBoardList();
        model.addAttribute("fileboardList", boardList);
        return "/board/dataBoard/dataBoardList";
    }

    @GetMapping("dataBoard/get.do")
    public String dataBoardGet(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        DataBoard dto = boardService.dataBoardGet(bno);

        List<DataFile> dataFileList = new ArrayList<>();
        if(dto.getRelations().equals("yes")){
            DataFile file = new DataFile();
            file.setRelations("dataBoard");
            file.setBno(bno);
            dataFileList = dataFileService.dataFileBoardList(file);
            model.addAttribute("fileList", dataFileList);
        }
        model.addAttribute("dto", dto);
        return "/board/dataBoard/dataBoardGet";
    }

    @GetMapping("dataBoard/insert.do")
    public String dataBoardInsertForm(HttpServletRequest request, Model model) throws Exception {
        return "/board/dataBoard/dataBoardInsert";
    }

    @PostMapping("dataBoard/insert.do")
    public String dataBoardInsert(HttpServletRequest request,
                                  HttpServletResponse response, MultipartHttpServletRequest multiFile, @RequestParam MultipartFile upload) throws Exception {
        DataBoard dto = new DataBoard();
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        boardService.dataBoardInsert(dto);

        return "redirect:dataBoard/list.do";
    }

    @GetMapping("dataBoard/delete.do")
    public String dataBoardDelete(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        boardService.dataBoardDelete(bno);

        return "redirect:dataBoard/list.do";
    }

    @GetMapping("dataBoard/update.do")
    public String dataBoardUpdateForm(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        DataBoard dto = boardService.dataBoardGet(bno);
        model.addAttribute("dto", dto);
        return "/board/dataBoard/dataBoardUpdate";
    }

    @PostMapping("dataBoard/update.do")
    public String dataBoardUpdate(HttpServletRequest request, Model model) throws Exception {
        DataBoard dto = new DataBoard();
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        boardService.dataBoardUpdate(dto);

        return "redirect:dataBoard/list.do";
    }

    // Qna
    @GetMapping("qna/list.do")
    public String qnaList(Model model) throws Exception {
        List<Qna> qnaList = boardService.qnaList();
        model.addAttribute("qnaList", qnaList);
        return "/board/qna/qnaList";
    }

    @GetMapping("qna/get.do")
    public String qnaGet(HttpServletRequest request, Model model) throws Exception {
        int qno = Integer.parseInt(request.getParameter("qno"));
        Qna dto = boardService.qnaGet(qno);
        model.addAttribute("dto", dto);
        return "/board/qna/qnaDetail";
    }

    @GetMapping("qna/insert.do")
    public String qnaInsertForm(HttpServletRequest request, Model model) throws Exception {
        return "/board/qna/qnaInsert";
    }

    @PostMapping("qna/insert.do")
    public String qnaInsert(HttpServletRequest request, Model model) throws Exception {
        Qna dto = new Qna();
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        boardService.qnaInsert(dto);
        return "redirect:qna/list.do";
    }

    @GetMapping("qna/delete.do")
    public String qnaDelete(HttpServletRequest request, Model model) throws Exception {
        int qno = Integer.parseInt(request.getParameter("qno"));
        boardService.qnaDelete(qno);

        return "redirect:qna/list.do";
    }

    @GetMapping("qna/update.do")
    public String qnaUpdateForm(HttpServletRequest request, Model model) throws Exception {
        int qno = Integer.parseInt(request.getParameter("qno"));
        Qna dto = boardService.qnaGet(qno);
        model.addAttribute("dto", dto);
        return "/board/qna/qnaUpdate";
    }

    @PostMapping("qna/update.do")
    public String qnaUpdate(HttpServletRequest request, Model model) throws Exception {
        Qna dto = new Qna();
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        boardService.qnaUpdate(dto);

        return "redirect:qna/list.do";
    }
}
