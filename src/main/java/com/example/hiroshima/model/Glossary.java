package com.example.hiroshima.model;

public class Glossary {
    private int id;
    private String term;
    private String description;
    private String termYomi;
    private String imageUrl;
    private String externalLink;

    // デフォルトコンストラクタ
    public Glossary() {}

    // 引数付きコンストラクタ
	public Glossary(int id, String term, String description, String termYomi) {
		this.id = id;
		this.term = term;
		this.description = description;
		this.termYomi = termYomi;
	}
    
    // --- ↓↓↓ toString()メソッドを追加 ↓↓↓ ---
    @Override
    public String toString() {
        return "Glossary [id=" + id + ", term=" + term + ", description=" + description + ", termYomi=" + termYomi + "]";
    }
    // --- ↑↑↑ toString()メソッドを追加 ↑↑↑ ---

    // getterとsetterは省略
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getTerm() { return term; }
    public void setTerm(String term) { this.term = term; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public String getTermYomi() { return termYomi; }
    public void setTermYomi(String termYomi) { this.termYomi = termYomi; }
    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
    public String getExternalLink() { return externalLink; }
    public void setExternalLink(String externalLink) { this.externalLink = externalLink; }
}