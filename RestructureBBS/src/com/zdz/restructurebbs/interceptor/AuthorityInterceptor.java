package com.zdz.restructurebbs.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;


public class AuthorityInterceptor extends AbstractInterceptor{

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		ActionContext ctx = invocation.getInvocationContext();
		Map session = ctx.getSession();
		String isAdmin = (String) session.get("adminLogined");
		if(isAdmin != null && isAdmin.equals("true"))
		{
			return invocation.invoke();
		}
		ctx.put("tip","请先获得权限");
		return Action.LOGIN;
	}

}
