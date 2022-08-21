package com.ruoyi.project.emmanuel.memorial.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ruoyi.project.emmanuel.memorial.domain.PinBoard;
import org.springframework.ui.ModelMap;

public interface IPinBoardService extends IService<PinBoard> {

    /**
     * 便签列表查询
     *
     * @return
     * @param modelMap
     * @param currentPage
     * @param currentSize
     */
  void selectPinBoardList(ModelMap modelMap, Long currentPage, Long currentSize);

    /**
     * 删除便签
     *
     * @param ids
     */
    Integer deletePinBoardById(String ids);

    /**
     * 新增保存便签墙
     */
    int insertPinBoard(PinBoard pinBoard);

    /**
     * 根据id查询便签
     *
     * @param id 便签id
     * @return
     */
    PinBoard selectPinBoardById(Long id);

    /**
     * 修改便签
     *
     * @param pinBoard 便签
     * @return
     */
    int updatePinBoard(PinBoard pinBoard);
}
