package com.kdt.finalproject.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class MailVO {
    private String from, subject, sentDate, textContent, downloadUrl;
}
