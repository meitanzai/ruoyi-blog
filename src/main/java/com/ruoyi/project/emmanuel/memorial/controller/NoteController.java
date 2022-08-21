package com.ruoyi.project.emmanuel.memorial.controller;

import com.ruoyi.project.emmanuel.memorial.domain.BoardAgile;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/note")
public class NoteController {

    private String prefix = "emmanuel/memorial";
    @GetMapping()
    public String selectBoardAgileList(ModelMap modelMap, BoardAgile boardAgile) {
        return prefix + "/note_taking";
    }
}
