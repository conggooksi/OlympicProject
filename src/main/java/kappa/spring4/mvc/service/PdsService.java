package kappa.spring4.mvc.service;

import kappa.spring4.mvc.vo.PdsVO;
import org.springframework.web.multipart.MultipartFile;

public interface PdsService {
    boolean newPds(PdsVO pvo, MultipartFile[] file);

    PdsVO readOnePds(String pno);

    PdsVO readOneFname(String pno, String order);

    void countDownPds(String pno, String order);
}
