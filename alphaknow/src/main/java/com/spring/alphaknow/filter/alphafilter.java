package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/*")
public class alphafilter extends HttpFilter implements Filter {
       
    public alphafilter() {
        super();
    }

    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false); // 세션 가져오기 (없으면 null 반환)
        String uri = req.getRequestURI();

        System.out.println("필터 적용 확인: " + uri); // 처리 중인 URI 로깅

        // CSS와 JS 파일에 대한 처리
        if (uri.endsWith(".css")) {
            res.setContentType("text/css; charset=UTF-8");
        } else if (uri.endsWith(".js")) {
            res.setContentType("application/javascript; charset=UTF-8");
        } else if (uri.endsWith(".png")) {
            res.setContentType("image/png");
        } else if (uri.endsWith(".jpg") || uri.endsWith(".jpeg")) {
            res.setContentType("image/jpeg");
        } else if (uri.endsWith(".webp")) {
            res.setContentType("image/webp");
        }

        request.setCharacterEncoding("UTF-8"); // 모든 요청에 대해 UTF-8 인코딩 적용
        
        if (uri.indexOf("project_login.jsp") != -1 || uri.indexOf("/login") != -1|| uri.endsWith(".css") || uri.endsWith(".js")|| uri.endsWith(".png")) {
            chain.doFilter(req, res); // 요청을 다음 필터나 대상 리소스로 전달
        } else {
            // 로그인 여부 확인
            if (session == null || session.getAttribute("userType") == null) {
                res.sendRedirect(req.getContextPath() + "/project_login.jsp");
            } else {
                // 권한에 따른 접근 제어
            	if ((uri.indexOf("/alphaknow/process/") != -1 || uri.indexOf("/equipment") != -1) && !"admin".equals(session.getAttribute("userType"))) {
            	    res.sendRedirect(req.getContextPath() + "/accessDenied.jsp");
            	} else {
            	    chain.doFilter(req, res); // 요청을 다음 필터나 대상 리소스로 전달
            	}
            }
        }   
    } 
}
    


