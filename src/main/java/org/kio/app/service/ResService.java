package org.kio.app.service;

import org.kio.app.dto.ResDto;
import org.kio.app.frame.KioService;
import org.kio.app.repository.ResRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class ResService implements KioService<Integer, ResDto> {

    final ResRepository ResRepository;

    @Override
    public void add(ResDto ResDto) throws Exception {
        ResRepository.insert(ResDto);
    }

    @Override
    public void modify(ResDto ResDto) throws Exception {
        ResRepository.update(ResDto);
    }

    @Override
    public void del(Integer id) throws Exception {
        ResRepository.delete(id);
    }

    @Override
    public ResDto get(Integer s) throws Exception {
        return ResRepository.selectOne(s);
    }

    @Override
    public List<ResDto> get() throws Exception {
        return ResRepository.select();
    }
}