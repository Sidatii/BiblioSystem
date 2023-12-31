package models;

import java.util.List;

public class Book {
    private Integer ISBN;
    private Integer tempISBN;
    private String Name;
    private String Author;
    private Integer Year;
    private List<Book> books;
    private Integer Prints_Available;

    public Book(){}
    public Book(Integer isbn, String name, String author, Integer year) {
        this.ISBN = isbn;
        this.Name = name;
        this.Author = author;
        this.Year = year;
    }

    public Integer getISBN(){return ISBN;}
    public void setISBN(Integer isbn){
        this.ISBN = isbn;
    }
    public Integer getTempISBN(){return tempISBN;}
    public void setTempISBN(Integer tempISBN){this.tempISBN = tempISBN;}
    public String getName(){
        return Name;
    }
    public void setName(String name){this.Name = name;}
    public String getAuthor(){
        return Author;
    }
    public void setAuthor(String author){
        this.Author = author;
    }
    public Integer getYear(){
        return Year;
    }
    public void setYear(Integer year){
        this.Year = year;
    }
    public List<Book> getBooks(){
        return books;
    }
    public void setBooks(List<Book> books) {
        this.books = books;
    }
    public Integer getPrints_Available(){return Prints_Available;}

    public void setPrints_Available(Integer prints_Available) {Prints_Available = prints_Available;}
}
