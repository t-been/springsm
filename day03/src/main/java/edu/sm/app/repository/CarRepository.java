package edu.sm.app.repository;

import com.github.pagehelper.Page;
import edu.sm.app.dto.CarDto;
import edu.sm.app.dto.CustDto;
import edu.sm.app.dto.Search;
import edu.sm.app.frame.SMRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface CarRepository extends SMRepository<Integer, CarDto> {
    List<CarDto> findByName(CarDto carDto);
    Page<CarDto> getpage() throws Exception;
    Page<CarDto> getfindpage(Search search) throws Exception;
}