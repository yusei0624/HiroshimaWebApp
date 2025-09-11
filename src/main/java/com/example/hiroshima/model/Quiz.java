package com.example.hiroshima.model;

public class Quiz {
    private int id;
    private String category;
    private String question;
    private String choice1;
    private String choice2;
    private String choice3;
    private int answer;
    private String explanation;
    private String imageUrl;
    private String externalLink;

    
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getCategory() {
        return category;
    }
    public void setCategory(String category) {
        this.category = category;
    }
    public String getQuestion() {
        return question;
    }
    public void setQuestion(String question) {
        this.question = question;
    }
    public String getChoice1() {
        return choice1;
    }
    public void setChoice1(String choice1) {
        this.choice1 = choice1;
    }
    public String getChoice2() {
        return choice2;
    }
    public void setChoice2(String choice2) {
        this.choice2 = choice2;
    }
    public String getChoice3() {
        return choice3;
    }
    public void setChoice3(String choice3) {
        this.choice3 = choice3;
    }
    public int getAnswer() {
        return answer;
    }
    public void setAnswer(int answer) {
        this.answer = answer;
    }
    public String getExplanation() {
        return explanation;
    }
    public void setExplanation(String explanation) {
        this.explanation = explanation;
    }
    public String getImageUrl() { 
    	return imageUrl;
    }
    public void setImageUrl(String imageUrl) {
    	this.imageUrl = imageUrl;
    }
    public String getExternalLink() {
    	return externalLink; 
    }
    public void setExternalLink(String externalLink) {
    	this.externalLink = externalLink; 
    }
}