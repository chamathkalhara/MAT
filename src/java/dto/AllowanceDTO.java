/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
<
 * @author Chamath
 */
public class AllowanceDTO {
    private String aid;
    private String name;
    private String desc;
    private int amount;

    public AllowanceDTO() {
    }

    public AllowanceDTO(String aid, String name, String desc, int amount) {
        this.aid = aid;
        this.name = name;
        this.desc = desc;
        this.amount = amount;
    }

    public String getAid() {
        return aid;
    }

    public void setAid(String aid) {
        this.aid = aid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    
}
