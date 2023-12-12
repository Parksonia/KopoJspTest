package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException {
		
		req.setAttribute("message", "Hello Servlet");
		req.getRequestDispatcher("/13Servlet/HelloServlet.jsp").forward(req, resp);
		}
	}
	
	/*
	 * MVC =model(데이터 담당), View (화면출력담당),Controller(데이터 처리담당 =>servlet서블릿이함)
	 * 
	 * 
	 * Servlet : JSP 나오기전, 자바 애플리케이션을 개발하도록 담당
	 * 
	 * -클라이언트가 요청에 대한 동적 대응 -controller 역할 -스레드로 동작 (스레드 하나에 개별된 동작) -HttpServlet
	 * 클래스 상속 받음
	 * 
	 * 서블릿관리 ->컨테이너 필요 = 서블릿컨테이너
	 * 
	 * 서블릿컨테이너 역할
	 * 
	 * -통신지원: 포트로 소켓을 열어 I/O 스트림을 생성 -생명주기관리:서블릿을 찾아서 호출-> 사용 후 소멸 -멀티스레딩 관리: 여러 서블릿
	 * 스레드를 생성 및 처리
	 * 
	 * 
	 * =============================================================================
	 * =================================
	 * 
	 * 클라이언트 요청-> 받아서 분석 후 서블릿 서치 -> 비즈니스 로직 호출 -> 모델로 결과값 받아서->
	 * 내장객체(request,session)로 저장한 다음 출력 할 뷰를 찾아 -> 뷰를 클라이언트에게 응답함
	 * 
	 * 
	 * 
	 * =============================================================================
	 * ================================= 서블릿 작성 규칙
	 * 
	 * -javax.servelt,javax.servlet.http, java.io 패키지 임포트 -서블릿 클래스는 꼭 public 으로 선언하고
	 * HttpServlet 을 상속함 -doGet(),doPost()메서드를 오버라이딩하여 요청 처리 -doGet(),doPost()메서드
	 * ServletException,IOException 처리가 되도록 throws 선언 -doGet(),doPost()메서드 호출 시
	 * HttpServletRequest, HttpServletResponse를 사용
	 * =============================================================================
	 * ================================= 서블릿은 클라이언트가 요청한 '요청명' 을 결정하는게 시작임! 요청한 내용을
	 * 찾는 작업을'mapping'매핑.
	 * 
	 * 매핑방법 1.저장해놓고 사용 =>web.xml 에 저장 <servlet> </servlet>
	 * 
	 * 2.코드에서 사용 =>@WebServlet 애너테이션(@) 사용
	 * 
	 * 
	 * 서블릿 객체 생성 -> @PostConstruct 전처리 -> init() (초기화,초기 딱 한번만 처리됨) -> service()
	 * ->doGet() or doPost() ->destroy() ->@PostConstruct 후처리
	 */
