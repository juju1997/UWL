package com.uwl.service.imp;

import java.util.Map;

public interface ImpService {

	public Map impInfo(String importId) throws Exception;
	
	public Map impCancel(String importId) throws Exception;
	
	public void getToken() throws Exception;
	
}
