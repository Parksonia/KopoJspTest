package utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieManager {

	
	//이름 , value, 유지시간 설정한 쿠키 생성
	
	public static void makeCookie(HttpServletResponse response,String cName,
									String cValue, int cTime) {
		Cookie cookie =new Cookie(cName,cValue);
		cookie.setPath("/");  // 경로를 "/"(=전체경로)로 설정 -> 전체 쿠키를 모두 사용하겠다는 의미
		cookie.setMaxAge(cTime);
		response.addCookie(cookie);
	}
	public static String readCookie(HttpServletRequest request, String cName) {
																//parameter로 받는 cName쿠키 ->내가 찾고싶은쿠키		
		String cookieValue ="";
		Cookie[] cookies =request.getCookies(); //->사용자에게 받은 쿠키 
		if(cookies != null) {
			for(Cookie c :cookies) {
				
				String cookieName =c.getName();
				if(cookieName.equals(cName)){   // 쿠키의 이름은 고유값임 
					cookieValue = c.getValue(); // 리턴값 업데이트
				}
			}
		}
		return cookieValue;
	}
	
	//쿠키 삭제
	public static void deleteCookie (HttpServletResponse response, String cName) {
		makeCookie(response,cName,"",0); // 쿠키생성한 함수를 이용해 유지시간을 0으로 만들어 쿠키 삭제
	}

}
