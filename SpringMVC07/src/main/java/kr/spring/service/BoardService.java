package kr.spring.service;

import java.util.List;

import kr.spring.entity.Board;
import kr.spring.entity.Member;

// Service 클래스에서 사용할 기능의 이름을 정의하는 인터페이스
public interface BoardService {
	
	// 게시글 전체목록 보기 기능
	public List<Board> getList();

	// 로그인 기능
	public Member login(Member vo);
	
	// 게시글 입력 기능
	public void register(Board vo);

	public Board get(int idx);

	public void modify(Board vo);

	public void remove(int idx);

	public void reply(Board vo);
}
