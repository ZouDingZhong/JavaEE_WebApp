package com.zdz.restructurebbs.action;

import com.opensymphony.xwork2.ActionSupport;

public class MainAction extends ActionSupport{
	private String id ;
	private String rootid ;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRootid() {
		return rootid;
	}

	public void setRootid(String rootid) {
		this.rootid = rootid;
	}

	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}

}
