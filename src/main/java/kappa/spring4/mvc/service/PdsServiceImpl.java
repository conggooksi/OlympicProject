package kappa.spring4.mvc.service;

import kappa.spring4.mvc.dao.PdsDAO;
import kappa.spring4.mvc.utils.FileUpDownUtil;
import kappa.spring4.mvc.vo.PdsVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

@Service("psrv")
public class PdsServiceImpl implements PdsService{

    private FileUpDownUtil fudutil;
    private PdsDAO pdao;

    @Autowired
    public PdsServiceImpl(FileUpDownUtil fudutil, PdsDAO pdao) {
        this.fudutil = fudutil;
        this.pdao = pdao;
    }

    //자료실 글쓰기 처리
    @Override
    public boolean newPds(PdsVO pvo, MultipartFile[] file) {
        // 파일 업로드시 사용할 (고유번호) UUID 생성
        String uuid = fudutil.makeUUID();

        // 업로드한 파일 정보를 저장하기 위해 동적배열 생성
        List<String> files = new ArrayList<>();

        // 업로드한 파일을 하나씩 조사해서 업로드하고 파일정보 빼냄
        for(MultipartFile f: file) {
            // 업로드한 파일이 존재한다면
            // procUpload2메서드를 이용해서 업로드 처리후
            // 파일정보(이름, 크기, 종류)를 빼내어 files라는 동적배열에 저장
            if (!f.getOriginalFilename().isEmpty())
                files.add(fudutil.procUpload2(f, uuid));
            else
                // 업로드한 파일이 없다면
                // files라는 동적배열에 '-'만 저장
                files.add("-/-/-");
        }

        // 업로드한 파일정보와 폼데이터 확인
        System.out.println("제목 : " + pvo.getTitle());
        System.out.println("본문 : " + pvo.getContents());
        System.out.println("작성자 : " + pvo.getUserid());
        System.out.println("첨부1 : " + files.get(0));
        System.out.println("첨부2 : " + files.get(1));
        System.out.println("첨부3 : " + files.get(2));
        System.out.println("고유번호 : " + uuid);

        // 업로드한 파일정보를 vo로 나눠 저장
        pvo.setFname1(files.get(0).split("[/]")[0]);
        pvo.setFsize1(files.get(0).split("[/]")[1]);
        pvo.setFtype1(files.get(0).split("[/]")[2]);

        pvo.setFname2(files.get(1).split("[/]")[0]);
        pvo.setFsize2(files.get(1).split("[/]")[1]);
        pvo.setFtype2(files.get(1).split("[/]")[2]);

        pvo.setFname3(files.get(2).split("[/]")[0]);
        pvo.setFsize3(files.get(2).split("[/]")[1]);
        pvo.setFtype3(files.get(2).split("[/]")[2]);

        // 위에서 생성한 uuid를 uuid를 pvo에 저장
        pvo.setUuid(uuid);

        // 전송된 데이터들을 pds 테이블에 저장
        pdao.insertPds(pvo);

        return false;
    }

    // 자료실 목록 출력


    // 자료실 본문보기
    @Override
    public PdsVO readOnePds(String pno) {

        return pdao.selectOnePds(pno);
    }

    // 다운로드할 파일명 알아내기
    @Override
    public PdsVO readOneFname(String pno, String order) {
        return pdao.selectOneFname(pno, order);
    }

    // 다운로드한 파일 다운 수 처리
    @Override
    public void countDownPds(String pno, String order) {
        pdao.updateDownPds(pno, order);
    }
}
