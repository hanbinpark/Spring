package kr.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.spring.entity.Board;
import kr.spring.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	private BoardService service;
	// BoardService -> interface
	// BoardServiceImpl -> BoardService로 업캐스팅된다 (다형성) (확장성을 위해)
	
	@PostMapping("/reply")
	public String reply(Board vo) { // 부모글번호, 작성자ID, 제목, 답글내용, 작성자이름
		service.reply(vo);
		return "redirect:/board/list";
	}
	
	@GetMapping("/reply")
	public String reply(@RequestParam("idx")int idx, Model model) {
		Board vo = service.get(idx);
		model.addAttribute("vo", vo);
		return "board/reply";
	}
	
	@GetMapping("/remove")
	public String remove(@RequestParam("idx") int idx) {
		service.remove(idx);
		return "redirect:/board/list";
	}
	
	@PostMapping("/modify")
	public String modify(Board vo) {
		service.modify(vo);
		return "redirect:/board/list";
	}
	
	@GetMapping("/modify")
	public String modify(@RequestParam("idx") int idx, Model model) {
		Board vo = service.get(idx);
		model.addAttribute("vo",vo);
		return "board/modify";
	}
	
	
	@GetMapping("/get")
	public String get(@RequestParam("idx") int idx,Model model) {
		Board vo = service.get(idx);
		model.addAttribute("vo",vo);
		return "board/get";
	}
	
	@PostMapping("/register")
	public String insert(Board vo, RedirectAttributes rttr) {
		//System.out.println(vo.toString());
		service.register(vo);
		//System.out.println(vo.toString());
		rttr.addFlashAttribute("result",vo.getIdx());
		return "redirect:/board/list";
	}
	
	@GetMapping("/register")
	public String register() {
		return "board/register";
	}
	
	@GetMapping("/list")
	public String boardList(Model model) {
		List<Board> list = service.getList();
		model.addAttribute("list",list);
		return "board/list";
	}
	

}
