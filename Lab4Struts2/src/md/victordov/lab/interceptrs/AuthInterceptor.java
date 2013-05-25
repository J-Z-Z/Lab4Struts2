package md.victordov.lab.interceptrs;

import java.util.Map;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class AuthInterceptor implements Interceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7984062444261003714L;

	@Override
	public void destroy() {
	}

	@Override
	public void init() {
	}

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		Map<String, Object> sessionAttributes = invocation
				.getInvocationContext().getSession();
		if (sessionAttributes == null
				|| sessionAttributes.get("authorized") == null) {
			return "failure";
		} else if (((String) sessionAttributes.get("authorized")).equals("yes")) {

			return invocation.invoke();

		} else {
			return "failure";
		}

	}

}
