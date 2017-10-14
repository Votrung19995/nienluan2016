/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Vo
 */
public class ErrorHandleProfile implements Filter{
       @Override
	public void destroy() {
		// ...
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		//
	}

	@Override
	public void doFilter(ServletRequest request,
                ServletResponse response, FilterChain chain)
		throws IOException, ServletException {
                //Kiem tra xem co dang nhap hay khong:
                HttpServletRequest request1=(HttpServletRequest)request;
                HttpSession session=request1.getSession(true);
                String gt=(String)session.getAttribute("ten");
                if(gt==null || gt==""){
                       request.getRequestDispatcher("/WEB-INF/jsp/error.jsp")
                               .forward(request, response); 
                }
                else{
                    chain.doFilter(request, response);
                }
              
                
		

	}

}
