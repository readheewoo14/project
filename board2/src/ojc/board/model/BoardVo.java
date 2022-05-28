package ojc.board.model;

import lombok.Data;

@Data
public class BoardVo {
	private String weekId;  
	private String subject;  
	private String deptCode;  
	private String deptNm;  
	private String createId;  
	private String createDate;  
	private String updateDate;  
	private String deleteYn;  
	private String weekRpJobCt;

	private String nxWeekRpJobCt;
	private String weekPlJobCt;
	private String nxWeekPlJobCt;
	private String etcCt;
	private String flag;

	
	public final String getDeptNm() {
		return deptNm;
	}
	public final void setDeptNm(String deptNm) {
		this.deptNm = deptNm;
	}
	public final String getFlag() {
		return flag;
	}
	public final void setFlag(String flag) {
		this.flag = flag;
	}
	public final String getNxWeekRpJobCt() {
		return nxWeekRpJobCt;
	}
	public final void setNxWeekRpJobCt(String nxWeekRpJobCt) {
		this.nxWeekRpJobCt = nxWeekRpJobCt;
	}
	public final String getWeekPlJobCt() {
		return weekPlJobCt;
	}
	public final void setWeekPlJobCt(String weekPlJobCt) {
		this.weekPlJobCt = weekPlJobCt;
	}
	public final String getNxWeekPlJobCt() {
		return nxWeekPlJobCt;
	}
	public final void setNxWeekPlJobCt(String nxWeekPlJobCt) {
		this.nxWeekPlJobCt = nxWeekPlJobCt;
	}
	public final String getEtcCt() {
		return etcCt;
	}
	public final void setEtcCt(String etcCt) {
		this.etcCt = etcCt;
	}
	public final String getWeekId() {
		return weekId;
	}
	public final void setWeekId(String weekId) {
		this.weekId = weekId;
	}
	public final String getSubject() {
		return subject;
	}
	public final void setSubject(String subject) {
		this.subject = subject;
	}
	public final String getDeptCode() {
		return deptCode;
	}
	public final void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}
	public final String getCreateId() {
		return createId;
	}
	public final void setCreateId(String createId) {
		this.createId = createId;
	}
	public final String getCreateDate() {
		return createDate;
	}
	public final void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public final String getUpdateDate() {
		return updateDate;
	}
	public final void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public final String getDeleteYn() {
		return deleteYn;
	}
	public final void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}
	public final String getWeekRpJobCt() {
		return weekRpJobCt;
	}
	public final void setWeekRpJobCt(String weekRpJobCt) {
		this.weekRpJobCt = weekRpJobCt;
	}  
	
	
	

}
