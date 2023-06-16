package web.dto;

import java.util.Date;

public class ProdReView {
	private int reviewNo;
	private int prodNo;
	private int userNo;
	private int reviewStar;
	private String reviewContents;
	private Date reviewEnroll;
	
	
   public ProdReView() {}


public ProdReView(int reviewNo, int prodNo, int userNo, int reviewStar, String reviewContents, Date reviewEnroll) {
	super();
	this.reviewNo = reviewNo;
	this.prodNo = prodNo;
	this.userNo = userNo;
	this.reviewStar = reviewStar;
	this.reviewContents = reviewContents;
	this.reviewEnroll = reviewEnroll;
}


@Override
public String toString() {
	return "prodReview [reviewNo=" + reviewNo + ", prodNo=" + prodNo + ", userNo=" + userNo + ", reviewStar="
			+ reviewStar + ", reviewContents=" + reviewContents + ", reviewEnroll=" + reviewEnroll + "]";
}


public int getReviewNo() {
	return reviewNo;
}


public void setReviewNo(int reviewNo) {
	this.reviewNo = reviewNo;
}


public int getProdNo() {
	return prodNo;
}


public void setProdNo(int prodNo) {
	this.prodNo = prodNo;
}


public int getUserNo() {
	return userNo;
}


public void setUserNo(int userNo) {
	this.userNo = userNo;
}


public int getReviewStar() {
	return reviewStar;
}


public void setReviewStar(int reviewStar) {
	this.reviewStar = reviewStar;
}


public String getReviewContents() {
	return reviewContents;
}


public void setReviewContents(String reviewContents) {
	this.reviewContents = reviewContents;
}


public Date getReviewEnroll() {
	return reviewEnroll;
}


public void setReviewEnroll(Date reviewEnroll) {
	this.reviewEnroll = reviewEnroll;
}
   
   
}
