package edu.sm.app.repository;

import com.github.pagehelper.Page;
import edu.sm.app.dto.ItemDto;
import edu.sm.app.dto.Search;
import edu.sm.app.frame.SMRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ItemRepository extends SMRepository<Integer, ItemDto> {
    List<ItemDto> findByName(String name);
    Page<ItemDto> getPage() throws Exception;
    Page<ItemDto> getFindPage(Search search) throws Exception;
    Page<ItemDto> getFindPageByDate(Search search) throws Exception; // 메서드명 수정
}
