package com.ruoyi.project.emmanuel.account.mapper;

import java.util.List;

import com.ruoyi.project.emmanuel.account.domain.AccountClass;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * 记账分类Mapper接口
 *
 * @author ruoyi
 * @date 2022-01-21
 */
public interface AccountClassMapper {
    /**
     * 查询记账分类
     *
     * @param id 记账分类主键
     * @return 记账分类
     */
    public AccountClass selectAccountClassById(Long id);

    /**
     * 查询记账分类列表
     *
     * @param accountClass 记账分类
     * @return 记账分类集合
     */
    public List<AccountClass> selectAccountClassList(AccountClass accountClass);

    /**
     * 新增记账分类
     *
     * @param accountClass 记账分类
     * @return 结果
     */
    public int insertAccountClass(AccountClass accountClass);

    /**
     * 修改记账分类
     *
     * @param accountClass 记账分类
     * @return 结果
     */
    public int updateAccountClass(AccountClass accountClass);

    /**
     * 删除记账分类
     *
     * @param id 记账分类主键
     * @return 结果
     */
    public int deleteAccountClassById(Long id);

    /**
     * 批量删除记账分类
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAccountClassByIds(String[] ids);

    /**
     * 查询是否已经存在
     *
     * @param accountClass
     * @return
     */
    Integer isExist(AccountClass accountClass);

    @Select("SELECT class_name as  className,id,class_status as classStatus FROM `account_class` where class_type = #{type} ")
    List<AccountClass> selectAccountClassS(@Param("type") String type);

}
