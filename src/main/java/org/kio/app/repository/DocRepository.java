package org.kio.app.repository;

import org.kio.app.dto.DocDto;
import org.kio.app.frame.KioRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface DocRepository extends KioRepository<Integer, DocDto> {
    DocDto findByDoctorId(Integer Id);

}
