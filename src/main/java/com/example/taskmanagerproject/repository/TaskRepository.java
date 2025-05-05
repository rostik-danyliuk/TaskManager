package com.example.taskmanagerproject.repository;

import com.example.taskmanagerproject.model.Task;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface TaskRepository extends MongoRepository<Task, String> {
}
