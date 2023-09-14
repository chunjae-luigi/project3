package kr.co.tspoon.controller;

import kr.co.tspoon.dto.DataBoard;
import kr.co.tspoon.dto.Qna;
import kr.co.tspoon.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/board/*")
public class BoardController {

    @Autowired
    private BoardService boardService;


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

        model.addAttribute("dto", dto);
        return "/board/dataBoard/dataBoardGet";
    }

    @GetMapping("dataBoardInsert.do")
    public String dataBoardInsertForm(HttpServletRequest request, Model model) throws Exception {
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
        dto.setRelations("dataBoard");
        boardService.dataBoardInsert(dto);

        return "redirect:dataBoardList.do";
    }

    @GetMapping("dataBoardDelete.do")
    public String dataBoardDelete(HttpServletRequest request, Model model) throws Exception {
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
    public String dataBoardUpdate(HttpServletRequest request, Model model) throws Exception {
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
        model.addAttribute("dto", dto);
        return "/board/qna/qnaDetail";
    }

    @GetMapping("qnaInsert.do")
    public String qnaInsertForm(HttpServletRequest request, Model model) throws Exception {
        return "/board/qna/qnaInsert";
    }

    @PostMapping("qnaInsert.do")
    public String qnaInsert(HttpServletRequest request, Model model) throws Exception {
        Qna dto = new Qna();
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        boardService.qnaInsert(dto);
        return "redirect:qnaList.do";
    }

    @GetMapping("qnaDelete.do")
    public String qnaDelete(HttpServletRequest request, Model model) throws Exception {
        int qno = Integer.parseInt(request.getParameter("qno"));
        boardService.qnaDelete(qno);

        return "redirect:qnaList.do";
    }

    @GetMapping("qnaUpdate.do")
    public String qnaUpdateForm(HttpServletRequest request, Model model) throws Exception {
        int qno = Integer.parseInt(request.getParameter("qno"));
        Qna dto = boardService.qnaGet(qno);
        model.addAttribute("dto", dto);
        return "/board/qna/qnaUpdate";
    }

    @PostMapping("qnaUpdate.do")
    public String qnaUpdate(HttpServletRequest request, Model model) throws Exception {
        Qna dto = new Qna();
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        boardService.qnaUpdate(dto);

        return "redirect:qnaList.do";
    }
}
