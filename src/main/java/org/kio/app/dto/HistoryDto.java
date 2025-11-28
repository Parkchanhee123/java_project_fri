package org.kio.app.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class HistoryDto {
    private Integer hisId;
    private String docId;
    private String userId;
    private Date cosDate;
    private String prescription;
}
