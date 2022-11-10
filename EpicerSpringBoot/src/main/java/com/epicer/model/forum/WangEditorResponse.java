package com.epicer.model.forum;
import java.util.List;

public class WangEditorResponse {
	private String errno;
	private List<String> data;

	public WangEditorResponse() {
	}

	public WangEditorResponse(String errno, List<String> data) {
		this.errno = errno;
		this.data = data;
	}

	public String getErrno() {
		return errno;
	}

	public void setErrno(String errno) {
		this.errno = errno;
	}

	public List<String> getData() {
		return data;
	}

	public void setData(List<String> data) {
		this.data = data;
	}
}
