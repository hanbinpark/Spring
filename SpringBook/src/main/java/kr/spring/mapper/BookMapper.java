package kr.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import kr.spring.entity.Book;



@Mapper 	// MyBatis가 interface를 찾기위해 달아주는 부분
public interface BookMapper {

	public List<Book> getLists();

	public void bookInsert(Book book);

	public void bookDelete(int idx);

	public Book bookContent(int num);

	public void bookUpdate(Book vo);


	
	

}
