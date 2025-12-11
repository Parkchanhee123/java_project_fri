package org.kio.app.service;

import org.kio.app.dto.HistoryDto;
import org.kio.app.frame.KioService;
import org.kio.app.repository.HistoryRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class HistoryService implements KioService<Integer, HistoryDto> {

    final HistoryRepository historyRepository;

    @Override
    public void add(HistoryDto historyDto) throws Exception {
        historyRepository.insert(historyDto);
        log.info("진료 기록 등록 완료: {}", historyDto);
    }

    @Override
    public void modify(HistoryDto historyDto) throws Exception {
        historyRepository.update(historyDto);
    }

    @Override
    public void del(Integer id) throws Exception {
        historyRepository.delete(id);
    }

    @Override
    public HistoryDto get(Integer id) throws Exception {
        return historyRepository.selectOne(id);
    }

    @Override
    public List<HistoryDto> get() throws Exception {
        return historyRepository.select();
    }

    public List<HistoryDto> getById(Integer userId) throws Exception {
        return historyRepository.selectById(userId);
    }
}