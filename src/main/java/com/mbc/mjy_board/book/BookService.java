package com.mbc.mjy_board.book;

import java.util.ArrayList;

public interface BookService {

	public void inserta(String bookname, String bookwriter, String bookcompany, int bookprice, String bookdate,
			String bookcontent, String fname);

	public ArrayList<BookDTO> outa();

	public BookDTO bookdetail(int bnumber);

	public void readcnt(int bnumber);

	

	public void stepup(int groups, int step);

	public BookDTO bookreply(int bnumber);

	public void bookreplysave(int booknumber, String bookname, String bookwriter, String bookcontent, String fname,
			int groups, int step, int indent);

	//페이징처리에서 게시글 조회 2222222
    public int total();
    public ArrayList<BookDTO> page(BookPageDTO dto);

	public ArrayList<BookDTO> bookdelete(int bnumber);

	public void bookdelete2(int bnumber);


	
}
