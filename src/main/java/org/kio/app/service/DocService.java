package org.kio.app.service;

import org.kio.app.dto.DocDto;
import org.kio.app.frame.KioService;
import org.kio.app.repository.DocRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class DocService implements KioService<Integer, DocDto> {

    final DocRepository docRepository;

    @Override
    public void add(DocDto docDto) throws Exception {
        docRepository.insert(docDto);
    }

    @Override
    public void modify(DocDto docDto) throws Exception {
        docRepository.update(docDto);
    }

    @Override
    public void del(Integer id) throws Exception {
        docRepository.delete(id);
    }

    @Override
    public DocDto get(Integer id) throws Exception {
        return docRepository.selectOne(id);
    }

    @Override
    public List<DocDto> get() throws Exception {
        return docRepository.select();
    }
}