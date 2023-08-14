package com.spring.tutorial.dto;

import java.sql.Date;

// DTO(Data Transfer Object) : setter > 멤버변수 > getter 
public class CommonDTO {

	private String id; // 사번
	private String pwd; // 비밀번호
	private String repwd; // 비밀번호 확인
	private String name; // 이름
	private String eng_name; // 영문이름
	private String jumin1; // 주민번호 앞자리
	private String jumin2; // 주민번호 뒷자리
	private String gender; // 성별 남성 여성
	private String marry; // 미혼 기혼
	private String frgn; // 내국인 외국인
	private String nation; // 국적
	private String tel; // 휴대전화 010-xxxx-xxxx
	private String in_tel; // 내선전화
	private String email_in; // 사내 이메일 ...@groubee.com
	private String email_out; // 외부 이메일
	private String address; // 주소
	private String depart_name; // 부서명
	private int company_id; // 회사
	private String rank; // 직책명
	private int salary; // 봉급
	private String contract; // 계약직 정규직	
	private Date hireday; // 입사일
	private Date retireday; // 퇴사일
	private String etc; // 비고
	private String sys_rank; // 시스템 직급(기능 접근 제한)
	private String bank; // 은행명
	private String account_number; // 계좌번호
	private String image; // 프로필 사진
	private String sign; // 사인, 인감
	private String state; // 재직 여부 (재직, 휴직, 퇴직)
	private int show; // 노출 여부 (0 : X, 1 : Y)
	// 추가 - 시큐리티
    private String key;   // 이메일인증
    private String authority;  // 권한등급 : ROLE_USER:customer, ROLE_ADMIN:관리자
    private String enabled;  // 계정사용 가능여부(1:사용가능, 0:사용불가) : 이메일인증시 1로 update
	private Date adminhire;
    
	public Date getAdminhire() {
		return adminhire;
	}

	public void setAdminhire(Date adminhire) {
		this.adminhire = adminhire;
	}

	public CommonDTO() {}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getRepwd() {
		return repwd;
	}

	public void setRepwd(String repwd) {
		this.repwd = repwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEng_name() {
		return eng_name;
	}

	public void setEng_name(String eng_name) {
		this.eng_name = eng_name;
	}

	public String getJumin1() {
		return jumin1;
	}

	public void setJumin1(String jumin1) {
		this.jumin1 = jumin1;
	}

	public String getJumin2() {
		return jumin2;
	}

	public void setJumin2(String jumin2) {
		this.jumin2 = jumin2;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getMarry() {
		return marry;
	}

	public void setMarry(String marry) {
		this.marry = marry;
	}

	public String getFrgn() {
		return frgn;
	}

	public void setFrgn(String frgn) {
		this.frgn = frgn;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getIn_tel() {
		return in_tel;
	}

	public void setIn_tel(String in_tel) {
		this.in_tel = in_tel;
	}

	public String getEmail_in() {
		return email_in;
	}

	public void setEmail_in(String email_in) {
		this.email_in = email_in;
	}

	public String getEmail_out() {
		return email_out;
	}

	public void setEmail_out(String email_out) {
		this.email_out = email_out;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDepart_name() {
		return depart_name;
	}

	public void setDepart_name(String depart_name) {
		this.depart_name = depart_name;
	}

	public int getCompany_id() {
		return company_id;
	}

	public void setCompany_id(int company_id) {
		this.company_id = company_id;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	public String getContract() {
		return contract;
	}

	public void setContract(String contract) {
		this.contract = contract;
	}

	public Date getHireday() {
		return hireday;
	}

	public void setHireday(Date hireday) {
		this.hireday = hireday;
	}

	public Date getRetireday() {
		return retireday;
	}

	public void setRetireday(Date retireday) {
		this.retireday = retireday;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	public String getSys_rank() {
		return sys_rank;
	}

	public void setSys_rank(String sys_rank) {
		this.sys_rank = sys_rank;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getAccount_number() {
		return account_number;
	}

	public void setAccount_number(String account_number) {
		this.account_number = account_number;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getShow() {
		return show;
	}

	public void setShow(int show) {
		this.show = show;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public String getEnabled() {
		return enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}

	@Override
	public String toString() {
		return "CommonDTO [id=" + id + ", pwd=" + pwd + ", repwd=" + repwd + ", name=" + name + ", eng_name=" + eng_name
				+ ", jumin1=" + jumin1 + ", jumin2=" + jumin2 + ", gender=" + gender + ", marry=" + marry + ", frgn="
				+ frgn + ", nation=" + nation + ", tel=" + tel + ", in_tel=" + in_tel + ", email_in=" + email_in
				+ ", email_out=" + email_out + ", address=" + address + ", depart_name=" + depart_name + ", company_id="
				+ company_id + ", rank=" + rank + ", salary=" + salary + ", contract=" + contract + ", hireday="
				+ hireday + ", retireday=" + retireday + ", etc=" + etc + ", sys_rank=" + sys_rank + ", bank=" + bank
				+ ", account_number=" + account_number + ", image=" + image + ", sign=" + sign + ", state=" + state
				+ ", show=" + show + ", key=" + key + ", authority=" + authority + ", enabled=" + enabled
				+ ", adminhire=" + adminhire + ", getAdminhire()=" + getAdminhire() + ", getId()=" + getId()
				+ ", getPwd()=" + getPwd() + ", getRepwd()=" + getRepwd() + ", getName()=" + getName()
				+ ", getEng_name()=" + getEng_name() + ", getJumin1()=" + getJumin1() + ", getJumin2()=" + getJumin2()
				+ ", getGender()=" + getGender() + ", getMarry()=" + getMarry() + ", getFrgn()=" + getFrgn()
				+ ", getNation()=" + getNation() + ", getTel()=" + getTel() + ", getIn_tel()=" + getIn_tel()
				+ ", getEmail_in()=" + getEmail_in() + ", getEmail_out()=" + getEmail_out() + ", getAddress()="
				+ getAddress() + ", getDepart_name()=" + getDepart_name() + ", getCompany_id()=" + getCompany_id()
				+ ", getRank()=" + getRank() + ", getSalary()=" + getSalary() + ", getContract()=" + getContract()
				+ ", getHireday()=" + getHireday() + ", getRetireday()=" + getRetireday() + ", getEtc()=" + getEtc()
				+ ", getSys_rank()=" + getSys_rank() + ", getBank()=" + getBank() + ", getAccount_number()="
				+ getAccount_number() + ", getImage()=" + getImage() + ", getSign()=" + getSign() + ", getState()="
				+ getState() + ", getShow()=" + getShow() + ", getKey()=" + getKey() + ", getAuthority()="
				+ getAuthority() + ", getEnabled()=" + getEnabled() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}

	
}
