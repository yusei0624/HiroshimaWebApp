package com.example.hiroshima.model;

public class Glossary {
    private int id;
    private String term;
    private String description;
    private String termYomi;
    private String externalLink; 

   
    public Glossary() {}

  
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getTerm() {
        return term;
    }
    public void setTerm(String term) {
        this.term = term;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public String getTermYomi() {
        return termYomi;
    }
    public void setTermYomi(String termYomi) {
        this.termYomi = termYomi;
    }
    public String getExternalLink() {
        return externalLink;
    }
    public void setExternalLink(String externalLink) {
        this.externalLink = externalLink;
    }
}

