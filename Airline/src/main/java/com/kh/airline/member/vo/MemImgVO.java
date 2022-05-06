package com.kh.airline.member.vo;

import java.util.List;


public class MemImgVO {
	private int memImgCode;
	private String originMemImgName;
	private String attachedMemImgName;
	private String memId;
	private List<MemImgVO> MemImgVO;
	
	public List<MemImgVO> getMemImgVO() {
		return MemImgVO;
	}
	public void setMemImgVO(List<MemImgVO> memImgVO) {
		MemImgVO = memImgVO;
	}
	public int getMemImgCode() {
		return memImgCode;
	}
	public void setMemImgCode(int memImgCode) {
		this.memImgCode = memImgCode;
	}
	public String getOriginMemImgName() {
		return originMemImgName;
	}
	public void setOriginMemImgName(String originMemImgName) {
		this.originMemImgName = originMemImgName;
	}
	public String getAttachedMemImgName() {
		return attachedMemImgName;
	}
	public void setAttachedMemImgName(String attachedMemImgName) {
		this.attachedMemImgName = attachedMemImgName;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	@Override
	public String toString() {
		return "MemImgVO [memImgCode=" + memImgCode + ", originMemImgName=" + originMemImgName + ", attachedMemImgName="
				+ attachedMemImgName + ", memId=" + memId + ", MemImgVO=" + MemImgVO + "]";
	}
}
