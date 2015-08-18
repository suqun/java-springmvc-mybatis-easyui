package snipe.framework.proxy;

import java.io.IOException;

import javax.servlet.GenericServlet;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

/**
 * 代理
 * 
 * @author qun.su
 * 
 */
public class DelegatingServletProxy extends GenericServlet {

	private static final long serialVersionUID = 229219118811119510L;

	private String targetBean;
	private Servlet proxy;

	public void init() throws ServletException {
		System.out.println("=============================================================proxy init");
		this.targetBean = getInitParameter("targetBean");
		getServletBean();
		proxy.init(getServletConfig());
	}

	public void service(ServletRequest req, ServletResponse res)
			throws ServletException, IOException {

		proxy.service(req, res);

	}

	private void getServletBean() {

		WebApplicationContext wac = WebApplicationContextUtils
				.getRequiredWebApplicationContext(getServletContext());
		this.proxy = (Servlet) wac.getBean(targetBean);

	}

}
