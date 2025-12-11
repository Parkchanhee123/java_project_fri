package org.kio.app.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ResDto {
    private Integer resId;
    private Integer docId;
    private Integer userId;
    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    private Date resDate;
}
