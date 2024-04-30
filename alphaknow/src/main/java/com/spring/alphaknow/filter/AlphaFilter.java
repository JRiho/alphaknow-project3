package com.spring.alphaknow.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.WebFilter;

@WebFilter("/*")
public class AlphaFilter implements Filter {
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // 필터 초기화 시 필요한 코드
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false); // 세션 가져오기 (없으면 null 반환)
        String uri = req.getRequestURI();

        // filter 적용안되면 주석 풀어서 확인하기!
//        System.out.println("필터 적용 확인: " + uri); // 처리 중인 URI 로깅 

        // CSS, JS, 이미지 파일 처리
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
        
        if (uri.contains("project_login.jsp") || uri.contains("/login") || uri.endsWith(".css") || uri.endsWith(".js") || uri.endsWith(".png")) {
            chain.doFilter(req, res); // 요청을 다음 필터나 대상 리소스로 전달
        } else {
            // 로그인 여부 확인
            if (session == null || session.getAttribute("userType") == null) {
                res.sendRedirect(req.getContextPath() + "/login"); // 로그인 페이지로 리다이렉트
            } else {
                // 권한에 따른 접근 제어
                if ((uri.contains("/alphaknow/process/") || uri.contains("/equipment") || uri.contains("/processcode") || uri.contains("/processproduce") || uri.contains("/processproduct")) && !"admin".equals(session.getAttribute("userType"))) {
                    res.sendRedirect(req.getContextPath() + "/accessdenied"); // 접근 거부 페이지로 리다이렉트
                } else {
                    chain.doFilter(req, res); // 요청을 다음 필터나 대상 리소스로 전달 
                }
            }
        }   
    }

    @Override
    public void destroy() {
        // 필터 제거 시 필요한 코드
    }
}
