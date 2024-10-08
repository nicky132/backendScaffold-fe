package com.stylefeng.guns.auth.model;

import cn.stylefeng.roses.kernel.auth.api.pojo.auth.LoginResponse;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = true)
public class ExtendedLoginResponse extends LoginResponse {
    private JumpConfig jumpConfig;

    public ExtendedLoginResponse(LoginResponse original) {
        super(original.getUserId(), original.getToken());
        this.setSsoLogin(original.getSsoLogin());
        this.setSsoLoginCode(original.getSsoLoginCode());
        // Copy any other fields from the original LoginResponse
    }

    @Data
    public static class JumpConfig {
        private String errJumpUrl;
        private String testAppUrl;
        private String uatAppUrl;
        private String prodAppUrl;
        private String intranetCheckUrl;
        private Integer timeout;
    }
}