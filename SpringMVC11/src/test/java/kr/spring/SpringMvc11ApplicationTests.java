package kr.spring;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;

import kr.spring.entity.Member;
import kr.spring.entity.Role;
import kr.spring.repository.MemberRepository;

@SpringBootTest
class SpringMvc11ApplicationTests {

   @Autowired
   private MemberRepository memberRepository;
   
   @Autowired
   private PasswordEncoder passwordEncoder;
   
   
   
   
   @Test
   void contextLoads() {
      // 회원가입테스트
      Member m=new Member();
      m.setUsername("phb"); //아이디
      m.setPassword(passwordEncoder.encode("1234"));
      m.setName("한빈");
      m.setRole(Role.MEMBER);
      m.setEbled(true); //삭제한다고 해서 실제로 삭제하는 경우는 많이 없음
      memberRepository.save(m);
   }

}