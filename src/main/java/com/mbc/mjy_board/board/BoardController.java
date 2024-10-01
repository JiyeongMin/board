package com.mbc.mjy_board.board;

import java.util.ArrayList;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/boardin")
	public String mjy2() {
		
		return "boardinput";
	}
	
	@RequestMapping(value = "/boardsave", method = RequestMethod.POST)
	public String mjy3(HttpServletRequest request) {
		String boardwriter=request.getParameter("boardwriter");
		String boardtitle=request.getParameter("boardtitle");
		String boardcontent=request.getParameter("boardcontent");
		BoardService bs=sqlSession.getMapper(BoardService.class);
		bs.boardinsert(boardwriter,boardtitle,boardcontent);
		return "redirect:./";
	}
	
	//@RequestMapping(value = "/boardout")
	//public String mjy4(Model mo) {
	//	BoardService bs=sqlSession.getMapper(BoardService.class);
	//	ArrayList<BoardDTO> list= bs.outm();
	//	mo.addAttribute("list", list);
	//	return "boardout";
	//}
	
	  @RequestMapping(value="/boardout")
      public String ko16(HttpServletRequest request, PageDTO dto,Model mo) {
         String nowPage=request.getParameter("nowPage");
         String cntPerPage=request.getParameter("cntPerPage");
         BoardService bs = sqlSession.getMapper(BoardService.class);
         //전체레코드수구하기
         int total=bs.total();
         if(nowPage==null && cntPerPage == null) {
            nowPage="1";
            cntPerPage="5";
         }
         else if(nowPage==null) {
            nowPage="1";
         }
         else if(cntPerPage==null) {
            cntPerPage="5";
         }      
         dto=new PageDTO(total,Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
         mo.addAttribute("paging",dto);
         mo.addAttribute("list",bs.page(dto));
         return "boardout";
    
   }//
	  
	@RequestMapping(value = "/detail")
	public String mjy5(Model mo, HttpServletRequest request) {
		int number=Integer.parseInt(request.getParameter("number"));
		//String boardcontent=request.getParameter("boardcontent");
		BoardService bs=sqlSession.getMapper(BoardService.class);
		BoardDTO dto = bs.detail(number);
		mo.addAttribute("dto", dto);
		//mo.addAttribute("number", boardnumber);
		bs.readcnt(number);
		return "detailview";
	}
	

	
	@RequestMapping(value = "/reply")
	public String mjy6(HttpServletRequest request, Model mo) {
		int number=Integer.parseInt(request.getParameter("number"));
		//System.out.println("넘겨받은 글번호: "+number);
		BoardService bs=sqlSession.getMapper(BoardService.class);
		BoardDTO dto =  bs.reply(number);
		mo.addAttribute("dto", dto);
		return "replyview";
	}
	
	@RequestMapping(value = "/replysave", method = RequestMethod.POST)
	public String mjy7(HttpServletRequest request) {
		int boardnumber=Integer.parseInt(request.getParameter("boardnumber"));
		int groups=Integer.parseInt(request.getParameter("groups"));
		int step=Integer.parseInt(request.getParameter("step"));
		int indent=Integer.parseInt(request.getParameter("indent"));
		String boardwriter=request.getParameter("boardwriter");
		String boardtitle=request.getParameter("boardtitle");
		String boardcontent=request.getParameter("boardcontent");
		BoardService bs=sqlSession.getMapper(BoardService.class);
		bs.stepup(groups,step); //어떤 글을 클릭했을 때 step이 증가(댓글,대댓글)
		step++; // step 증가
		indent++; //들여쓰기
		bs.replysave(boardnumber,boardwriter,boardtitle,boardcontent,groups,step,indent); //이처럼 순서대로가 꼭 아니어도 됨
		return "redirect:./";
	}
}
