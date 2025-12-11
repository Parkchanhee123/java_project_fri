package org.kio.app.repository;

import org.kio.app.dto.ResDto;
import org.kio.app.frame.KioRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ResRepository extends KioRepository<Integer, ResDto> {
    ResDto findByDoctorId(Integer Id);

}
