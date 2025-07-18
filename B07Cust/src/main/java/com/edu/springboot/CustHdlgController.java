package com.edu.springboot;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.springboot.jdbc.CustHdlgDTO;
import com.edu.springboot.jdbc.ICustHdlgService;
import com.edu.springboot.jdbc.ParameterDTO;
import com.edu.springboot.utils.PagingUtil;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class CustHdlgController {

    @Autowired
    ICustHdlgService dao;

    @GetMapping("/")
    public String home() {
        return "home";
    }

    @RequestMapping("/cust/list")
    public String custList(Model model, HttpServletRequest req, ParameterDTO param) {
        int totalCount = dao.getTotalCount(param);

        int pageSize = 10;
        int blockPage = 5;
        int pageNum = (req.getParameter("pageNum") == null || req.getParameter("pageNum").isEmpty())
                ? 1 : Integer.parseInt(req.getParameter("pageNum"));

        int start = (pageNum - 1) * pageSize + 1;
        int end = pageNum * pageSize;
        param.setStart(start);
        param.setEnd(end);

        Map<String, Object> maps = new HashMap<>();
        maps.put("totalCount", totalCount);
        maps.put("pageSize", pageSize);
        maps.put("pageNum", pageNum);
        model.addAttribute("maps", maps);

        ArrayList<CustHdlgDTO> lists = dao.listPage(param);
        model.addAttribute("lists", lists);

        String pagingImg = PagingUtil.pagingImg(
                totalCount, pageSize, blockPage, pageNum,
                req.getContextPath() + "/cust/list?");
        model.addAttribute("pagingImg", pagingImg);

        return "cust_list";
    }

    @GetMapping("/cust/write.do")
    public String writeForm() {
        return "cust_write";
    }

    @PostMapping("/cust/write.do")
    public String writeSubmit(HttpServletRequest req) {
        CustHdlgDTO dto = new CustHdlgDTO();

        dto.setCustId(req.getParameter("custId"));
        dto.setOcurDttm(req.getParameter("ocurDttm"));
        dto.setLoc(req.getParameter("loc"));
        dto.setTitle(req.getParameter("title"));
        dto.setCtnt(req.getParameter("ctnt"));
        dto.setIsReqRspn(req.getParameter("isReqRspn"));
        dto.setIsUrgt(req.getParameter("isUrgt"));
        dto.setIsDel("N");

        String nowDate = new SimpleDateFormat("yyyyMMdd").format(new Date());
        String nowTime = new SimpleDateFormat("HHmmss").format(new Date());
        String userId = req.getParameter("regUserId");

        dto.setRegDt(nowDate);
        dto.setRegTm(nowTime);
        dto.setRegUserId(userId);
        dto.setUdtDt(nowDate);
        dto.setUdtTm(nowTime);
        dto.setUdtUserId(userId);

        dao.write(dto);
        return "redirect:/cust/list";
    }

    @RequestMapping("/cust/view.do")
    public String view(Model model, CustHdlgDTO dto) {
        dto = dao.view(dto);
        model.addAttribute("dto", dto);
        return "cust_view";
    }

    @GetMapping("/cust/edit.do")
    public String editForm(Model model, CustHdlgDTO dto) {
        dto = dao.view(dto);
        model.addAttribute("dto", dto);
        return "cust_edit";
    }

    @PostMapping("/cust/edit.do")
    public String editSubmit(HttpServletRequest req, CustHdlgDTO dto) {
    	String nowDate = new SimpleDateFormat("yyyyMMdd").format(new Date());
    	String nowTime = new SimpleDateFormat("HHmmss").format(new Date());
        String userId = req.getParameter("udtUserId");

        dto.setUdtDt(nowDate);
        dto.setUdtTm(nowTime);
        dto.setUdtUserId(userId);

        dao.edit(dto);
        return "redirect:/cust/view.do?custPostId=" + dto.getCustPostId();
    }

    @PostMapping("/cust/delete.do")
    public String delete(HttpServletRequest req) {
        String idStr = req.getParameter("custPostId");
        if (idStr == null || idStr.trim().isEmpty()) {
            return "redirect:/cust/list";
        }

        int id = Integer.parseInt(idStr);
        dao.delete(id);
        return "redirect:/cust/list";
    }
}