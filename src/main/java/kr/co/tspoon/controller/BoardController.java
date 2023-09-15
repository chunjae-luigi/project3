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
import javax.servlet.http.HttpSession;
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
    @GetMapping("dataBoardList.do")
    public String dataBoardList(Model model) throws Exception {
        List<DataBoard> boardList = boardService.dataBoardList();
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

    @PostMapping("dataBoardInsert.do")
    public String dataBoardInsert(HttpServletRequest request) throws Exception {
        DataBoard dto = new DataBoard();
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("contents"));

        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("sid");

        dto.setAuthor(id);
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
        model.addAttribute("dto", dto);
        return "/board/dataBoard/dataBoardUpdate";
    }

    @PostMapping("dataBoardUpdate.do")
    public String dataBoardUpdate(HttpServletRequest request) throws Exception {
        DataBoard dto = new DataBoard();
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        boardService.dataBoardUpdate(dto);

        return "redirect:dataBoardList.do";
    }

    // Qna
    @GetMapping("qnaList.do")
    public String qnaList(Model model) throws Exception {
        List<Qna> qnaList = boardService.qnaList();
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
