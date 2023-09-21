package kr.spring.config;

import javax.servlet.Filter;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

// web.xml의 기능을 담고 있는 클래스를 상속받는다.
public class WebConfig extends AbstractAnnotationConfigDispatcherServletInitializer {
	
	// web.xml을 대체할 java class
	
	@Override
	protected Class<?>[] getRootConfigClasses() {
		// DB설정관련 RootConfig.java파일을 가져온다.
		return new Class[] {RootConfig.class};
	}

	@Override
	protected Filter[] getServletFilters() {
		// 인코딩 설정하는 부분
		CharacterEncodingFilter encodingFilter = new CharacterEncodingFilter();
		encodingFilter.setEncoding("UTF-8");
		encodingFilter.setForceEncoding(true);
		return new Filter[] {encodingFilter};
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		// Servlet 설정 관련있는 ServletConfig.java 파일을 가져온다.
		return new Class[] {ServletConfig.class};
	}

	@Override
	protected String[] getServletMappings() {
		// 
		return new String[] {"/"};
	}
	

}
