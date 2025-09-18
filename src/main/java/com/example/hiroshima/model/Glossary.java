package com.example.hiroshima.model;

public class Glossary {
    private int id;
    private String term;
    private String description;
    private String termYomi;
    private String externalLink; // 外部リンク用の変数を追加

    // デフォルトコンストラクタ
    public Glossary() {}

    // 以下、getterとsetter
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

