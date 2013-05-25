package md.victordov.lab.authorization;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

public class Authentication extends ActionSupport implements
		ServletRequestAware {
	/**
	 * 
	 */
	private static final long serialVersionUID = -2492886200985397537L;
	private static Logger logger = LogManager.getLogger(Authentication.class);
	private String userName;
	private String pwd;
	private String url;

	private HttpServletRequest request;

	public HttpServletRequest getRequest() {
		return request;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String loginCredentialsCheck() {
		HttpSession session = request.getSession();
		if (request.getHeader("Referer") != null) {
			if (request.getHeader("Referer").indexOf("authentication") == -1) {
				url = request.getHeader("Referer");
				session.setAttribute("refPP", url);
				logger.info("Authentication refer == null: set to --->"
						+ request.getHeader("Referer"));
			} else {
				if (session.getAttribute("refPP") != null) {
					url = (String) session.getAttribute("refPP");
				}
			}

			logger.info("Authentication refer true --->"
					+ request.getHeader("Referer"));
		}
		if (this.getUserName().equals("v") && this.getPwd().equals("v")) {

			logger.info("Refer:" + url);
			logger.debug("Refer:" + url);

			session.setAttribute("authorized", "yes");
			session.removeAttribute("refPP");
			return "success";
		} else {
			addActionError("Please Enter valid login credentials");
			return "failure";
		}
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
}
