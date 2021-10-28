package com.gdj37.coronagram.web.coinfo_step.dao;

import java.util.HashMap;
import java.util.List;

public interface IDaoCoinfo_Step {

	public List<HashMap<String, String>> getSteplist(HashMap<String, String> params) throws Throwable;

}
