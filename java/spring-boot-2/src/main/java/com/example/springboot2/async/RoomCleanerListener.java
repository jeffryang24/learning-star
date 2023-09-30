package com.example.springboot2.async;

import com.example.springboot2.model.Room;
import com.example.springboot2.service.RoomService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
public class RoomCleanerListener {
    private final static Logger LOGGER = LoggerFactory.getLogger(RoomCleanerListener.class);

    private final ObjectMapper objectMapper;
    private final RoomService roomService;

    public RoomCleanerListener(ObjectMapper objectMapper, RoomService roomService) {
        this.objectMapper = objectMapper;
        this.roomService = roomService;
    }

    public void receiveMessage(String message) {
        try {
            AsyncPayload payload = objectMapper.readValue(message, AsyncPayload.class);
            if ("ROOM".equals(payload.getModel())) {
                Room room = roomService.getById(payload.getId());
                LOGGER.info("Room {}:{} needs to be cleaned", room.getNumber(), room.getName());
            } else {
                LOGGER.warn("Unknown model type");
            }
        } catch (JsonProcessingException e) {
            LOGGER.error("Error", e);
        }
    }
}
