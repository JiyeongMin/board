package com.mbc.mjy_board.book;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class BookController {
	String path="C:\\MBC6\\spring\\day10_board\\src\\main\\webapp\\image";
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/bin")
	public String bookhome1() {
		
		return "bookinput";
	}//
	
	@RequestMapping(value = "/booksave", method = RequestMethod.POST)
	public String bookhome2(MultipartHttpServletRequest mul) throws IllegalStateException, IOException {
		String bookname=mul.getParameter("bookname");
		String bookwriter=mul.getParameter("bookwriter");
		String bookcompany=mul.getParameter("bookcompany");
		int bookprice=Integer.parseInt(mul.getParameter("bookprice"));
		String bookdate=mul.getParameter("bookdate");
		String bookcontent=mul.getParameter("bookcontent");
		MultipartFile fm = mul.getFile("bookimage");
		String fname=fm.getOriginalFilename();
		fm.transferTo(new File(path+"\\"+fname));
		BookService bks = sqlSession.getMapper(BookService.class);
		bks.inserta(bookname,bookwriter,bookcompany,bookprice,bookdate,bookcontent,fname);
		
		return "redirect:./";
	}//
	
	//@RequestMapping(value = "/bookout")
	//public String bookhome3(Model mo, HttpServletRequest request) {
	//	BookService bks = sqlSession.getMapper(BookService.class);
	//	ArrayList<BookDTO> booklist = bks.outa();
	//	mo.addAttribute("booklist", booklist);
	//	
	//	return "bookout";
	//}//
	
///////////////
@RequestMapping(value="/bookout")
public String ko16(HttpServletRequest request, BookPageDTO dto,Model mo) {
String nowPage=request.getParameter("nowPage");
String cntPerPage=request.getParameter("cntPerPage");
BookService bks = sqlSession.getMapper(BookService.class);
//전체레코드수구하기
int total=bks.total();
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
dto=new BookPageDTO(total,Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
mo.addAttribute("paging",dto);
mo.addAttribute("booklist",bks.page(dto));
return "bookout";

}//

/////////////
	
	@RequestMapping(value = "/bookdetail")
	public String bookhome4(Model mo, HttpServletRequest request) {
		int bnumber=Integer.parseInt(request.getParameter("bnumber"));
		BookService bks=sqlSession.getMapper(BookService.class);
		BookDTO bdto = bks.bookdetail(bnumber);
		mo.addAttribute("bdto", bdto);
		bks.readcnt(bnumber);
		
		return "bookdetailview";
	}//
	
	@RequestMapping(value = "/bookreply")
	public String bookhome5(HttpServletRequest request, Model mo) {
		int bnumber=Integer.parseInt(request.getParameter("bnumber"));
		BookService bks=sqlSession.getMapper(BookService.class);
		BookDTO bdto = bks.bookreply(bnumber);
		mo.addAttribute("bdto", bdto);
		
		return "bookreplyview";
	}//
	
	@RequestMapping(value = "/bookreplysave", method = RequestMethod.POST)
	public String bookhome6(MultipartHttpServletRequest mul) throws IllegalStateException, IOException {
		int booknumber=Integer.parseInt(mul.getParameter("booknumber"));
		int groups=Integer.parseInt(mul.getParameter("groups"));
		int step=Integer.parseInt(mul.getParameter("step"));
		int indent=Integer.parseInt(mul.getParameter("indent"));
		String bookname=mul.getParameter("bookname");
		String bookwriter=mul.getParameter("bookwriter");
		//1 String bookcompany=mul.getParameter("bookcompany");
		//2 int bookprice=Integer.parseInt(mul.getParameter("bookprice"));
		//3 String bookdate=mul.getParameter("bookdate");
		String bookcontent=mul.getParameter("bookcontent");
		MultipartFile fm = mul.getFile("bookimage");
		String fname=fm.getOriginalFilename();
		fm.transferTo(new File(path+"\\"+fname));
		BookService bks = sqlSession.getMapper(BookService.class);
		bks.stepup(groups,step);
		step++;
		indent++;
		bks.bookreplysave(booknumber,bookname,bookwriter,bookcontent,fname,groups,step,indent);
		
		return "redirect:./";
	}//
	
	@RequestMapping(value = "/bookdelete")
	public String bookhome7(Model mo, HttpServletRequest request) {
		int bnumber = Integer.parseInt(request.getParameter("bnumber"));
		BookService bks = sqlSession.getMapper(BookService.class);
		ArrayList<BookDTO> booklist = bks.bookdelete(bnumber);
		mo.addAttribute("booklist", booklist);
		
		return "bookdeleteview";
	}//
	
	@RequestMapping(value = "/bookdelete2")
	public String book6(Model mo , HttpServletRequest request) {
		int bnumber = Integer.parseInt(request.getParameter("booknumber"));
		BookService bks = sqlSession.getMapper(BookService.class);
		bks.bookdelete2(bnumber);
		
		return "redirect:/bookout";
	}
	
}////////////////
