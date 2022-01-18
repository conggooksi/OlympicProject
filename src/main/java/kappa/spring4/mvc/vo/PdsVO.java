package kappa.spring4.mvc.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class PdsVO {
    private String pno;
    private String title;
    private String userid;
    private String regdate;
    private String thumbs;
    private String views;
    private String fname1;
    private String fname2;
    private String fname3;
    private String fsize1;
    private String fsize2;
    private String fsize3;
    private String ftype1;
    private String ftype2;
    private String ftype3;
    private String fdown1;
    private String fdown2;
    private String fdown3;
    private String contents;
    private String uuid;

    public PdsVO(String fname1, String uuid) {
        this.fname1 = fname1;
        this.uuid = uuid;
    }
}
