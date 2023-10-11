package kr.spring.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor // 전체생성자
@NoArgsConstructor	// 기본생성자
@ToString
public class Book {

	private int num;	// 번호
	private String title;	// 제목
	private String author;	// 작가
	private String company;	// 출판사
	private String isbn;	// isbn
	private int count; 	// 보유도서수
	
	
	
}
