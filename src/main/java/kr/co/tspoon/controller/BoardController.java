package kr.co.tspoon.controller;

import kr.co.tspoon.dto.DataBoard;
import kr.co.tspoon.dto.DataFile;
import kr.co.tspoon.dto.Notice;
import kr.co.tspoon.dto.Qna;
import kr.co.tspoon.service.BoardService;
import kr.co.tspoon.service.DataFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

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

    @GetMapping("databoard/insert.do")
    public String dataBoardInsertForm(HttpServletRequest request, Model model) throws Exception {
        return "/board/boardInsert";
    }

    @PostMapping("databoard/insert.do")
    public String dataBoardInsert(HttpServletRequest request, Model model) throws Exception {
        DataBoard dto = new DataBoard();
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        boardService.dataBoardInsert(dto);
        return "redirect:list.do";
    }

    @GetMapping("dataBoard/delete.do")
    public String dataBoardDelete(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        boardService.dataBoardDelete(bno);

        return "redirect:list.do";
    }

    @GetMapping("dataBoard/update.do")
    public String dataBoardUpdateForm(HttpServletRequest request, Model model) throws Exception {
        int bno = Integer.parseInt(request.getParameter("bno"));
        DataBoard dto = boardService.dataBoardGet(bno);
        model.addAttribute("dto", dto);
        return "board/boardEdit";
    }

    @PostMapping("dataBoard/update.do")
    public String dataBoardUpdate(HttpServletRequest request, Model model) throws Exception {
        DataBoard dto = new DataBoard();
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        boardService.dataBoardUpdate(dto);

        return "redirect:list.do";
    }



    // Qna
    @GetMapping("qna/list.do")
    public String qnaList(Model model) throws Exception {
        List<Qna> qnaList = boardService.qnaList();
        model.addAttribute("qnaList", qnaList);
        return "/qna/qnaList";
    }

    @GetMapping("qna/get.do")
    public String qnaGet(HttpServletRequest request, Model model) throws Exception {
        int qno = Integer.parseInt(request.getParameter("qno"));
        Qna dto = boardService.qnaGet(qno);
        model.addAttribute("dto", dto);
        return "/qna/qnaDetail";
    }

    @GetMapping("qna/insert.do")
    public String qnaInsertForm(HttpServletRequest request, Model model) throws Exception {
        return "/qna/qnaInsert";
    }

    @PostMapping("qna/insert.do")
    public String qnaInsert(HttpServletRequest request, Model model) throws Exception {
        Qna dto = new Qna();
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        boardService.qnaInsert(dto);
        return "redirect:list.do";
    }

    @GetMapping("qna/delete.do")
    public String qnaDelete(HttpServletRequest request, Model model) throws Exception {
        int qno = Integer.parseInt(request.getParameter("qno"));
        boardService.qnaDelete(qno);

        return "redirect:list.do";
    }

    @GetMapping("qna/update.do")
    public String qnaUpdateForm(HttpServletRequest request, Model model) throws Exception {
        int qno = Integer.parseInt(request.getParameter("qno"));
        Qna dto = boardService.qnaGet(qno);
        model.addAttribute("dto", dto);
        return "qna/qnaEdit";
    }

    @PostMapping("qna/update.do")
    public String qnaUpdate(HttpServletRequest request, Model model) throws Exception {
        Qna dto = new Qna();
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        boardService.qnaUpdate(dto);

        return "redirect:list.do";
    }
}
