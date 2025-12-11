package org.kio.app.repository;

import org.kio.app.dto.UsersDto;
import org.kio.app.frame.KioRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface UsersRepository extends KioRepository<Integer, UsersDto> {
    // 카카오 ID로 사용자 조회 메서드
    UsersDto findByKakaoId(Integer kakaoId);

    // 전화번호로 사용자 조회 메서드
    UsersDto selectTel(String userTel);

    // 기본 사용자 정보만 삽입하는 메서드
    
    
    void insertKakaoUser(UsersDto usersDto);
    void updateAdditionalInfo(UsersDto usersDto);

    List<UsersDto> getUsersByPower();

}
