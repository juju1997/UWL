package com.uwl.service.domain;


public class User {

	private String userId;
	private String name;
	private String password;
	private String nickname;
	private String gender;
	private String birth;
	private int schoolNo;
	private String mail;
	private String phone;
	private String role;
	private String publicStatus; // 프로필 및 위치 공개여부
	private String deleteStatus; // 회원탈퇴 여부
	private String profileName; // 프로필 사진
	private String schoolName; // 학교 이름
	private String selfIntroduction; // 프로필 자기소개

	public User() {
	}

	/**
	 * @return the userId
	 */
	public String getUserId() {
		return userId;
	}

	/**
	 * @param userId the userId to set
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the nickname
	 */
	public String getNickname() {
		return nickname;
	}

	/**
	 * @param nickname the nickname to set
	 */
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	/**
	 * @return the gender
	 */
	public String getGender() {
		return gender;
	}

	/**
	 * @param gender the gender to set
	 */
	public void setGender(String gender) {
		this.gender = gender;
	}

	/**
	 * @return the birth
	 */
	public String getBirth() {
		return birth;
	}

	/**
	 * @param birth the birth to set
	 */
	public void setBirth(String birth) {
		this.birth = birth;
	}

	/**
	 * @return the schoolNo
	 */
	public int getSchoolNo() {
		return schoolNo;
	}

	/**
	 * @param schoolNo the schoolNo to set
	 */
	public void setSchoolNo(int schoolNo) {
		this.schoolNo = schoolNo;
	}

	/**
	 * @return the mail
	 */
	public String getMail() {
		return mail;
	}

	/**
	 * @param mail the mail to set
	 */
	public void setMail(String mail) {
		this.mail = mail;
	}

	/**
	 * @return the phone
	 */
	public String getPhone() {
		return phone;
	}

	/**
	 * @param phone the phone to set
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}

	/**
	 * @return the role
	 */
	public String getRole() {
		return role;
	}

	/**
	 * @param role the role to set
	 */
	public void setRole(String role) {
		this.role = role;
	}

	/**
	 * @return the publicStatus
	 */
	public String getPublicStatus() {
		return publicStatus;
	}

	/**
	 * @param publicStatus the publicStatus to set
	 */
	public void setPublicStatus(String publicStatus) {
		this.publicStatus = publicStatus;
	}

	/**
	 * @return the deleteStatus
	 */
	public String getDeleteStatus() {
		return deleteStatus;
	}

	/**
	 * @param deleteStatus the deleteStatus to set
	 */
	public void setDeleteStatus(String deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

	/**
	 * @return the profileName
	 */
	public String getProfileName() {
		return profileName;
	}

	/**
	 * @param profileName the profileName to set
	 */
	public void setProfileName(String profileName) {
		this.profileName = profileName;
	}

	/**
	 * @return the schoolName
	 */
	public String getSchoolName() {
		return schoolName;
	}

	/**
	 * @param schoolName the schoolName to set
	 */
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}

	/**
	 * @return the selfIntroduction
	 */
	public String getSelfIntroduction() {
		return selfIntroduction;
	}

	/**
	 * @param selfIntroduction the selfIntroduction to set
	 */
	public void setSelfIntroduction(String selfIntroduction) {
		this.selfIntroduction = selfIntroduction;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", name=" + name + ", password=" + password + ", nickname=" + nickname
				+ ", gender=" + gender + ", birth=" + birth + ", schoolNo=" + schoolNo + ", mail=" + mail + ", phone="
				+ phone + ", role=" + role + ", publicStatus=" + publicStatus + ", deleteStatus=" + deleteStatus
				+ ", profileName=" + profileName + ", schoolName=" + schoolName + ", selfIntroduction="
				+ selfIntroduction + "]";
	}

	

}
