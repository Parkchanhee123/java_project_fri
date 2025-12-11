package org.kio.app.repository;

import org.kio.app.dto.HistoryDto;
import org.kio.app.frame.KioRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
@Mapper
public interface HistoryRepository extends KioRepository<Integer, HistoryDto> {
    List<HistoryDto> selectById(Integer userId);
}