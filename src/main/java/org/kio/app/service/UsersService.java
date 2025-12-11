package org.kio.app.service;

import org.kio.app.dto.UsersDto;
import org.kio.app.frame.KioService;
import org.kio.app.repository.UsersRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class UsersService implements KioService<Integer, UsersDto> {

    final UsersRepository usersRepository;

    @Override
    public void add(UsersDto usersDto) throws Exception {
        usersRepository.insert(usersDto);
    }

    @Override
    public void modify(UsersDto usersDto) throws Exception {
        usersRepository.update(usersDto);
    }

    @Override
    public void del(Integer s) throws Exception {
        usersRepository.delete(s);
    }

    @Override
    public UsersDto get(Integer s) throws Exception {
        return usersRepository.selectOne(s);
    }

    @Override
    public List<UsersDto> get() throws Exception {
        return usersRepository.select();
    }

    public UsersDto getByTel(String userTel) throws Exception {
        // [해결 3] Repository에도 selectByTel 메서드가 있어야 함
        return usersRepository.selectTel(userTel);
    }
    // 카카오
    public void addKakaoUser(UsersDto usersDto) throws Exception {
        usersRepository.insertKakaoUser(usersDto);
    }

    public UsersDto findByKakaoId(Integer kakaoId) throws Exception {
        return usersRepository.findByKakaoId(kakaoId);
    }

    public void updateAdditionalInfo(UsersDto usersDto) throws Exception {
        log.info("Updating additional info for user ID: {}", usersDto.getUserId());
        usersRepository.updateAdditionalInfo(usersDto);
    }
}