package com.example.springboot2.controller;

import com.example.springboot2.model.Room;
import com.example.springboot2.service.RoomService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/rooms")
public class RoomRestController {
    private final RoomService roomService;
    public RoomRestController(RoomService roomService) {
        this.roomService = roomService;
    }

    @GetMapping
    private List<Room> getAllRooms() {
        return roomService.getAllRooms();
    }
}
