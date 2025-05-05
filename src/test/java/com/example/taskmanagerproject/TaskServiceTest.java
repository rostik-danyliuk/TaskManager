package com.example.taskmanagerproject;

import com.example.taskmanagerproject.model.Task;
import com.example.taskmanagerproject.repository.TaskRepository;
import com.example.taskmanagerproject.service.TaskService;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.*;

public class TaskServiceTest {
    @Test
    void testGetAllTasks() {
        TaskRepository repository = mock(TaskRepository.class);
        when(repository.findAll()).thenReturn(List.of(new Task("Test", "Description", "TODO")));

        TaskService service = new TaskService(repository);
        List<Task> tasks = service.getAllTasks();

        assertEquals(1, tasks.size());
        assertEquals("Test", tasks.get(0).getTitle());
    }
}

