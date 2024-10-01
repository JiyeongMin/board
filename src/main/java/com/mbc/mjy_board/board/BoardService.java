package com.mbc.mjy_board.board;

import java.util.ArrayList;

public interface BoardService {

	public void boardinsert(String boardwriter, String boardtitle, String boardcontent);

	public ArrayList<BoardDTO> outm();

	public BoardDTO detail(int number);

	public void readcnt(int number);

	public BoardDTO reply(int number);

	public void stepup(int groups, int step);

	public void replysave(int boardnumber, String boardwriter, String boardtitle, String boardcontent, int groups,
			int step, int indent);
	////////
	//페이징처리에서 게시글 조회 2222222
    public int total();
    public ArrayList<BoardDTO> page(PageDTO dto);

}
