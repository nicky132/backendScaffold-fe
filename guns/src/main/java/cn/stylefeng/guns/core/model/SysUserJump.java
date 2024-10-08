package cn.stylefeng.guns.core.model;

import cn.stylefeng.roses.kernel.db.api.pojo.entity.BaseExpandFieldEntity;
import cn.stylefeng.roses.kernel.rule.annotation.ChineseDescription;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName(value = "sys_user_jump", autoResultMap = true)
public class SysUserJump extends BaseExpandFieldEntity {

    @TableId(
            value = "id",
            type = IdType.ASSIGN_ID
    )
    
    @ChineseDescription("主键")
    private Long id;

    @TableField("user_id")
    private Long userId;

    @TableField("sys_id")
    private String sysId;

    @TableField("err_jump_url")
    private String errJumpUrl;

    @TableField("test_app_url")
    private String testAppUrl;

    @TableField("uat_app_url")
    private String uatAppUrl;

    @TableField("prod_app_url")
    private String prodAppUrl;

    @TableField("intranet_check_url")
    private String intranetCheckUrl;

    @TableField("timeout")
    private Integer timeout;

}
