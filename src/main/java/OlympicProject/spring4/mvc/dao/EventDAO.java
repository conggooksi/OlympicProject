package OlympicProject.spring4.mvc.dao;


import OlympicProject.spring4.mvc.vo.EventVO;

public interface EventDAO {

    EventVO selectOneEvent(String event);
}
